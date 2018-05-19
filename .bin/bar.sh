#!/usr/bin/env bash

# fetch the colors
source "/home/oscar/.bin/colors.sh"


# vars
p="  "
barh="50"
barw=""
margin_w="30"
margin_h="30"
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
	spotify="$(~/.bin/sp current | grep -o 'Title')"

	if [ "$playing" == "playing" ]; then
		echo "$p$(mpc current --format %title%)$p"
	elif [ "$spotify" == "Title" ]; then
		eval $(~/.bin/sp eval)
		echo "$p$SPOTIFY_TITLE$p"
	fi
}

clock() {
	datetime="$(date "+%a %R")"
	echo "$datetime"
}

email() {
	email="$(/home/oscar/.bin/newmailcount)"
	if [ "$email" != 0 ]; then
		echo "$p$email$p"
	else
		:
	fi
}

# loops
loop-desktop() {
	while :; do
		echo "%{r}\
		$a0$txt%{A:mpc toggle &:}$(song)%{A}\
		$a1$txt%{A1:termite -e mutt &:}$(email)%{A1}\
		$a2$txt%{A2:urxvt -name popup -e ncmpcpp &:}%{A3:mpc toggle &:}$p$(clock)$p%{A}%{A}\
		%{B#00000000}"
		sleep ".2s"
	done |\
	
	lemonbar \
	    -f 'Roboto:size=18' \
			-g "${barw}x${barh}+${margin_w}+${margin_h}" \
	    -d \
			-b \
	    | bash
}

loop-desktop
