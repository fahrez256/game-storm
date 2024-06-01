if [ $AXERON = false ]; then
  echo "Only support in LAxeron"
  exit 999
fi

source $FUNCTION
import axeron.prop
local core="https://fahrez256.github.io/Laxeron/shell/core.sh"

echo "$name : test"
echo "Version : free"
echo "Need more features? donate \$1"
