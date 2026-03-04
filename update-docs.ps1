# update-docs.ps1 (PowerShell 5 compatible)
$Source  = "SOURCE.md"   # 分割元（巨大Markdown）
$DocsDir = "docs"

New-Item -ItemType Directory -Force $DocsDir | Out-Null

function SafeName([string]$s) {
  if ($null -eq $s) { $s = "" }
  $s = $s.Trim()
  if ([string]::IsNullOrWhiteSpace($s)) { return "section" }

  $s = $s.ToLower()
  $s = $s -replace '[^a-z0-9]+','-'
  $s = $s.Trim('-')

  if ($s.Length -gt 50) { $s = $s.Substring(0,50).Trim('-') }
  if ([string]::IsNullOrWhiteSpace($s)) { $s = "section" }
  return $s
}

# 見出し判定（# があってもなくてもOK）
# 対象:
#   1
#   2.1
#   7.2.4
# を拾う（最大3階層）
$rx = '^\s*(?:#{1,6}\s*)?(\d+(?:\.\d+){0,2})\b(?!\.)\s*(.*)\s*$'

$lines = Get-Content $Source -Encoding UTF8

$sections = New-Object System.Collections.Generic.List[object]

$currentKey   = "0"
$currentTitle = "Preamble"
$currentBody  = New-Object System.Collections.Generic.List[string]

function FlushSection {
  param(
    [string]$key,
    [string]$title,
    [System.Collections.Generic.List[string]]$body
  )

  $text = ($body -join "`n").Trim()
  if ([string]::IsNullOrWhiteSpace($text)) { return }

  $sections.Add([pscustomobject]@{
    Key=$key; Title=$title; Body=$text
  }) | Out-Null
}

foreach ($line in $lines) {
  $m = [regex]::Match($line, $rx)
  if ($m.Success) {
    # 直前セクション確定
    FlushSection -key $currentKey -title $currentTitle -body $currentBody

    $currentKey = $m.Groups[1].Value
    $t = $m.Groups[2].Value
    if ($null -eq $t) { $t = "" }
    $t = $t.Trim()
    if ([string]::IsNullOrWhiteSpace($t)) { $t = "Section" }
    $currentTitle = $t

    $currentBody  = New-Object System.Collections.Generic.List[string]

    # 各ファイルは H1 で統一
    $currentBody.Add("# $currentKey $currentTitle") | Out-Null
    $currentBody.Add("") | Out-Null
    continue
  }

  $currentBody.Add($line) | Out-Null
}

# 最後 flush
FlushSection -key $currentKey -title $currentTitle -body $currentBody

# docs 出力
$written = @()
foreach ($s in $sections) {
  $safe = SafeName $s.Title
  $fileName = "{0}_{1}.md" -f $s.Key, $safe
  $path = Join-Path $DocsDir $fileName

  Set-Content -Path $path -Value ($s.Body + "`n") -Encoding UTF8

  $written += [pscustomobject]@{
    Key=$s.Key; Title=$s.Title; File=("docs/" + $fileName)
  }
}

# キーの数値ソート (1 < 2 < 2.1 < 2.1.3)
function KeySortValue([string]$k) {
  $p = $k.Split('.')
  $a = 0; $b = 0; $c = 0
  if ($p.Length -ge 1) { $a = [int]$p[0] }
  if ($p.Length -ge 2) { $b = [int]$p[1] }
  if ($p.Length -ge 3) { $c = [int]$p[2] }
  return ("{0:D4}.{1:D4}.{2:D4}" -f $a, $b, $c)
}

# README 目次生成（軽量）
$readme = New-Object System.Collections.Generic.List[string]
$readme.Add("# TRM") | Out-Null
$readme.Add("") | Out-Null
$readme.Add("## Contents") | Out-Null
$readme.Add("") | Out-Null

foreach ($w in ($written | Sort-Object @{Expression={ KeySortValue $_.Key }})) {
  $readme.Add("- [$($w.Key) $($w.Title)]($($w.File))") | Out-Null
}

Set-Content -Path "README.md" -Value ($readme -join "`n") -Encoding UTF8

Write-Host ("Done. Wrote {0} files to docs/ and rebuilt README.md" -f $written.Count) -ForegroundColor Green