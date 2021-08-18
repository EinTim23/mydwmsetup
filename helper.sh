case "$1" in
"brup")
cur=$(cat /sys/class/backlight/radeon_bl0/brightness)
wannabe=$(($cur + 5))
echo $wannabe | doas tee /sys/class/backlight/radeon_bl0/brightness
;;
"brdown")
cur=$(cat /sys/class/backlight/radeon_bl0/brightness)
wannabe=$(($cur - 5))
echo $wannabe | doas tee /sys/class/backlight/radeon_bl0/brightness
;;
"volup")
cur=$(pamixer --get-volume)
wannabe=$(($cur + 5))
pamixer --set-volume $wannabe
;;
"voldown")
cur=$(pamixer --get-volume)
wannabe=$(($cur - 5))
pamixer --set-volume $wannabe
;;
"volmute")
cur=$(pamixer --get-mute)
if [[ "$cur" = "true" ]]
then
pamixer -u
else 
pamixer -m
fi
;;
esac
