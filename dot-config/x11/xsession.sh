sxhkd &
unclutter &

if [ -f $HOME/.config/wallpaper.tif ]; then
    feh --bg-fill $HOME/.config/wallpaper.jpg
fi

if [ "$DESKTOP_SESSION" == "none+dwm" ]; then
    gost &
    dwm &> $HOME/.local/share/dwm.log
fi

if [ "$DESKTOP_SESSION" == "none+mind-shift" ]; then
    $HOME/.local/bin/mind-shift-st &
    $HOME/.local/bin/mind-shift &> $HOME/.local/share/mind-shift.log

    while [ -e $HOME/sources/mind-shift/mind-shift ]; do
        mv -f $HOME/sources/mind-shift/mind-shift /tmp/mind-shift
        /tmp/mind-shift &> $HOME/sources/mind-shift/mind-shift.log
        mind-shift &> $HOME/.local/share/mind-shift.log
    done
fi
