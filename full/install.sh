source $FUNCTION
import axeron.prop
local verName="V1.0"
local version=10
local pid="[$$]"
local p="[-]"
local fcore="https://fahrez256.github.io/game-storm/full/core.sh"
local id="$(settings get secure android_id)"
local trim_id="${id:0:6}"

case $1 in
  --info )
    echo "┌$pid $name | Information"
    echo "├$p ID: $trim_id"
    echo "└┬$p Version: $verName ($version)"
    echo " ├$p Optimize CD: 45 Minutes"
    echo " └$p Package: ${runPackage:-null}"
    exit 0
    ;;
  --changelogs )
    storm -x "https://fahrez256.github.io/game-storm/full/changelogs.sh" -fn "changelogs" "$@"
    exit 0
    ;;
esac

echo "┌$pid $name | $verName ($version)"
echo "│$p Thank you for donating, enjoy"
storm -x "$fcore" -fn "fcore" "$@"
