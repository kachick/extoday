#!/bin/sh

LANG=C
export LANG
own_path=$(
	cd "$(dirname "$0")" || exit
	pwd
)
pj_path=$(dirname "$own_path")
# shellcheck source=lib/extoday.bash
. "$pj_path/lib/extoday.bash"

for n in $(seq 0 365); do
	date=$(date --date "$n day" '+%Y-%m-%d')

	if [ "$(show_nth_week_in_month "$date")" = 4 ] && [ "$(show_wday "$date")" = Mon ]; then
		echo "$date"
	fi
done
