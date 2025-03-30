#!/usr/bin/env dash

xbps-install -Su
xbps-install -Su void-repo-nonfree just
just install-pkgs

ln -s /etc/sv/cupsd /var/service
ln -s /etc/sv/avahi-daemon /var/service
ln -s /etc/sv/ipp-usb /var/service
