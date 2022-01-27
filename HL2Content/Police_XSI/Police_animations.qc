$modelname Police_animations.mdl

$include "../humans/weaponmacros.qci"
$include "../humans/standardhierarchy.qci"
$include "../Humans/standardikchains.qci"
$include "../humans/male/commonbones.qci"

$attachment "eyes" "ValveBiped.Bip01_Head1" 0 -7 66 absolute
$attachment baton "ValveBiped.baton_parent" 0 0 0

$pushd "../humans/Male_animations"
$include "../humans/Male_animations/body_poses_lean.qci"
$popd

$animblocksize 32

$include "Police_shared.qci"
