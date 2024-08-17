#
##remove mouse touch
##synclient MaxTapTime=0
#TODO change if no xfce4 available
#xfce4-power-manager & disown
xrandr --output eDP-1 --mode 1920x1200

picom -b

#xmodmap $HOME/bin/sculpt.orig
#test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY
#test -f ~/.Xkeymap2 && xkbcomp ~/.Xkeymap2 $DISPLAY  #Using keyd now
redshift & disown
#test -f ~/.Xyay && xkbcomp ~/.Xyay $DISPLAY
#setxkbmap -layout yay
if [ -f ~/.fehbg ]; then
	~/.fehbg &
fi
if [ -f ~/Pictures/bg ]; then
	feh --bg-scale ~/Pictures/fehbg.png
fi

#dwm bar
#DWM_BAR_SCRIPT="~/myconfig/dwm-bar/dwm_bar.sh"
#exec "$DWM_BAR_SCRIPT" & disown
