source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"
local full="https://fahrez256.github.io/game-storm/fullinstall.sh"
local id="$(settings get secure android_id)"
local check_id="$(storm https://fahrez256.github.io/game-storm/id_donatur.txt)"
local trim_id="${id:0:6}"
local full_version=$(echo "$check_id" | grep -q "$trim_id" && echo true || echo false)
if [ $full_version = true ]; then
  storm -x "$full" -fn "fullinstall" "$@"
  exit 0
fi

case $1 in
  --info )
    echo "$name | Information"
    echo "ID: $trim_id"
    exit 0
    ;;
esac

echo "$name | Free Version"
echo "Need more features? donate \$1"
storm -x "$core" -fn "core" "$@"
