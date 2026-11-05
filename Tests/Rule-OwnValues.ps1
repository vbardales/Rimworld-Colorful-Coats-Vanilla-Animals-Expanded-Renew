param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this port's content: the coats and chances the four patch files must agree on.
# One consumer, nothing shareable. Tests/Test-Mod.ps1 (generated) runs it after the shared checks. Prints findings, exit 1 on any.
# Shared checks hold the rest: Check-Textures (three rotations per texPath, no orphan texture), Check-PatchTargets (each patched
# defName still exists in VAE, Endangered, Odyssey), Check-AlternateGraphics (no own alternateGraphics on the target, chance with a
# list), Check-ModBasics (XML, identity, licence copies).
# Facts kept here:
#   1. Every operation inside a PatchOperationSequence carries <success>Always</success>, so one miss never stops the sequence
#      (the Odyssey file uses PatchOperationConditional, one add per guard, no flag needed).
#   2. The 16 animals patched a second time in ColorfulCoats_VAEvarious.xml carry the same chance and coats as in the core file
#      (a double application stays harmless if a dead module comes back; TESTING.md scenario J).
#   3. The Odyssey file gives its animals the same coats and chance as their AEXP_ counterparts in the core file (matched on the
#      coat list, since the defNames differ: Tiger against AEXP_Tiger).
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
$patchRoot = Join-Path $root 'Mod\Patches'
$script:findings = @()

function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}

# One entry per operation, across the two shapes this mod uses (Sequence under a FindMod, or a single Conditional).
function Read-Animals([string]$file) {
    [xml]$xml = Get-Content -LiteralPath $file -Raw -Encoding UTF8
    foreach ($guard in @($xml.Patch.Operation)) {
        if ($guard.Class -eq 'PatchOperationConditional') { $ops = @($guard.match); $inSeq = $false }
        else { $ops = @($guard.match.operations.li); $inSeq = $true }
        foreach ($op in $ops) {
            if ($op.xpath -notmatch 'defName\s*=\s*"([^"]+)"') { throw "xpath with no defName in $file : $($op.xpath)" }
            [pscustomobject]@{
                File       = Split-Path $file -Leaf
                DefName    = $Matches[1]
                Chance     = [double]$op.value.alternateGraphicChance
                Coats      = @($op.value.alternateGraphics.li.texPath)
                Flagged    = ($op.success -eq 'Always')
                InSequence = $inSeq
            }
        }
    }
}

$core    = @(Read-Animals (Join-Path $patchRoot 'ColorfulCoats_VAEcore.xml'))
$extras  = @(Read-Animals (Join-Path $patchRoot 'ColorfulCoats_VAEextras.xml'))
$various = @(Read-Animals (Join-Path $patchRoot 'ColorfulCoats_VAEvarious.xml'))
$odyssey = @(Read-Animals (Join-Path $patchRoot 'ColorfulCoats_VAEodyssey.xml'))
$all = $core + $extras + $various + $odyssey

It 'Sequenced operations carry <success>Always</success>' {
    foreach ($o in $all | Where-Object { $_.InSequence -and -not $_.Flagged }) { "$($o.File) $($o.DefName)" }
}
It 'The modules file repeats the core file for the same animals' {
    $byName = @{}
    foreach ($a in $core) { $byName[$a.DefName] = $a }
    foreach ($v in $various) {
        if (-not $byName.ContainsKey($v.DefName)) { "$($v.DefName) is patched by the modules file and by nothing in the core file"; continue }
        $c = $byName[$v.DefName]
        if ($c.Chance -ne $v.Chance) { "$($v.DefName) chance $($c.Chance) in the core file, $($v.Chance) in the modules file" }
        elseif (($c.Coats -join '|') -ne ($v.Coats -join '|')) { "$($v.DefName) carries different coats in the two files" }
    }
}
It 'The Odyssey file matches the core file for the animals Odyssey took over' {
    $byCoats = @{}
    foreach ($a in $core) { $byCoats[($a.Coats -join '|')] = $a }
    foreach ($o in $odyssey) {
        $key = $o.Coats -join '|'
        if (-not $byCoats.ContainsKey($key)) { "$($o.DefName) carries coats no core operation carries" }
        elseif ($byCoats[$key].Chance -ne $o.Chance) { "$($o.DefName) chance $($o.Chance), against $($byCoats[$key].Chance) on $($byCoats[$key].DefName)" }
    }
}

Write-Host "$($core.Count + $extras.Count) animals patched, $($various.Count) a second time, $($odyssey.Count) again for the Odyssey defs."
if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Host $_ }; exit 1 }
Write-Host 'Rule-OwnValues: all rules passed.'
