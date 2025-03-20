#!/usr/bin/env dash

pkill mind-shift-st

mind-shift-st 2>&1 | tee -a /tmp/polybar.log & 
