//======================================
//   Metropolice
//======================================

$eyeposition 0 0 72

$bbox -13 -13 0 13 13 72

$modelname Police.mdl

$model police "Police_reference.smd" {
	$include "../Humans/bodyrules_xsi.qci"
}

$attachment "eyes" "ValveBiped.Bip01_Head1" 0 -5 67 absolute
$attachment "Center" "ValveBiped.Bip01_Spine1" 0 0 40 absolute
$attachment "Chest" "ValveBiped.Bip01_Spine4" 0 0 55 absolute
$attachment "LHand" "ValveBiped.Bip01_L_Hand" 3 0 0
$attachment "RHand" "ValveBiped.Bip01_R_Hand" 3 0 0
$attachment "zipline" "ValveBiped.Bip01_Spine4" 2.00 -2.00 0.00 rotate 0 -17 0 rigid
$attachment "manhack" "ValveBiped.Bip01_Spine" 18.00 -6.00 3.00 rotate -25 50 0

// This is the list of bones on the model that are bone merged against
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.baton_parent"

$bodygroup manhack
{
Blank
studio "Manhack_reference.smd"
}

$cdmaterials models/Police models/manhack
$surfaceprop "flesh"
$jointsurfaceprop "ValveBiped.Bip01_Head1" "no_decal"

$pushd "../humans"
$include "../humans/weaponmacros.qci"
$include "../humans/standardhierarchy.qci"
$include "../Humans/standardikchains.qci"
$include "../humans/male/commonbones.qci"
$alwayscollapse "Police"
$popd

$definebone "ValveBiped.baton_parent" "ValveBiped.Bip01_R_Hand" 2.338453 -1.535742 -6.391511 -5.407576 -114.703346 87.103622 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000

$includemodel Police_animations.mdl
$includemodel Police_ss.mdl

$include "hitbox.qci"
$include "ragdoll.qci"

//==============================================================================

$lod 12 
{
	replacemodel "Police_reference" "Police_LOD_1" 
}

$lod 18 
{
	replacemodel "Police_reference" "Police_LOD_2" 
	$include "../Humans/removehands.qci"
}

$lod 42
{
	replacemodel "Police_reference" "Police_LOD_3" 
	$include "../Humans/lowesthumanskeleton.qci"
	removemesh "models/manhack/manhack_sheet"
	replacebone "ValveBiped.circle" "ValveBiped.Bip01_L_upperarm"
}

$lod 55 
{
	replacemodel "Police_reference" "Police_LOD_4" 
	$include "../Humans/lowesthumanskeleton.qci"
	removemesh "models/manhack/manhack_sheet"
	replacebone "ValveBiped.circle" "ValveBiped.Bip01_L_upperarm"
}

$lod 80 
{
	replacemodel "Police_reference" "Police_LOD_5" 
	$include "../Humans/lowesthumanskeleton.qci"
	removemesh "models/manhack/manhack_sheet"
	replacebone "ValveBiped.circle" "ValveBiped.Bip01_L_upperarm"
}

$shadowlod
{
	replacemodel "Police_reference" "Police_shadow_LOD" 
	$include "../Humans/lowesthumanskeleton.qci"
	removemesh "models/manhack/manhack_sheet"
	replacebone "ValveBiped.circle" "ValveBiped.Bip01_L_upperarm"
}

//==============================================================================

