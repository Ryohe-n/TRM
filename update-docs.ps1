# update-docs.ps1 (PowerShell 5.1)
# Split SOURCE.md by Markdown headings "## X.Y ..."

param(
  [string]$SourcePath = "SOURCE.md",
  [string]$OutDir = "docs",
  [string]$ReadmePath = "README.md"
)

function Ensure-Dir([string]$p) {
  if (-not (Test-Path $p)) { New-Item -ItemType Directory -Path $p | Out-Null }
}

function Slugify([string]$s) {
  if ($null -eq $s) { $s = "" }
  $s = $s.Trim()
  if ($s.Length -eq 0) { return "section" }

  $s = $s -replace '[`*_<>\\/:|?"\[\]\(\)\{\}]', ''
  $s = $s -replace '\s+', '-'
  $s = $s -replace '-+', '-'
  $s = $s.Trim('-')
  $s = ($s.ToLower() -replace '[^a-z0-9\-]+', '')
  if ($s.Length -eq 0) { return "section" }
  if ($s.Length -gt 32) { $s = $s.Substring(0,32).Trim('-') }
  return $s
}

Ensure-Dir $OutDir
if (-not (Test-Path $SourcePath)) { throw "SOURCE not found: $SourcePath" }

# 前回生成物を掃除（*.mdを全部消すのが嫌ならパターン絞って）
Remove-Item -Force (Join-Path $OutDir "*.md") -ErrorAction SilentlyContinue

$lines = Get-Content -LiteralPath $SourcePath -Encoding UTF8

# 重要： "## " だけをトリガーにする（誤爆しない）
# 例: "## 7.2 Camera Interface"
$h2 = '^\s*##\s*([0-9]{1,2})\.([0-9]{1,2})\s*(.*)\s*$'

$currentKey = $null
$currentTitle = $null
$currentPath = $null

$index = @()

function Start-Section([int]$a, [int]$b, [string]$title) {
  $key = ("{0}.{1}" -f $a, $b)
  $safe = Slugify $title

  # 07.02 形式（短く・ソートしやすい）
  $fname = ("{0:D2}.{1:D2}_{2}.md" -f $a, $b, $safe)
  $path = Join-Path $OutDir $fname

  # 見出し入れて新規作成
  ("# {0} {1}`n" -f $key, $title) | Set-Content -LiteralPath $path -Encoding UTF8

  $script:index += [pscustomobject]@{
    Key = $key
    A = $a
    B = $b
    Title = $title
    File = (Join-Path $OutDir $fname)
  }

  return @($key, $path)
}

foreach ($line in $lines) {
  $m = [regex]::Match($line, $h2)
  if ($m.Success) {
    $a = [int]$m.Groups[1].Value
    $b = [int]$m.Groups[2].Value
    $t = $m.Groups[3].Value
    if ($null -eq $t) { $t = "" }
    $t = $t.Trim()
    if ([string]::IsNullOrWhiteSpace($t)) { $t = "Section" }

    $res = Start-Section -a $a -b $b -title $t
    $currentKey = $res[0]
    $currentPath = $res[1]
    continue
  }

  if ($null -ne $currentPath) {
    Add-Content -LiteralPath $currentPath -Encoding UTF8 -Value $line
  }
}

# README生成
$sorted = $index | Sort-Object A,B
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# TRM (Markdown)")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("## Contents (X.Y)")
[void]$sb.AppendLine("")

foreach ($it in $sorted) {
  $rel = $it.File -replace '^[.\\\/]+', ''
  $rel = $rel -replace '\\','/'
  [void]$sb.AppendLine(("* [{0} {1}]({2})" -f $it.Key, $it.Title, $rel))
}

$sb.ToString() | Set-Content -LiteralPath $ReadmePath -Encoding UTF8
Write-Host ("Done. Sections written: {0}" -f $sorted.Count) -ForegroundColor Green