# .sh_extoday - Extentions for GNU/date on Bourne Shell Family
# 
#   Example:
#     # Load before using
#     . ./.sh_extoday
#
#     if [ $(show_nth_week_this_month) = 4 ] && [ $(show_wtoday) = Mon ]; then
#         # Run lists on Monday of 4th week in this month
#         # (it's not always a 4th Monday)
#     elif [ $(show_nth_wday_this_month) = 4 ] && [ $(show_wtoday) = Mon ]; then
#         # Run lists on 4th Monday in this month
#     fi
# 
#   Copyright (C) 2011  Kenichi Kamiya
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License as published by the Free Software Foundation; either
#   version 2.1 of the License, or (at your option) any later version.
###############################################################################
 
# stdout: yyyy-mm-dd
show_today() {
    date '+%Y-%m-%d'
}

# stdout: wday str your LANG (C => [Sun, Mon, ...Sat])
show_wday() {
    local date="$1"

    date --date $date '+%a'
}
 
# stdout: wday str your LANG (C => [Sun, Mon, ...Sat])
show_wtoday() (
    show_wday $(show_today)
)
 
# stdout: [1-54]
show_nth_week_in_year() {
    local date="$1"

    expr $(date --date "$date" '+%U') + 1
}
 
# stdout: [1-54]
show_nth_week_this_year() {
    show_nth_week_in_year $(show_today)
}
 
# stdout: yyyy-mm-01
show_first_day_in_month() {
    local date="$1"

    date --date $date '+%Y-%m-01'
}
 
# stdout: yyyy-mm-01
show_first_day_this_month() {
    show_first_day_in_month $(show_today)
}
 
# stdout: [1-5]
show_nth_week_in_month() {
    local date="$1"
    local margin=$(expr $(show_nth_week_in_year $(show_first_day_in_month $date)) - 1)

    expr $(show_nth_week_in_year $date) - $margin
}
 
# stdout: [1-5]
show_nth_week_this_month() {
    show_nth_week_in_month $(show_today)
}
 
# stdout: [0(Sun)-6(Sat)]
show_num_wday() {
    local date="$1"

    date --date "$date" '+%w'
}
 
# stdout: [1-5]
show_nth_wday_this_month() {
    local n_wday=$(show_num_wday $(show_today))
    local n_first_wday=$(show_num_wday $(show_first_day_this_month))
     
    if [ $n_wday -ge $n_first_wday ]; then
        show_nth_week_this_month
    else
        expr $(show_nth_week_this_month) - 1
    fi
}
