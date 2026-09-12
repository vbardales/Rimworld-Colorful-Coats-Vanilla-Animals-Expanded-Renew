<# Standalone XML contract checks; no monorepo or installed game required. #>
param([string]$ModPath = (Join-Path $PSScriptRoot '..'))
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path $ModPath).Path
function Assert($condition, $message) {
    if (-not $condition) { throw $message }
}
$files = @(Get-ChildItem (Join-Path $root 'Mod') -Recurse -Filter *.xml)
foreach ($file in $files) {
    $doc = [System.Xml.XmlDocument]::new()
    $doc.Load($file.FullName)
    if ($file.Directory.Name -ne 'Patches') { continue }
    Assert ($doc.DocumentElement.Name -eq 'Patch') "$file : expected Patch root"
    foreach ($node in $doc.SelectNodes('//*[@Class]')) {
        Assert ($node.Class -in @('PatchOperationFindMod','PatchOperationSequence','PatchOperationAdd','PatchOperationConditional')) "$file : unsupported operation $($node.Class)"
    }
    foreach ($xpath in $doc.SelectNodes('//xpath')) {
        $null = [System.Xml.XPath.XPathExpression]::Compile($xpath.InnerText)
    }
    foreach ($op in $doc.SelectNodes('//*[@Class="PatchOperationAdd"]')) {
        Assert ($null -ne $op.value.alternateGraphics) "$file : missing alternateGraphics"
        $chance = 0.0
        Assert ([double]::TryParse([string]$op.value.alternateGraphicChance, [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$chance)) "$file : invalid chance"
        Assert ($chance -ge 0 -and $chance -le 1) "$file : chance outside [0,1]"
        Assert (@($op.value.alternateGraphics.li).Count -gt 0) "$file : empty coats"
        foreach ($coat in $op.value.alternateGraphics.li) {
            Assert (-not [string]::IsNullOrWhiteSpace([string]$coat.texPath)) "$file : empty texPath"
        }
    }
}
[xml]$about = Get-Content (Join-Path $root 'Mod/About/About.xml') -Raw
$meta = $about.ModMetaData
Assert ($meta.packageId -eq 'nelim.colorfulcoats.vaerenew') 'Unexpected packageId'
Assert ($meta.name.EndsWith(' (unofficial)')) 'Missing unofficial suffix'
Assert ($meta.description.Contains([string]$meta.url) -and $meta.url -eq 'https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew') 'Missing GitHub link in description'
Assert ('VanillaExpanded.VanillaAnimalsExpanded' -in @($meta.modDependencies.li.packageId)) 'Missing VAE dependency'
Assert ((Get-FileHash (Join-Path $root 'LICENSE')).Hash -eq (Get-FileHash (Join-Path $root 'Mod/LICENSE')).Hash) 'License copies differ'
Write-Host "PASS: $($files.Count) XML files parsed; patch classes, XPath syntax, coats, chances, metadata and license copies checked."
