
while true;
do
bat=$(cat /sys/class/power_supply/BAT0/capacity)
ram=$(free -m | grep 'Speicher' | awk -F ' ' '{print $3}')
brightness=$(cat /sys/class/backlight/radeon_bl0/brightness)
speicher=$(df -h | grep '/dev/mapper/vg-root' | awk -F ' ' '{print $4}')
date=$(date -d '-2 hours' '+%d.%m.%Y %X')
sound=$(pamixer --get-volume)
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
res="CPU: "$cpu" Memory: "$ram"MB SSD: "$speicher" Sound: "$sound"% Brightness: "$brightness"% Date: "$date" Battery: "$bat"%"
xsetroot -name "$res"
sleep 1
done
