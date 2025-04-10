#!/usr/bin/env sh

xbps-install -Su
xbps-install -Su void-repo-nonfree just
just install-pkgs

# printing group
usermod -a -G lpadmin grig

# enable autologin
sed -i 's/"--noclear"/"--noclear --autologin grig"/' /etc/sv/agetty-tty1/conf

# enable services
ln -sf /etc/sv/dbus /var/service
ln -sf /etc/sv/nix-daemon /var/service
ln -sf /etc/sv/cupsd /var/service
ln -sf /etc/sv/avahi-daemon /var/service
ln -sf /etc/sv/ipp-usb /var/service

# user media
ln -sf "/run/media/grig" "$HOME/media"

# add my layout
xkbFile="/usr/share/X11/xkb/symbols/ru"
if [ -z "$(grep 'xkb_symbols "grig" {'  $xkbFile)" ]; then 
    cat "./xkb/ru-grig.xkb" >> $xkbFile
fi

# stow
just -f ./stow stow-root
