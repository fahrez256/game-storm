source $FUNCTION
import axeron.prop
local verName="V1.0"
local version=10
local pid="[$$]"
local p="[-]"
local fcore="https://fahrez256.github.io/game-storm/full/core.sh"
local id="$(settings get secure android_id)"
local trim_id="${id:0:6}"

time_conv() {
  ms=$1

  if [ "$ms" -lt 0 ]; then
      seconds=$(echo "$ms / 1000" | bc)
      echo "${2:-${seconds}s}"
  elif [ "$ms" -lt 60000 ]; then
      # Jika kurang dari 60000 ms, tampilkan dalam detik
      seconds=$(echo "$ms / 1000" | bc)
      echo "${seconds}s"
  elif [ "$ms" -lt 3600000 ]; then
      # Jika kurang dari 3600000 ms, tampilkan dalam menit dan detik
      minutes=$(echo "$ms / 60000" | bc)
      seconds=$(echo "($ms % 60000) / 1000" | bc)
      echo "${minutes}m ${seconds}s"
  elif [ "$ms" -lt 86400000 ]; then
      # Jika kurang dari 86400000 ms, tampilkan dalam jam, menit, dan detik
      hours=$(echo "$ms / 3600000" | bc)
      minutes=$(echo "($ms % 3600000) / 60000" | bc)
      seconds=$(echo "($ms % 60000) / 1000" | bc)
      echo "${hours}h ${minutes}m ${seconds}s"
  else
      # Jika lebih dari atau sama dengan 86400000 ms, tampilkan dalam hari, jam, menit, dan detik
      days=$(echo "$ms / 86400000" | bc)
      hours=$(echo "($ms % 86400000) / 3600000" | bc)
      minutes=$(echo "($ms % 3600000) / 60000" | bc)
      seconds=$(echo "($ms % 60000) / 1000" | bc)
      echo "${days}d ${hours}h ${minutes}m ${seconds}s"
  fi
}

case $1 in
  --info )
    log_path="/sdcard/Android/data/${axeron}/files"
    log_file="${log_path}/log.txt"
    current_time=$(date +%s%3N)
    last_time=$(cat "$log_file" 2>/dev/null)
    time_diff=$((current_time - last_time))
    converted_time=$(time_conv $time_diff)
    echo "┌$pid $name | Information"
    echo "├$p ID: $trim_id"
    echo "└┬$p Version: $verName ($version)"
    echo " ├$p Cooldown: $converted_time"
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
