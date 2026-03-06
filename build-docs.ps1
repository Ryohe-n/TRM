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
    if ($null -eq $titleText) { return $true }

    $t = $titleText.Trim()
    if ([string]::IsNullOrWhiteSpace($t)) { return $true }

    # 数字始まりはかなり危険（1.8 V / 10.28 Gbps など）
    if ($t -match '^\d') {
        return $true
    }

    # 単位だけ系
    if ($t -match '(?i)\b(hz|khz|mhz|ghz|gsps|gbps|mbps|kbps|bps|v|mv|uv|gt/s|ms|us|ns|ps)\b') {
        $x = $t.ToLowerInvariant()
        $x = $x -replace '[0-9\.\;\,\*\(\)\[\]\-\/]+', ' '
        $x = $x -replace '\b(hz|khz|mhz|ghz|gsps|gbps|mbps|kbps|bps|v|mv|uv|gt/s|ms|us|ns|ps)\b', ' '
        $x = $x -replace '\b(or|and|to|is|are|of|the|a|an|in|on|for|with|without|note|default|equalization|case|operating|port)\b', ' '
        $x = $x -replace '\s+', ' '
        if ($x.Trim().Length -eq 0) {
            return $true
        }
    }

    # 明らかにおかしい短文
    if ($t.Length -lt 3) { return $true }

    return $false
}

if (-not (Test-Path -LiteralPath $SourcePath)) {
    throw "SOURCE.md not found: $SourcePath"
}

$lines = Get-Content -LiteralPath $SourcePath -Encoding UTF8

# 既存出力を掃除
Remove-Item -LiteralPath $DocsDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DocsDir | Out-Null

# 章タイトルは固定
$ChapterTitles = @{
    1  = "Introduction"
    2  = "Memory Architecture and Memory Mapped I/O"
    3  = "Boot and Power Management"
    4  = "System Components"
    5  = "CPU Complex (CCPLEX)"
    6  = "GPU"
    7  = "Multimedia Complex"
    8  = "Computer Vision Acceleration"
    9  = "I/O Controllers and Interfaces"
    10 = "Functional Safety"
    11 = "Registers"
}

# 分割対象は H2 の x.x のみ
# 例: ## 7.1 Host Controller
$SectionHeadingRe = '^\s*##\s+((1|2|3|4|5|6|7|8|9|10|11)\.(\d+))\s+(.*\S)\s*$'

$sections = New-Object System.Collections.Generic.List[object]
$current = $null

function Flush-Current {
    if ($script:current -ne $null) {
        $sections.Add($script:current) | Out-Null
        $script:current = $null
    }
}

function New-SectionObject([int]$chapter, [string]$sectionKey, [string]$sectionTitle) {
    return [PSCustomObject]@{
        Chapter = $chapter
        SectionKey = $sectionKey
        SectionTitle = $sectionTitle
        Lines = New-Object System.Collections.Generic.List[string]
    }
}

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    $m = [regex]::Match($line, $SectionHeadingRe)

    if ($m.Success) {
        $sectionKey = $m.Groups[1].Value
        $chapter = [int]$m.Groups[2].Value
        $title = $m.Groups[4].Value.Trim()

        if (-not (IsNoiseHeading $title)) {
            Flush-Current
            $current = New-SectionObject -chapter $chapter -sectionKey $sectionKey -sectionTitle $title
            $current.Lines.Add(("# {0} {1}" -f $sectionKey, $title)) | Out-Null
            continue
        }
    }

    if ($current -ne $null) {
        $current.Lines.Add($line) | Out-Null
    }
}

Flush-Current

# README 生成
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

    $chapterTitle = $ChapterTitles[$chapter]
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