source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local fcore="https://fahrez256.github.io/game-storm/fcore.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)"
local trim_id="${id:0:6}"
local full_version=$(echo "$check_id" | grep -q "$trim_id" && echo true || echo false)

case $1 in
  --info )
    echo "Game Storm Information"
    echo "Id : $trim_id"
    echo "Full Version : $full_version"
    exit 0
    ;;
esac

echo "$name : online"
if [ $full_version = true ]; then
  echo "Version : full"
  echo "Thank you for donating, enjoy"
  storm -x "$fcore" -fn "fcore" "$@"
else
  echo "Version : free"
  echo "Need more features? donate \$1"
  storm -x "$core" -fn "core" "$@"
fi
