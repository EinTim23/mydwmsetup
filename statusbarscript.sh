
while true;
do
bat=$(cat /sys/class/power_supply/BAT0/capacity)
ram=$(free -m | grep 'Speicher' | awk -F ' ' '{print $3}')
brightness=$(cat /sys/class/backlight/radeon_bl0/brightness)
speicher=$(df -h | grep '/dev/mapper/vg-root' | awk -F ' ' '{print $4}')
date=$(date -d '-2 hours' '+%d.%m.%Y %X')
sound=$(pamixer --get-volume)
cpu=$(top -b -n1 | grep -i "Cpu(s)" | awk '{print $2 + $4}')
res="\uf2db : "$cpu" \uf1c0 : "$ram"MB \uf0a0 : "$speicher" \uf028: "$sound"% \uf185 : "$brightness"% \uf017 : "$date" \uf241 : "$bat"%"
xsetroot -name "$res"
sleep 1
done
