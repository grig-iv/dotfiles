#!/usr/bin/env dash

xbps-install -Su
xbps-install -Su void-repo-nonfree just
just install-pkgs

ln -sf /etc/sv/cupsd /var/service
ln -sf /etc/sv/avahi-daemon /var/service
ln -sf /etc/sv/ipp-usb /var/service
