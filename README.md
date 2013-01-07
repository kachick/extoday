extoday
========

Description
-------------

Shell functions to get attributes around a day.

Usage
-------

Setup

```sh
LANG=C; export LANG # recommend :)
. /path/lib/extoday.sh
```

Batch on specific days

```sh
if [ $(show_nth_week_this_month) = 4 ] && [ $(show_wtoday) = Mon ]; then
    # Run commands if script on Monday of "4th week" in current month
    # (it is not always on the "4th Monday")
    your_script
elif [ $(show_nth_wday_this_month) = 4 ] && [ $(show_wtoday) = Mon ]; then
    # Run commands if script on "4th Monday" in current month
fi
```

List Mondays for "4th week of the months"  in next year

```sh
for n in $(seq 0 365); do
    date=$(date --date "$n day" '+%Y-%m-%d')

    if [ $(show_nth_week_in_month "$date") = 4 ] && [ $(show_wday "$date") = Mon ]; then
        echo "$date"
    fi
done
```

Requirements
---------------

Choose

* bash
* dash

And
  
* GNU/date

Link
-----

* [Home](http://kachick.github.com/extoday)
* [code](https://github.com/kachick/extoday)

License
---------

LGPL v2.1  
Copyright (c) 2011 Kenichi Kamiya  
See COPYING for further details.
