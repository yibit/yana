#!/bin/sh

set -e

name=`basename $0`

if test $# -lt 1; then
    echo "Usage: $name <prog> [args] "
    echo "                           "
    exit 1
fi

timestamp=`date '+%Y%m%d%H%M%S'`
logpath="$1"_"$timestamp"_memcheck.log

valgrind --tool=memcheck \
    --leak-check=full \
    --time-stamp=yes \
    --show-reachable=yes \
    --track-origins=yes \
    --trace-children=no \
    --leak-resolution=med \
    --track-fds=yes \
    --log-file=$logpath \
    "$@"
