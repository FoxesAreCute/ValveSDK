$modelname Police_ss.mdl

$include "../humans/weaponmacros.qci"
$include "../humans/standardhierarchy.qci"
$include "../Humans/standardikchains.qci"
$include "../humans/male/commonbones.qci"

$attachment "eyes" "ValveBiped.Bip01_Head1" 0 -7 66 absolute
$attachment baton "ValveBiped.baton_parent" 0 0 0

$animblocksize 32

$pushd "scripted_sequences"
$include "scripted_sequences\ss.qci"
$popd
