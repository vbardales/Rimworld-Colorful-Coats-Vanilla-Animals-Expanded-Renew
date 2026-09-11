<#
.SYNOPSIS
  Checks the five things about this mod that can be settled without starting the game.

.DESCRIPTION
  The shared checkers under the monorepo's scripts/ cover the general faults - unknown fields,
  unresolved types, dangling def references - and this mod passes all of them. What they cannot
  see is the only thing it actually does: hand 74 texture paths to 35 of another mod's animals.

  So, five checks, and each one is a question the game would otherwise answer by drawing nothing:

    1. Every texPath in the four patch files has its three rotation files shipped. RimWorld looks
       for <path>_east.png, _north.png and _south.png; west is mirrored from east and is not
       shipped. A missing file is one line in the log at load and an invisible animal afterwards.

    2. Every shipped texture is referenced by some texPath. An unreferenced file is dead weight in
       the Workshop upload, and more often it is a typo in a path that check 1 already caught from
       the other side.

    3. Every defName the patch aims at still exists in the mod that owns it, and none of them
       already carries alternateGraphics of its own. This is the check that expires: both targets
       are alive, and a renamed animal costs it its coats in complete silence, since every
       operation carries <success>Always</success>. See scenario A in TESTING.md.

       This check has a second half that the Megafauna port had no need for. Vanilla Animals
       Expanded splits its 1.6 defs across two folders and loads the second one only
       IfModNotActive="Ludeon.RimWorld.Odyssey", because Odyssey made five of those animals
       vanilla. A defName that lives only in 1.6NotOdyssey exists for players without the
       expansion and does not exist for players with it. Those five are reported as covered
       elsewhere rather than as a fault, since ColorfulCoats_VAEodyssey.xml now aims at Ludeon's
       own defs for them - and the same check runs against Odyssey's data to confirm those five
       names are still there and still carry no alternateGraphics of their own.

    4. The 16 animals that ColorfulCoats_VAEvarious.xml patches a second time carry the same
       chance and the same coats there as in the core file. That equality is what makes a double
       application harmless if one of the eight dead modules is ever revived, and scenario J in
       TESTING.md states it as a fact rather than a hope.

    5. The five animals in the Odyssey file get the same coats and the same chances as their
       AEXP_ counterparts in the core file. They are matched on their coat lists, since the
       defNames deliberately differ - Tiger against AEXP_Tiger - so a chance edited on one side
       and not the other is caught rather than drifting quietly.

  Checks 3, 4 and 5 are skipped rather than failed when a target is not installed: none of them is
  in this repository and their absence says nothing about this one.

  Not published - _tools/ sits outside Mod/, which is the only directory the Workshop uploader
  ever sees.

.EXAMPLE
  powershell -File _tools/Check-Coats.ps1
#>
param(
    [string]$ModPath    = (Join-Path $PSScriptRoot '..'),
    [string]$Vae        = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2871933948',
    [string]$Endangered = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2366589898',
    [string]$Odyssey    = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data\Odyssey'
)

$ErrorActionPreference = 'Stop'

# Resolved, not joined as given. Check 2 measures a texture's full path against the length of
# $texRoot, and a $texRoot still carrying the `_tools\..` hop is longer than the path it is
# measuring into - which cuts the relative name short and reports all 222 textures as orphans.
$ModPath = (Resolve-Path $ModPath).Path

$patchRoot = Join-Path $ModPath 'Mod\Patches'
$texRoot   = Join-Path $ModPath 'Mod\Textures'
$rotations = 'east', 'north', 'south'
$problems  = 0

# One entry per operation, across the two shapes this mod uses.
#
#   PatchOperationFindMod   guards a PatchOperationSequence, so the adds sit under
#                           Operation/match/operations/li - one guard in the core and extras
#                           files, eight in the various file, one per dead module. A sequence
#                           stops at its first false, hence the <success>Always</success> audit.
#   PatchOperationConditional  guards a single add, which IS the match node - the Odyssey file.
#                              An xpath that matches nothing is a silent success there, so those
#                              operations neither need nor carry the flag.
function Read-Animals($file) {
    [xml]$xml = Get-Content -Raw $file
    foreach ($guard in @($xml.Patch.Operation)) {
        $class = $guard.Class
        if ($class -eq 'PatchOperationConditional') {
            $ops = @($guard.match)
            $inSeq = $false
            $on = $guard.xpath
        } else {
            $ops = @($guard.match.operations.li)
            $inSeq = $true
            $on = (@($guard.mods.li) -join ' / ')
        }
        foreach ($op in $ops) {
            if ($op.xpath -notmatch 'defName\s*=\s*"([^"]+)"') { throw "xpath with no defName in $file : $($op.xpath)" }
            [pscustomobject]@{
                File       = Split-Path $file -Leaf
                Guard      = $on
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
$odysseyPatch = @(Read-Animals (Join-Path $patchRoot 'ColorfulCoats_VAEodyssey.xml'))
$all     = $core + $extras + $various + $odysseyPatch

$coats = @($all.Coats | Sort-Object -Unique)
Write-Host "$($core.Count + $extras.Count) animals patched, $($various.Count) of them a second time for the old modules, $($odysseyPatch.Count) again for the defs Odyssey took over."
Write-Host "$($coats.Count) coats, $($coats.Count * $rotations.Count) textures expected."

$sequenced = @($all | Where-Object { $_.InSequence })
$unflagged = @($sequenced | Where-Object { -not $_.Flagged })
if ($unflagged.Count -gt 0) {
    $problems++
    Write-Host "-- $($unflagged.Count) sequenced operation(s) without <success>Always</success>, which lets a sequence stop early --"
    $unflagged | ForEach-Object { Write-Host "   $($_.File)  $($_.DefName)" }
} else {
    Write-Host "-- all $($sequenced.Count) sequenced operations carry <success>Always</success>, and the $($odysseyPatch.Count) conditional ones do not need it --"
}

# 1 - every path has its three rotations.
$missing = foreach ($c in $coats) {
    foreach ($r in $rotations) {
        $f = Join-Path $texRoot ("$c" + "_$r.png").Replace('/', '\')
        if (-not (Test-Path $f)) { "$c" + "_$r.png" }
    }
}
if ($missing) {
    $problems++
    Write-Host "-- $($missing.Count) texture(s) referenced and not shipped --"
    $missing | ForEach-Object { Write-Host "   $_" }
} else {
    Write-Host '-- every texPath has its three rotations --'
}

# 2 - and nothing shipped is unreferenced.
$wanted = [System.Collections.Generic.HashSet[string]]::new()
foreach ($c in $coats) { foreach ($r in $rotations) { [void]$wanted.Add(("$c" + "_$r.png").Replace('/', '\')) } }

$orphans = Get-ChildItem $texRoot -Recurse -Filter *.png |
    ForEach-Object { $_.FullName.Substring($texRoot.Length + 1) } |
    Where-Object { -not $wanted.Contains($_) }
if ($orphans) {
    $problems++
    Write-Host "-- $($orphans.Count) shipped texture(s) nothing references --"
    $orphans | ForEach-Object { Write-Host "   $_" }
} else {
    Write-Host '-- every shipped texture is referenced --'
}

# 3 - the animals are still called what the patch calls them.
#
# Read each folder separately: a def that only exists in 1.6NotOdyssey is real for a player
# without the expansion and absent for a player with it.
function Read-Kinds($root, $folder) {
    $defs = @{}
    if ($folder) { $dir = Join-Path $root (Join-Path $folder 'Defs') } else { $dir = Join-Path $root 'Defs' }
    if (-not (Test-Path $dir)) { return $defs }
    foreach ($f in Get-ChildItem $dir -Recurse -Filter *.xml) {
        [xml]$d = Get-Content -Raw $f.FullName
        foreach ($k in $d.Defs.PawnKindDef) {
            if ($k.defName) { $defs[$k.defName] = $k }
        }
    }
    return $defs
}

function Check-Target($label, $root, $folders, $animals) {
    if (-not (Test-Path $root)) {
        Write-Host "-- $label not installed at $root, defName check skipped --"
        return 0
    }
    $bad = 0
    $always = Read-Kinds $root $folders[0]
    $sometimes = @{}
    if ($folders.Count -gt 1) { $sometimes = Read-Kinds $root $folders[1] }
    if ($folders[0]) { $where = "$($folders[0])\Defs" } else { $where = "Defs" }
    Write-Host "$label : $($always.Count) PawnKindDef in $where, $($sometimes.Count) more in the conditional folder."

    $names = @($animals.DefName | Sort-Object -Unique)

    $gone = @($names | Where-Object { -not $always.ContainsKey($_) -and -not $sometimes.ContainsKey($_) })
    if ($gone.Count -gt 0) {
        $bad++
        Write-Host "-- $($gone.Count) defName(s) the patch aims at and $label no longer has --"
        $gone | ForEach-Object { Write-Host "   $_" }
    } else {
        Write-Host "-- all $($names.Count) defNames still exist in $label --"
    }

    $conditional = @($names | Where-Object { -not $always.ContainsKey($_) -and $sometimes.ContainsKey($_) })
    if ($conditional.Count -gt 0) {
        # Not a failure: these operations are correct for a player without the expansion, and
        # ColorfulCoats_VAEodyssey.xml covers the same animals for a player with it.
        Write-Host "-- $($conditional.Count) defName(s) exist only in $($folders[1])\Defs, so they are absent under Odyssey and covered by ColorfulCoats_VAEodyssey.xml instead --"
        $conditional | ForEach-Object { Write-Host "   $_" }
    }

    $taken = @($names | Where-Object {
        ($always.ContainsKey($_)   -and $always[$_].alternateGraphics) -or
        ($sometimes.ContainsKey($_) -and $sometimes[$_].alternateGraphics)
    })
    if ($taken.Count -gt 0) {
        $bad++
        Write-Host "-- $($taken.Count) animal(s) where $label already defines alternateGraphics --"
        $taken | ForEach-Object { Write-Host "   $_" }
    } else {
        Write-Host "-- $label defines alternateGraphics on none of them --"
    }
    return $bad
}

$problems += Check-Target 'Vanilla Animals Expanded' $Vae @('1.6', '1.6NotOdyssey') $core
$problems += Check-Target 'Endangered' $Endangered @('1.6') $extras
$problems += Check-Target 'Odyssey' $Odyssey @('') $odysseyPatch

# 4a - and the Odyssey file says exactly what the core file says for the same five animals,
# matched on the coats since the defNames deliberately differ: AEXP_Tiger against Tiger.
$byCoats = @{}
foreach ($a in $core) { $byCoats[($a.Coats -join '|')] = $a }
$odrift = foreach ($o in $odysseyPatch) {
    $key = ($o.Coats -join '|')
    if (-not $byCoats.ContainsKey($key)) {
        "$($o.DefName) carries coats no core operation carries"
    } elseif ($byCoats[$key].Chance -ne $o.Chance) {
        "$($o.DefName) chance $($o.Chance), against $($byCoats[$key].Chance) on $($byCoats[$key].DefName)"
    }
}
if ($odrift) {
    $problems++
    Write-Host "-- the Odyssey file and the core file disagree --"
    $odrift | ForEach-Object { Write-Host "   $_" }
} else {
    Write-Host "-- the $($odysseyPatch.Count) animals Odyssey took over get the same coats and chances as their VAE counterparts --"
}

# 4 - the second pass over those 16 animals says exactly what the first one says.
$byName = @{}
foreach ($a in $core) { $byName[$a.DefName] = $a }
$drift = foreach ($v in $various) {
    if (-not $byName.ContainsKey($v.DefName)) {
        "$($v.DefName) is patched by the modules file and by nothing in the core file"
    } else {
        $c = $byName[$v.DefName]
        if ($c.Chance -ne $v.Chance) {
            "$($v.DefName) chance $($c.Chance) in the core file, $($v.Chance) in the modules file"
        } elseif (($c.Coats -join '|') -ne ($v.Coats -join '|')) {
            "$($v.DefName) carries different coats in the two files"
        }
    }
}
if ($drift) {
    $problems++
    Write-Host "-- the two passes disagree, so a double application would not be harmless --"
    $drift | ForEach-Object { Write-Host "   $_" }
} else {
    Write-Host "-- the $($various.Count) animals patched twice carry the same chance and coats in both files --"
}

Write-Host ''
if ($problems) { Write-Host "$problems check(s) failed."; exit 1 }
Write-Host 'All checks passed. What is left is scenario A in TESTING.md, which needs the game.'
