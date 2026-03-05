param(
    [string]$SourcePath = '.\SOURCE.md',
    [string]$DocsDir = '.\docs',
    [string]$ReadmePath = '.\README.md',
    [ValidateSet(1,2,3)]
    [int]$SplitDepth = 1,
    [switch]$DisableTableFix
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Ensure-Dir([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function SafeName([string]$s, [int]$MaxLen = 60) {
    if ($null -eq $s) { $s = '' }
    $s = $s.Trim().ToLowerInvariant()

    # 余計な記号を削る（クォート系は分けて消すと壊れにくい）
    $s = $s -replace '"', ''
    $s = $s -replace "'", ''
    $s = $s -replace '[\(\)\[\]\{\}]', ''
    $s = $s -replace '[^a-z0-9]+', '-'
    $s = $s -replace '-{2,}', '-'
    $s = $s.Trim('-')

    if ($s.Length -gt $MaxLen) {
        $s = $s.Substring(0, $MaxLen).Trim('-')
    }
    if ([string]::IsNullOrWhiteSpace($s)) { return 'untitled' }
    return $s
}

function Is-UnitOnlyTitle([string]$titleText) {
    if ($null -eq $titleText) { return $false }
    $t = $titleText.Trim()
    if ($t.Length -eq 0) { return $true }

    if ($t -notmatch '(?i)\b(hz|khz|mhz|ghz|gbps|mbps|kbps|bps|gb/s|mb/s|kb/s)\b') {
        return $false
    }

    $x = $t.ToLowerInvariant()
    $x = $x -replace '[0-9\.\;\,\*\(\)\[\]\-\/]+', ' '
    $x = $x -replace '\b(hz|khz|mhz|ghz|gbps|mbps|kbps|bps|gb/s|mb/s|kb/s)\b', ' '
    $x = $x -replace '\b(or|and|to|is|are|of|the|a|an|in|on|for|with|without|note|default)\b', ' '
    $x = $x -replace '\s+', ' '
    return ($x.Trim().Length -eq 0)
}

function Split-PackedRegisterLine([string]$line) {
    $m = [regex]::Matches($line, '0x[0-9a-fA-F]+')
    if ($m.Count -lt 2) { return @($line) }
    $parts = [regex]::Split($line, '(?=0x[0-9a-fA-F]+\s)')
    $out = @()
    foreach ($p in $parts) {
        $q = $p.Trim()
        if (-not [string]::IsNullOrWhiteSpace($q)) { $out += $q }
    }
    if ($out.Count -eq 0) { return @($line) }
    return $out
}

function Fix-Tables([string[]]$lines) {
    $CODE_FENCE = '```'
    $out = New-Object System.Collections.Generic.List[string]

    $i = 0
    while ($i -lt $lines.Count) {
        $line = $lines[$i]

        # 1) Revision History（箇条書き） -> Markdown表
        if ($line -match '^\s*1\.\s+Revision History\s*$') {
            $out.Add($line) | Out-Null
            $j = $i + 1

            if (($j + 2) -lt $lines.Count -and
                $lines[$j].Trim() -eq '- Version' -and
                $lines[$j + 1].Trim() -eq '- Date' -and
                $lines[$j + 2].Trim() -eq '- Description of Change') {

                $out.Add('') | Out-Null
                $out.Add('| Version | Date | Description of Change |') | Out-Null
                $out.Add('| --- | --- | --- |') | Out-Null

                $j = $j + 3
                while ($j -lt $lines.Count) {
                    $v = $lines[$j].Trim()
                    if ([string]::IsNullOrWhiteSpace($v)) { $j++; continue }
                    if ($v -match '^\s*##\s+') { break }

                    if ($v -match '^\d+(?:\.\d+)*$') {
                        $version = $v
                        $date = ''
                        $descParts = @()
                        $j++

                        if ($j -lt $lines.Count -and $lines[$j].Trim().StartsWith('- ')) {
                            $date = $lines[$j].Trim().Substring(2).Trim()
                            $j++
                        }

                        while ($j -lt $lines.Count) {
                            $tt = $lines[$j].Trim()
                            if ([string]::IsNullOrWhiteSpace($tt)) { $j++; break }
                            if ($tt -match '^\d+(?:\.\d+)*$') { break }
                            if ($tt -match '^\s*##\s+') { break }

                            if ($tt.StartsWith('- ')) {
                                $descParts += $tt.Substring(2).Trim()
                            } else {
                                $descParts += $tt
                            }
                            $j++
                        }

                        $desc = (($descParts -join ' ') -replace '\s{2,}', ' ').Trim()
                        $out.Add(('| {0} | {1} | {2} |' -f $version, $date, $desc)) | Out-Null
                        continue
                    }

                    $j++
                }

                $out.Add('') | Out-Null
                $i = $j
                continue
            }
        }

        # 2) Glossary（Term/Definition） -> Markdown表
        if ($line -match '^\s*###\s+\d+(?:\.\d+)*\s+Glossary\s*$') {
            $out.Add($line) | Out-Null
            $j = $i + 1

            if (($j + 1) -lt $lines.Count -and
                $lines[$j].Trim() -eq '- Term' -and
                $lines[$j + 1].Trim() -eq '- Definition') {

                $out.Add('') | Out-Null
                $out.Add('| Term | Definition |') | Out-Null
                $out.Add('| --- | --- |') | Out-Null

                $j = $j + 2
                $currentTerm = $null
                $defParts = @()

                function Flush-GlossaryRow {
                    param([ref]$termRef, [ref]$defRef, [System.Collections.Generic.List[string]]$outRef)
                    if ($null -ne $termRef.Value) {
                        $t = $termRef.Value.Trim()
                        $d = (($defRef.Value -join ' ') -replace '\s{2,}', ' ').Trim()
                        if (-not [string]::IsNullOrWhiteSpace($t)) {
                            $outRef.Add(('| {0} | {1} |' -f $t, $d)) | Out-Null
                        }
                    }
                    $termRef.Value = $null
                    $defRef.Value = @()
                }

                while ($j -lt $lines.Count) {
                    $tt = $lines[$j].Trim()

                    if ($tt -match '^\s*###\s+' -or $tt -match '^\s*##\s+') { break }
                    if ($tt -eq '- Term' -or $tt -eq '- Definition') { $j++; continue }

                    if ([string]::IsNullOrWhiteSpace($tt)) {
                        Flush-GlossaryRow -termRef ([ref]$currentTerm) -defRef ([ref]$defParts) -outRef $out
                        $j++
                        continue
                    }

                    if ($tt.StartsWith('- ')) {
                        Flush-GlossaryRow -termRef ([ref]$currentTerm) -defRef ([ref]$defParts) -outRef $out
                        $currentTerm = $tt.Substring(2).Trim()
                        $defParts = @()
                        $j++
                        continue
                    }

                    $defParts += $tt
                    $j++
                }

                Flush-GlossaryRow -termRef ([ref]$currentTerm) -defRef ([ref]$defParts) -outRef $out
                $out.Add('') | Out-Null
                $i = $j
                continue
            }
        }

        # 3) Bit/Reset/Description（潰れがち） -> code block + 0x...分割
        if ($line.Trim() -eq '- Bit' -and
            ($i + 2) -lt $lines.Count -and
            $lines[$i + 1].Trim() -eq '- Reset' -and
            $lines[$i + 2].Trim() -eq '- Description') {

            $out.Add($CODE_FENCE) | Out-Null
            $out.Add('Bit    Reset    Description') | Out-Null
            $out.Add('----   -----    -----------') | Out-Null

            $k = $i + 3
            while ($k -lt $lines.Count) {
                $tt = $lines[$k].TrimEnd()
                if ([string]::IsNullOrWhiteSpace($tt)) { break }
                if ($tt -match '^\s*##\s+' -or $tt -match '^\s*###\s+') { break }

                $x = $tt.Trim()
                if ($x.StartsWith('- ')) { $x = $x.Substring(2).Trim() }

                $split = Split-PackedRegisterLine -line $x
                foreach ($s in $split) { $out.Add($s) | Out-Null }
                $k++
            }

            $out.Add($CODE_FENCE) | Out-Null
            $out.Add('') | Out-Null
            $i = $k
            continue
        }

        $out.Add($line) | Out-Null
        $i++
    }

    return $out.ToArray()
}

# ---- Main ----
if (-not (Test-Path -LiteralPath $SourcePath)) {
    throw ('SOURCE.md not found: {0}' -f $SourcePath)
}

Ensure-Dir -Path $DocsDir

$raw = Get-Content -LiteralPath $SourcePath -Encoding UTF8
$lines = $raw
if (-not $DisableTableFix) {
    $lines = Fix-Tables -lines $raw
}

# 章タイトル辞書（可能なら "2. Getting Started" みたいな行から取る）
$chapterTitle = @{}
$plainChapterRe = '^\s*(1|2|3|4|5|6|7|8|9|10|11)\.\s+(.+?)\s*$'
for ($i = 0; $i -lt $lines.Count; $i++) {
    $l = $lines[$i]
    $m = [regex]::Match($l, $plainChapterRe)
    if ($m.Success) {
        $c = [int]$m.Groups[1].Value
        $t = $m.Groups[2].Value.Trim()
        if (-not $chapterTitle.ContainsKey($c)) {
            if (-not (Is-UnitOnlyTitle $t)) {
                $chapterTitle[$c] = $t
            }
        }
    }
}

# Split結果（sections）
$sections = New-Object System.Collections.Generic.List[object]
$current = $null

function New-Section([string]$numText, [string]$titleText) {
    $obj = [PSCustomObject]@{
        Num = $numText
        Title = $titleText
        Lines = New-Object System.Collections.Generic.List[string]
    }
    return $obj
}

function Start-Chapter([int]$chap) {
    if ($current -ne $null) { $sections.Add($current) | Out-Null }

    $t = ''
    if ($chapterTitle.ContainsKey($chap)) { $t = $chapterTitle[$chap] }
    if ([string]::IsNullOrWhiteSpace($t)) { $t = ('Chapter {0}' -f $chap) }

    $script:current = New-Section -numText ([string]$chap) -titleText $t
    $script:current.Lines.Add(('# {0}. {1}' -f $chap, $t)) | Out-Null
    $script:current.Lines.Add('') | Out-Null
}

function Start-Subsection([string]$numText, [string]$titleText, [string]$headingLine) {
    if ($current -ne $null) { $sections.Add($current) | Out-Null }
    $script:current = New-Section -numText $numText -titleText $titleText
    $script:current.Lines.Add($headingLine) | Out-Null
}

# 見出し検出（Markdown見出しのみ。本文の "1." に誤爆しない）
$mdHeadingRe = '^\s*#{1,6}\s+(\d+(?:\.\d+)+)\s*(.*)\s*$'
$mdHeadingRe2 = '^\s*#{1,6}\s+(\d+(?:\.\d+){0,2})\s+(.*)\s*$'

$currentChap = $null

for ($idx = 0; $idx -lt $lines.Count; $idx++) {
    $line = $lines[$idx]

    # SplitDepth=1: "## 3.1 ..." などから章番号(3)を取り、章ごとにまとめる
    if ($SplitDepth -eq 1) {
        $m = [regex]::Match($line, $mdHeadingRe)
        if ($m.Success) {
            $numFull = $m.Groups[1].Value
            $titlePart = $m.Groups[2].Value
            if ($null -eq $titlePart) { $titlePart = '' }
            $titlePart = $titlePart.Trim()

            $chapText = ($numFull -split '\.')[0]
            $chap = [int]$chapText

            if ($chap -ge 1 -and $chap -le 11) {
                if (-not (Is-UnitOnlyTitle $titlePart)) {
                    if ($null -eq $currentChap -or $currentChap -ne $chap) {
                        Start-Chapter -chap $chap
                        $currentChap = $chap
                    }
                }
            }
        }

        if ($current -eq $null) {
            $current = New-Section -numText '0' -titleText 'Preamble'
            $current.Lines.Add('# 0. Preamble') | Out-Null
            $current.Lines.Add('') | Out-Null
        }

        $current.Lines.Add($line) | Out-Null
        continue
    }

    # SplitDepth=2 or 3: 既存の "## x.x ..." / "## x.x.x ..." で分割
    if ($line -match $mdHeadingRe2) {
        $num = $Matches[1]
        $title = $Matches[2].Trim()

        # "10.28 Gbps" みたいな偽見出しは無視（ただの行として扱う）
        $depth = ($num -split '\.').Count
        if ($depth -ge 2 -and (Is-UnitOnlyTitle $title)) {
            if ($current -ne $null) { $current.Lines.Add($line) | Out-Null }
            continue
        }

        if ($depth -eq $SplitDepth) {
            Start-Subsection -numText $num -titleText $title -headingLine $line
            continue
        }
    }

    if ($current -eq $null) {
        $current = New-Section -numText '0' -titleText 'Preamble'
        $current.Lines.Add('## 0 Preamble') | Out-Null
    }

    $current.Lines.Add($line) | Out-Null
}

if ($current -ne $null) { $sections.Add($current) | Out-Null }

# ---- Write docs ----
# 生成物を掃除
Remove-Item -LiteralPath $DocsDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DocsDir | Out-Null

$index = New-Object System.Collections.Generic.List[string]
$index.Add('# TRM (Markdown)') | Out-Null
$index.Add('') | Out-Null
$index.Add('> Generated from SOURCE.md') | Out-Null
$index.Add('') | Out-Null
$index.Add('## Contents') | Out-Null
$index.Add('') | Out-Null

foreach ($s in $sections) {
    $num = $s.Num
    $title = $s.Title

    if ($num -eq '0') {
        $slug = '00_preamble'
    } else {
        $n = [int]$num
        $slug = ('{0:D2}_{1}' -f $n, (SafeName $title 50))
    }

    $file = Join-Path $DocsDir ($slug + '.md')
    Set-Content -LiteralPath $file -Encoding UTF8 -Value ($s.Lines -join "`n")

    $rel = $file -replace '^[.\\\/]+', ''
    $rel = $rel -replace '\\', '/'

    if ($num -eq '0') {
        $index.Add(('- [Preamble]({0})' -f $rel)) | Out-Null
    } else {
        $index.Add(('- [{0}. {1}]({2})' -f $num, $title, $rel)) | Out-Null
    }
}

Set-Content -LiteralPath $ReadmePath -Encoding UTF8 -Value ($index -join "`n")
Write-Host ('Done. Wrote {0} files to {1} and rebuilt {2}' -f $sections.Count, $DocsDir, $ReadmePath)