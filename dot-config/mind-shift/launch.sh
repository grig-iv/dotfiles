#!/usr/bin/env dash

pkill mind-shift-st

$HOME/.local/bin/mind-shift-st 2>&1 | tee -a /tmp/mind-shift-st.log & 
