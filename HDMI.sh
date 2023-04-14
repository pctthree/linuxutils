if [ "$1" = "off" ] || [ "$1" = "on" ]
then
  xset -display :0.0 dpms force $1
else
  echo "xset command requires argument on|off"
fi
