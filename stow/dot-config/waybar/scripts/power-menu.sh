#!/bin/bash
options="Shutdown\nReboot\nLogout\nSuspend\nExit"
chosen=$(echo -e "$options" | rofi -dmenu --prompt)

case $chosen in
  "Shutdown") systemctl poweroff ;;
  "Reboot")   systemctl reboot ;;
  "Logout")   niri msg action quit --skip-confirmation ;;
  "Suspend")  systemctl suspend ;;
  "Exit")     exit 0 ;;
  *)          exit 1 ;;
esac
