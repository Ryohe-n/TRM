# build-docs.ps1 (PowerShell 5.1 compatible)
# Build GitHub-friendly docs:
# - Folder per chapter (X)
# - One file per section (X.Y)
# - Keep subheadings (X.Y.Z...) inside that file
# - Auto-generate README.md

param(
  [string]$SourcePath = ".\SOURCE.md",
  [string]$OutDir = ".\docs",
  [string]$ReadmePath = ".\README.md"
)

function Ensure-Dir([string]$p) {
  if (-not (Test-Path $p)) { New-Item -ItemType Directory -Path $p | Out-Null }
}

function SafeText([string]$s) { if ($null -eq $s) { "" } else { $s } }

function Slugify([string]$s, [int]$maxLen = 24) {
  $s = (SafeText $s).Trim()
  if ($s.Length -eq 0) { return "section" }
  $s = $s -replace '[`*_<>\\/:|?"\[\]\(\)\{\}]', ''
  $s = $s -replace '\s+', '-'
  $s = $s -replace '-+', '-'
  $s = $s.Trim('-')
  $s = ($s.ToLower() -replace '[^a-z0-9\-]+', '')
  if ($s.Length -eq 0) { return "section" }
  if ($s.Length -gt $maxLen) { $s = $s.Substring(0,$maxLen).Trim('-') }
  if ($s.Length -eq 0) { return "section" }
  return $s
}

function ChapterKey([int]$n) { "{0:D2}" -f $n }
function SectionKey([int]$a,[int]$b) { "{0:D2}.{1:D2}" -f $a,$b }

if (-not (Test-Path $SourcePath)) { throw "SOURCE not found: $SourcePath" }

Ensure-Dir $OutDir

# Clean output dir (generated artifacts)
Remove-Item -Recurse -Force $OutDir -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $OutDir | Out-Null

$lines = Get-Content -LiteralPath $SourcePath -Encoding UTF8

# Prefer explicit markdown headings if present:
#   ## 7.2 Title
$rxH2  = '^\s*##\s*(1|2|3|4|5|6|7|8|9|10|11)\.([0-9]{1,3})\s*(.*)\s*$'
# Fallback: headings of any level:
#   ### 7.2.4 Title  -> section is 7.2
$rxAny = '^\s*#{1,6}\s*(1|2|3|4|5|6|7|8|9|10|11)\.([0-9]{1,3})(?:\.([0-9]{1,3}))?\s*(.*)\s*$'
# Very strict: avoid false positives from body lines (must start with #)
# So we only react to markdown headings.

# Index structures
$chapterTitle = @{}            # chapNum -> title (best effort)
$sectionTitle = @{}            # "a.b" -> title
$sectionFile  = @{}            # "a.b" -> filepath
$chapterDir   = @{}            # chapNum -> directory
$sectionOrder = New-Object System.Collections.Generic.List[string]  # keep order

$currentSection = $null
$currentPath = $null

function Start-Section([int]$a,[int]$b,[string]$title) {
  $ck = ChapterKey $a
  $sk = SectionKey $a $b
  $key = "$a.$b"

  # Chapter folder name (short) from first known title if any
  if (-not $chapterDir.ContainsKey($a)) {
    # best effort: if we already know chapter title use it, else generic
    $ct = ""
    if ($chapterTitle.ContainsKey($a)) { $ct = $chapterTitle[$a] }
    if ([string]::IsNullOrWhiteSpace($ct)) { $ct = "chapter-$a" }
    $cslug = Slugify $ct 18
    $dir = Join-Path $OutDir ("{0}_{1}" -f $ck, $cslug)
    Ensure-Dir $dir
    $chapterDir[$a] = $dir
  }

  # File name (short, safe)
  $tslug = Slugify $title 28
  $fileName = ("{0}.{1:D2}_{2}.md" -f $ck, $b, $tslug)
  $path = Join-Path $chapterDir[$a] $fileName

  # Create file header (overwrite)
  ("# {0} {1}`n" -f $key, $title) | Set-Content -LiteralPath $path -Encoding UTF8

  $sectionTitle[$sk] = $title
  $sectionFile[$sk] = $path

  # Keep stable order
  if (-not ($sectionOrder -contains $sk)) { $sectionOrder.Add($sk) | Out-Null }

  $script:currentSection = $sk
  $script:currentPath = $path
}

# Pass 1: determine chapter titles if present in source as "# 7 Title" or "## 7 Title"
# (Optional; if absent we still build folders as chapter-7)
$rxChapterHeading = '^\s*#{1,6}\s*([0-9]{1,3})\.\s+(.+?)\s*$'
foreach ($line in $lines) {
  $m = [regex]::Match($line, $rxChapterHeading)
  if ($m.Success) {
    $a = [int]$m.Groups[1].Value
    if (-not $chapterTitle.ContainsKey($a)) {
      $t = $m.Groups[2].Value.Trim()
      if (-not [string]::IsNullOrWhiteSpace($t)) { $chapterTitle[$a] = $t }
    }
  }
}

# Pass 2: build section files
foreach ($line in $lines) {
  # Strong: only "## a.b" starts a new section
  $m2 = [regex]::Match($line, $rxH2)
  if ($m2.Success) {
    $a = [int]$m2.Groups[1].Value
    $b = [int]$m2.Groups[2].Value
    $t = (SafeText $m2.Groups[3].Value).Trim()
    if ([string]::IsNullOrWhiteSpace($t)) { $t = "Section" }
    Start-Section -a $a -b $b -title $t
    continue
  }

  # Fallback: if we have not started any section yet, allow "### a.b.c" etc to infer section
  if ($null -eq $currentSection) {
    $mAny = [regex]::Match($line, $rxAny)
    if ($mAny.Success) {
      $a = [int]$mAny.Groups[1].Value
      $b = [int]$mAny.Groups[2].Value
      $t2 = (SafeText $mAny.Groups[4].Value).Trim()
      if ([string]::IsNullOrWhiteSpace($t2)) { $t2 = "Section" }
      Start-Section -a $a -b $b -title $t2
      # append this heading too as content
      Add-Content -LiteralPath $currentPath -Encoding UTF8 -Value $line
      continue
    }
  }

  # Append content
  if ($null -ne $currentPath) {
    Add-Content -LiteralPath $currentPath -Encoding UTF8 -Value $line
  }
}

# Build README index (Chapter -> sections)
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# TRM")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("## Contents (by section X.Y)")
[void]$sb.AppendLine("")

# Group by chapter
$byChapter = @{}
foreach ($sk in $sectionOrder) {
  $parts = $sk.Split('.')
  $a = [int]$parts[0]
  if (-not $byChapter.ContainsKey($a)) { $byChapter[$a] = New-Object System.Collections.Generic.List[string] }
  $byChapter[$a].Add($sk) | Out-Null
}

$chapNums = $byChapter.Keys | Sort-Object
foreach ($a in $chapNums) {
  $ct = ""
  if ($chapterTitle.ContainsKey($a)) { $ct = $chapterTitle[$a] }
  if ([string]::IsNullOrWhiteSpace($ct)) { $ct = "Chapter $a" }

  [void]$sb.AppendLine(("### {0}. {1}" -f $a, $ct))
  foreach ($sk in $byChapter[$a]) {
    $title = $sectionTitle[$sk]
    $path = $sectionFile[$sk]
    $rel = $path -replace '^[.\\\/]+',''
    $rel = $rel -replace '\\','/'
    # Convert "07.02" -> "7.2" label
    $label = $sk -replace '^0+',''
    $label = $label -replace '\.0+','.'
    [void]$sb.AppendLine(("* [{0} {1}]({2})" -f $label, $title, $rel))
  }
  [void]$sb.AppendLine("")
}

$sb.ToString() | Set-Content -LiteralPath $ReadmePath -Encoding UTF8

Write-Host ("Done. Sections: {0}  Chapters: {1}" -f $sectionOrder.Count, $chapNums.Count) -ForegroundColor Green
Write-Host ("Output: {0}" -f (Resolve-Path $OutDir)) -ForegroundColor Green