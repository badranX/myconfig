#xmodmap $HOME/bin/sculpt.orig
#test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY
test -f ~/.Xkeymap2 && xkbcomp ~/.Xkeymap2 $DISPLAY
redshift & disown
#test -f ~/.Xyay && xkbcomp ~/.Xyay $DISPLAY
#setxkbmap -layout yay
if [ -f ~/.fehbg ]; then
	~/.fehbg &
fi
if [ -f ~/fehbg.jpg ]; then
	feh --bg-scale ~/fehbg.jpg
fi

if [ ! -z ${DISPLAY} ]
	while true; do
		xsetroot -name "$(date)"
		sleep 20s
	done &
fi
