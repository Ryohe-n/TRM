param(
    [string]$SourcePath = ".\SOURCE.md",
    [string]$DocsDir = ".\docs",
    [string]$ReadmePath = ".\README.md"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function SafeName([string]$s, [int]$MaxLen = 40) {
    if ($null -eq $s) { $s = "" }
    $s = $s.Trim().ToLowerInvariant()
    $s = $s -replace '"', ''
    $s = $s -replace "'", ''
    $s = $s -replace '[\(\)\[\]\{\}]', ''
    $s = $s -replace '[^a-z0-9]+', '-'
    $s = $s -replace '-{2,}', '-'
    $s = $s.Trim('-')

    if ($s.Length -gt $MaxLen) {
        $s = $s.Substring(0, $MaxLen).Trim('-')
    }

    if ([string]::IsNullOrWhiteSpace($s)) {
        return "untitled"
    }

    return $s
}

function IsNoiseHeading([string]$titleText) {
    if ($null -eq $titleText) { return $false }

    $t = $titleText.Trim()
    if ([string]::IsNullOrWhiteSpace($t)) { return $false }

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

function GetChapterTitle([int]$chapter, $chapterTitleMap) {
    if ($chapterTitleMap.ContainsKey($chapter)) {
        return $chapterTitleMap[$chapter]
    }
    return "Chapter $chapter"
}

if (-not (Test-Path -LiteralPath $SourcePath)) {
    throw "SOURCE.md not found: $SourcePath"
}

$lines = Get-Content -LiteralPath $SourcePath -Encoding UTF8

# 既存出力を掃除
Remove-Item -LiteralPath $DocsDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DocsDir | Out-Null

# 章タイトルを拾う（プレーンな「3. Memory...」行）
$chapterTitleMap = @{}
$plainChapterRe = '^\s*(1|2|3|4|5|6|7|8|9|10|11)\.\s+(.+?)\s*$'

for ($i = 0; $i -lt $lines.Count; $i++) {
    $m = [regex]::Match($lines[$i], $plainChapterRe)
    if ($m.Success) {
        $chapterNum = [int]$m.Groups[1].Value
        $title = $m.Groups[2].Value.Trim()

        if (-not $chapterTitleMap.ContainsKey($chapterNum)) {
            if (-not (IsNoiseHeading $title)) {
                $chapterTitleMap[$chapterNum] = $title
            }
        }
    }
}

# Markdown見出し
# 例:
# ## 7.1 Host Controller
# ### 7.1.2 Functional Description
# #### 7.1.2.1 Channels
$headingRe = '^\s*(#{1,6})\s+(\d+(?:\.\d+)+)\s*(.*)\s*$'

# セクション保持
$sections = New-Object System.Collections.Generic.List[object]

$current = $null

function Flush-Current {
    if ($script:current -ne $null) {
        $sections.Add($script:current) | Out-Null
        $script:current = $null
    }
}

function New-SectionObject([int]$chapter, [string]$sectionKey, [string]$sectionTitle, [string]$chapterTitle) {
    return [PSCustomObject]@{
        Chapter = $chapter
        ChapterTitle = $chapterTitle
        SectionKey = $sectionKey
        SectionTitle = $sectionTitle
        Lines = New-Object System.Collections.Generic.List[string]
    }
}

# SOURCE.mdは最初から ## x.x が主なので、ここを分割点にする
for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    $m = [regex]::Match($line, $headingRe)

    if ($m.Success) {
        $num = $m.Groups[2].Value
        $title = $m.Groups[3].Value.Trim()

        if (-not (IsNoiseHeading $title)) {
            $parts = $num.Split('.')

            if ($parts.Count -ge 2) {
                $chapter = [int]$parts[0]

                # 1..11章だけ対象
                if ($chapter -ge 1 -and $chapter -le 11) {
                    # x.x だけを新規ファイル開始点にする
                    if ($parts.Count -eq 2) {
                        Flush-Current

                        $chapterTitle = GetChapterTitle -chapter $chapter -chapterTitleMap $chapterTitleMap
                        $current = New-SectionObject -chapter $chapter -sectionKey $num -sectionTitle $title -chapterTitle $chapterTitle
                        $current.Lines.Add(("# {0} {1}" -f $num, $title)) | Out-Null
                        continue
                    }
                }
            }
        }
    }

    if ($current -ne $null) {
        $current.Lines.Add($line) | Out-Null
    }
}

Flush-Current

# 章フォルダごとに出力
$chapterIndexMap = @{}
$rootIndex = New-Object System.Collections.Generic.List[string]
$rootIndex.Add("# Orin TRM") | Out-Null
$rootIndex.Add("") | Out-Null
$rootIndex.Add("## Chapters") | Out-Null
$rootIndex.Add("") | Out-Null

for ($chapter = 1; $chapter -le 11; $chapter++) {
    $chapterSections = @($sections | Where-Object { $_.Chapter -eq $chapter })

    if ($chapterSections.Count -eq 0) {
        continue
    }

    $chapterTitle = GetChapterTitle -chapter $chapter -chapterTitleMap $chapterTitleMap
    $chapterDirName = "{0:D2}_{1}" -f $chapter, (SafeName $chapterTitle 28)
    $chapterDirPath = Join-Path $DocsDir $chapterDirName
    Ensure-Dir $chapterDirPath

    $rootIndex.Add(("### {0}. {1}" -f $chapter, $chapterTitle)) | Out-Null

    $chapterIndex = New-Object System.Collections.Generic.List[string]
    $chapterIndex.Add(("# {0}. {1}" -f $chapter, $chapterTitle)) | Out-Null
    $chapterIndex.Add("") | Out-Null
    $chapterIndex.Add("## Sections") | Out-Null
    $chapterIndex.Add("") | Out-Null

    foreach ($sec in $chapterSections) {
        $fileName = "{0}_{1}.md" -f $sec.SectionKey, (SafeName $sec.SectionTitle 32)
        $filePath = Join-Path $chapterDirPath $fileName

        Set-Content -LiteralPath $filePath -Encoding UTF8 -Value ($sec.Lines -join "`n")

        $relativePath = ("docs/{0}/{1}" -f $chapterDirName, $fileName) -replace '\\', '/'
        $rootIndex.Add(("- [{0} {1}]({2})" -f $sec.SectionKey, $sec.SectionTitle, $relativePath)) | Out-Null
        $chapterIndex.Add(("- [{0} {1}]({2})" -f $sec.SectionKey, $sec.SectionTitle, $fileName)) | Out-Null
    }

    $chapterIndexPath = Join-Path $chapterDirPath "index.md"
    Set-Content -LiteralPath $chapterIndexPath -Encoding UTF8 -Value ($chapterIndex -join "`n")

    $rootIndex.Add("") | Out-Null
}

Set-Content -LiteralPath $ReadmePath -Encoding UTF8 -Value ($rootIndex -join "`n")

Write-Host ("Done. Wrote {0} section files." -f $sections.Count)