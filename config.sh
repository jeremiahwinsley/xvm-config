#!/bin/bash
set -e

ROOT="/mnt/c/games/World_of_Tanks/res_mods/configs/xvm"
WORKDIR="/mnt/c/games/xvm-config"

cp -u "$WORKDIR/xvm.xc" "$ROOT/xvm.xc"
if [[ ! -d "$ROOT/custom" ]]; then
    cp -r "$ROOT/default" "$ROOT/custom"
fi

sed -i 's/"removeRankBadgeIcon": false,/"removeRankBadgeIcon": true,/' $ROOT/custom/BattleLoading.xc
sed -i 's/"removeRankBadgeIcon": false,/"removeRankBadgeIcon": true,/' $ROOT/custom/BattleLoadingTips.xc
sed -i 's/"enableEquipAutoReturn": false,/"enableEquipAutoReturn": true,/' $ROOT/custom/hangar.xc
sed -i 's/"blockVehicleIfLowAmmo": false,/"blockVehicleIfLowAmmo": true,/' $ROOT/custom/hangar.xc
sed -i 's/"enabled": true,/"enabled": false,/' $ROOT/custom/markers.xc
sed -i 's/"enabled": true,/"enabled": false,/' $ROOT/custom/minimap.xc
sed -i 's/${ "widgetsTemplates.xc":"statistics" },//' $ROOT/custom/widgets.xc
