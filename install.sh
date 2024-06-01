source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)"
local trim_cid="${check_id:0:6}"
local trim_id="${id:0:6}"
local full_version=$(echo "$trim_cid" | grep -q "$trim_id" && echo true || echo false)

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
else
  echo "Version : free"
  echo "Need more features? donate \$1"
fi
storm -x "$core" -fn "core" "$@"
