source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)"

case $1 in
  --info )
    echo "Game Storm Information"
    echo "Id : $id"
    echo "Full Version : $(echo $check_id | grep -q "$id" && echo true || echo false)"
    exit 0
    ;;
esac

echo "$name : online"
if echo $check_id | grep -q "$id"; then
  echo "Version : full"
  echo "Thank you for donating, enjoy"
else
  echo "Version : free"
  echo "Need more features? donate \$1"
fi
storm -x "$core" -fn "core" "$@"
