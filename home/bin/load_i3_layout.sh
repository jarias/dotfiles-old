#!/bin/bash

i3-msg "workspace 1; append_layout ~/.config/i3/workspace_1.json"
(qutebrowser &)

i3-msg "workspace 2; append_layout ~/.config/i3/workspace_2.json"
#(slack &)

i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.json"
(alacritty -e tmux &)
