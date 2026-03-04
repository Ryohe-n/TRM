$Source = "SOURCE.md"
$DocsDir = "docs"

New-Item -ItemType Directory -Force $DocsDir | Out-Null

function SafeName($s) {

    $s = $s.ToLower()
    $s = $s -replace '[^a-z0-9]+','-'
    $s = $s.Trim('-')

    if ($s.Length -gt 40) {
        $s = $s.Substring(0,40)
    }

    return $s
}

$lines = Get-Content $Source -Encoding UTF8

$sections = @()

$currentKey = $null
$currentTitle = ""
$currentBody = @()

# x.x.x 見出し検出
$regex = '^\s*(?:#+\s*)?(\d+\.\d+\.\d+)\s+(.*)$'

foreach ($line in $lines) {

    $m = [regex]::Match($line,$regex)

    if ($m.Success) {

        if ($currentKey) {

            $sections += [PSCustomObject]@{
                Key = $currentKey
                Title = $currentTitle
                Body = $currentBody -join "`n"
            }

            $currentBody = @()
        }

        $currentKey = $m.Groups[1].Value
        $currentTitle = $m.Groups[2].Value

        continue
    }

    if ($currentKey) {
        $currentBody += $line
    }
}

# 最後
if ($currentKey) {

    $sections += [PSCustomObject]@{
        Key = $currentKey
        Title = $currentTitle
        Body = $currentBody -join "`n"
    }
}

# docs 出力
foreach ($s in $sections) {

    $safe = SafeName $s.Title

    $file = "$DocsDir/$($s.Key)_$safe.md"

    $content = "# $($s.Key) $($s.Title)`n`n$s($s.Body)"

    Set-Content $file $content -Encoding UTF8
}

# README目次生成
$index = @()

foreach ($s in $sections){

    $safe = SafeName $s.Title

    $index += "- [$($s.Key) $($s.Title)](docs/$($s.Key)_$safe.md)"
}

$readme = @()

$readme += "# TRM"
$readme += ""
$readme += "## Contents"
$readme += ""
$readme += $index

Set-Content README.md ($readme -join "`n") -Encoding UTF8

Write-Host "Split complete: $($sections.Count) sections"