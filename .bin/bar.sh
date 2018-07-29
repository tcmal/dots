#!/usr/bin/env bash

# fetch the colors
. "${HOME}/.cache/wal/colors.sh"

# vars
p="  "
barh="25"
barw=""
margin_w="0"
margin_h="0"
silence_message="silence"
clear_message="none"

ensure_length ()
{
	size=${#1}
  for ((i=$2; i <= desired ; i++))
  do
    1="$1 "
  done
}

# functions
song() {
	playing="$(mpc status | grep -o 'playing' )"
	#spotify="$(~/.bin/sp current | grep -o 'Title')"

	if [ "$playing" == "playing" ]; then
		echo "$p$(mpc current --format %title%)$p"
	#elif [ "$spotify" == "Title" ]; then
	#	eval $(~/.bin/sp eval)
	#	echo "$p$SPOTIFY_TITLE$p"
	fi
}

clock() {
	datetime="$(date "+%a %R")"
	echo "$datetime"
}

email() {
	email="$(/home/oscar/.bin/newmailcount)"
	if [ "$email" != "0" ]; then
		echo "$p$email$p"
	fi
}

		#%{B$color3}%{A1:termite -e mutt &:}$(email)%{A1}\
# loops
loop-desktop() {
	while :; do
		echo "%{r}\
		%{B$color3}$txt%{A:mpc toggle &:}$(song)%{A}\
		%{B$color6}$txt$(email)\
		%{B$background}$p$(clock)$p"	
		sleep "1s"
	done |\
	
	lemonbar \
	    -f 'Roboto:size=9' \
			-g "${barw}x${barh}+${margin_w}+${margin_h}" \
	    -B "$background" -F "$foreground" \
		\
	    | bash
}

loop-desktop
