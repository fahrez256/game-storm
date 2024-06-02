source $FUNCTION
import axeron.prop
local pid="[$$]"
local p="[-]"
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local fcore="https://fahrez256.github.io/game-storm/fcore.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)"
local trim_id="${id:0:6}"
local full_version=$(echo "$check_id" | grep -q "$trim_id" && echo true || echo false)

case $1 in
  --info )
    echo "┌$pid $name | Information"
    echo "├$p ID: $trim_id"
    echo "└$p Full Version: $full_version"
    exit 0
    ;;
esac

if [ $full_version = true ]; then
  echo "┌$pid $name | Full Version"
  echo "│$p Thank you for donating, enjoy"
  storm -x "$fcore" -fn "fcore" "$@"
else
  echo "$name | Free Version"
  echo "Need more features? donate \$1"
  storm -x "$core" -fn "core" "$@"
fi
