<# What is specific to this mod's patches and metadata. Generic checks (well-formed XML, XPath, About.xml identity, LICENSE copies, PNGs)
   are in the shared ../scripts/Check-ModBasics.ps1, called first. No game required. #>
param([string]$ModPath = (Join-Path $PSScriptRoot '..'))
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path $ModPath).Path
function Assert($condition, $message) {
    if (-not $condition) { throw $message }
}
$shared = Join-Path $root '..\scripts\Check-ModBasics.ps1'
Assert (Test-Path $shared) "Shared Check-ModBasics.ps1 not found at $shared"
& $shared -ModRoot $root -Unofficial
Assert ($LASTEXITCODE -eq 0) 'Check-ModBasics.ps1 reported findings'
foreach ($file in @(Get-ChildItem (Join-Path $root 'Mod/Patches') -Filter *.xml)) {
    $doc = [System.Xml.XmlDocument]::new()
    $doc.Load($file.FullName)
    Assert ($doc.DocumentElement.Name -eq 'Patch') "$file : expected Patch root"
    foreach ($node in $doc.SelectNodes('//*[@Class]')) {
        Assert ($node.Class -in @('PatchOperationFindMod','PatchOperationSequence','PatchOperationAdd','PatchOperationConditional')) "$file : unsupported operation $($node.Class)"
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
Assert ($meta.packageId -eq 'nelim.colorfulcoats.vae') 'Unexpected packageId'
Assert ($meta.description.Contains([string]$meta.url) -and $meta.url -eq 'https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew') 'Missing GitHub link in description'
Assert ('VanillaExpanded.VanillaAnimalsExpanded' -in @($meta.modDependencies.li.packageId)) 'Missing VAE dependency'
Write-Host "PASS: shared basics, then patch classes, coats, chances, packageId, GitHub link and VAE dependency checked."
