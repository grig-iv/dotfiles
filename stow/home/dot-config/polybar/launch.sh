#!/usr/bin/env dash

pkill polybar

polybar 2>&1 | tee -a /tmp/polybar.log & disown
