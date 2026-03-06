param(
    [string]$SourcePath = ".\SOURCE.md",
    [string]$DocsDir = ".\docs",
    [string]$ReadmePath = ".\README.md"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) {
    if (-not (Test-Path -LiteralPath $p)) {
        New-Item -ItemType Directory -Path $p | Out-Null
    }
}

function SafeName([string]$s) {
    if ($null -eq $s) { return "chapter" }
    $s = $s.ToLower()
    $s = $s -replace "[^a-z0-9]+","-"
    $s = $s -replace "-{2,}","-"
    $s = $s.Trim("-")
    if ($s.Length -gt 50) { $s = $s.Substring(0,50) }
    if ($s.Length -eq 0) { $s = "chapter" }
    return $s
}

function IsNoiseHeading([string]$t) {
    if ($null -eq $t) { return $false }
    $s = $t.Trim()

    if ($s -match "(?i)\b(mhz|ghz|khz|hz|gbps|mbps|kbps|bps)\b") {
        $x = $s.ToLower()
        $x = $x -replace "[0-9\.\;\,\*\(\)\[\]\-\/]+"," "
        $x = $x -replace "\b(mhz|ghz|khz|hz|gbps|mbps|kbps|bps)\b"," "
        $x = $x -replace "\b(or|and|to|is|are|of|the|a|an|in|on|for|with|without|note|default)\b"," "
        $x = $x -replace "\s+"," "
        return ($x.Trim().Length -eq 0)
    }

    return $false
}

if (-not (Test-Path $SourcePath)) {
    throw "SOURCE.md not found"
}

$lines = Get-Content $SourcePath -Encoding UTF8

Ensure-Dir $DocsDir

Remove-Item $DocsDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $DocsDir | Out-Null

$chapterText = @{}
$chapterTitle = @{}

for ($i=1; $i -le 11; $i++) {
    $chapterText[$i] = New-Object System.Collections.Generic.List[string]
}

$headingRegex = '^\s*#{1,6}\s+(\d+(?:\.\d+)+)\s+(.*)$'

$currentChapter = $null

foreach ($line in $lines) {

    $m = [regex]::Match($line,$headingRegex)

    if ($m.Success) {

        $num = $m.Groups[1].Value
        $title = $m.Groups[2].Value.Trim()

        $chapter = [int]($num.Split(".")[0])

        if ($chapter -ge 1 -and $chapter -le 11) {

            if (-not (IsNoiseHeading $title)) {

                $currentChapter = $chapter

                if (-not $chapterTitle.ContainsKey($chapter)) {
                    $chapterTitle[$chapter] = $title
                }

            }
        }
    }

    if ($null -eq $currentChapter) {
        continue
    }

    $chapterText[$currentChapter].Add($line)
}

$index = New-Object System.Collections.Generic.List[string]

$index.Add("# Orin TRM")
$index.Add("")
$index.Add("## Chapters")
$index.Add("")

for ($c=1; $c -le 11; $c++) {

    if ($chapterText[$c].Count -eq 0) {
        continue
    }

    $title = $chapterTitle[$c]

    if ($null -eq $title) {
        $title = "Chapter $c"
    }

    $slug = SafeName $title

    $fileName = "{0:D2}_{1}.md" -f $c,$slug

    $path = Join-Path $DocsDir $fileName

    $content = "# $c $title`n`n" + ($chapterText[$c] -join "`n")

    Set-Content $path -Value $content -Encoding UTF8

    $index.Add("- [$c $title](docs/$fileName)")
}

Set-Content $ReadmePath ($index -join "`n") -Encoding UTF8

Write-Host "Done."