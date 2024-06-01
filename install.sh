source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"

echo "Module Id : $(settings get secure android_id)"
echo "$name : test"
echo "Version : free"
echo "Need more features? donate \$1"

storm -x "$core" -fn "core" "$@"
