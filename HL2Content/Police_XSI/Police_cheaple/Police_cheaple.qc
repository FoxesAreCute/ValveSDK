
/*
==============================================================================

Police Cheaple

==============================================================================
*/

$modelname Police_Cheaple.mdl
$cdmaterials models\police

$eyeposition 0 0 72

$model police "Police_cheaple_reference.smd"

$include "cheaple_bones.qci"

$pushd "../"
$include "../police_cheaple_shared.qci"
$popd

//==============================================================================

$lod 10 
{
	replacemodel "Police_cheaple_reference" "Police_cheaple_lod1"
}

$lod 20 
{
	replacemodel "Police_cheaple_reference" "Police_cheaple_lod2"

}

$lod 40 
{
	replacemodel "Police_cheaple_reference" "Police_cheaple_lod3"

}

//==============================================================================

$pushd "../../humans/male"
$include "../../humans/male/Cheaple_hitbox.qci"
$include "../../humans/male/Cheaple_Ragdoll.qci"
$popd