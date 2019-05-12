#!/bin/bash
set -e

ROOT="/mnt/c/games/World_of_Tanks/res_mods/configs/xvm"
WORKDIR="/mnt/c/games/xvm-config"

cp -u "$WORKDIR/xvm.xc" "$ROOT/xvm.xc"
if [[ ! -d "$ROOT/custom" ]]; then
    cp -r "$ROOT/default" "$ROOT/custom"
fi

# Disable any match - entire feature
sed -i 's/"enabled": true/"enabled": false/' $ROOT/custom/markers.xc
sed -i 's/"enabled": true/"enabled": false/' $ROOT/custom/minimap.xc
sed -i 's/"enabled": true/"enabled": false/' $ROOT/custom/damageLog.xc
sed -i 's/"enabled": true/"enabled": false/' $ROOT/custom/hitLog.xc
sed -i 's/"enabled": true/"enabled": false/' $ROOT/custom/captureBar.xc

# Disable first match after `clanIcon`
sed -i -e '/clanIcon/!b' -e ':a' -e '0,/"enabled": true/s//"enabled": false/;t trail' -e 'n;ba' -e ':trail' -e 'n;btrail' $ROOT/custom/playersPanel.xc
sed -i -e '/clanIcon/!b' -e ':a' -e '0,/"enabled": true/s//"enabled": false/;t trail' -e 'n;ba' -e ':trail' -e 'n;btrail' $ROOT/custom/BattleLoading.xc
sed -i -e '/clanIcon/!b' -e ':a' -e '0,/"enabled": true/s//"enabled": false/;t trail' -e 'n;ba' -e ':trail' -e 'n;btrail' $ROOT/custom/BattleLoadingTips.xc

sed -i 's/"removeRankBadgeIcon": false/"removeRankBadgeIcon": true/' $ROOT/custom/BattleLoading.xc
sed -i 's/"removeRankBadgeIcon": false/"removeRankBadgeIcon": true/' $ROOT/custom/BattleLoadingTips.xc
sed -i 's/"removeRankBadgeIcon": false/"removeRankBadgeIcon": true/' $ROOT/custom/statisticForm.xc

sed -i 's/"enableEquipAutoReturn": false/"enableEquipAutoReturn": true/' $ROOT/custom/hangar.xc
sed -i 's/"blockVehicleIfLowAmmo": false/"blockVehicleIfLowAmmo": true/' $ROOT/custom/hangar.xc

sed -i 's/${ "widgetsTemplates.xc":"statistics" },//' $ROOT/custom/widgets.xc
sed -i 's/"standardFields": \[ "frags", "badge", "nick", "vehicle" \]/"standardFields": \[ "frags", "nick", "vehicle" \]/' $ROOT/custom/playersPanel.xc
