#!/usr/bin/env bash

# fetch the colors
source "/home/oscar/.bin/colors.sh"


# vars
p="  "
barh="50"
barw=""
margin_w="0"
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

	if [ "$playing" == "playing" ]; then
		echo "$p$(mpc current --format %title%)$p"
	else
		echo "$p$silence_message$p"
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
		echo "$p$clear_message$p"
	fi
}

# loops
loop-desktop() {
	while :; do
		echo "%{c}\
		$a2$txt%{A:mpc toggle &:}$(song)%{A}\
		$a0$txt%{A1:termite -e mutt &:}$(email)%{A1}\
		$a1$bgf%{A2:urxvt -name popup -e ncmpcpp &:}%{A3:mpc toggle &:}$p$(clock)$p%{A}%{A}\
		%{B#00000000}"
		sleep ".2s"
	done |\
	
	lemonbar \
	    -f 'Roboto:size=18' \
			-g ""$barw"x"$barh"+"$margin_w"+"$margin_h"" \
	    -d \
	    | bash
}

loop-desktop
