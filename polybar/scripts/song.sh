#!/bin/sh

scroll () {
	prefix="$1"
	scrolling="$2"
	temp="$(echo "$scrolling"| sed "s/^\(.\{20\}\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$//")"
	suffix="$3"
	if [ "$(echo -n $scrolling |wc -c)" -gt 14 ]; then
		echo "$prefix%{T7}$temp%{T-}$suffix"
		sleep 0.5

		zscroll -l 14 \
        		--delay 0.2 \
			--before-text "$prefix%{T7}" \
			--after-text "%{T-}$suffix" \
			--scroll-padding "     " \
			--update-check true "echo '$(get_title)'" &

		wait
	else
		echo "$prefix%{T8} $temp %{T-}$suffix"
	fi
} #

get_artist () {
	echo "$(playerctl metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #

get_title () {
	echo "$(playerctl metadata --format "{{title}}" | sed 's/'\''/\\'\''/g')"
} #

[ ! -z "$(playerctl status 2>/dev/null)" ] \
	&& artist=$(get_artist) \
	&& title=$(get_title) \
	&& ([ -z "$artist$title" ] && scroll "" "Spotify is not connected on this pc" "" || scroll "%{F#B4796F}$artist%{F#FFF} [" "$title" "]%{F-}" ) \
	|| exit 1
