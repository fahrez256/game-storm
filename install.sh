source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local id="$(settings get secure android_id)"
local check_id=$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)

case $1 in
  --info )
    echo "Game Storm Informations"
    echo "id : $id"
    echo "vip : $(echo $check_id | grep -q "$id" && echo true || echo false)"
    exit 0
    ;;
esac

echo "$name : online"
echo "Version : free"
echo "Need more features? donate \$1"

storm -x "$core" -fn "core" "$@"
