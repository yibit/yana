# Copyright (c) 2013-2017 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################
#!/bin/sh

usage()
{
    echo "                                                 "
    echo " Usage: $0 <directory> [prog-name]               "
    echo "                                                 "

    return 0    
}

make_run()
{
    if test -z $PROGS; then
        PROGS=`cat config.json |grep -E '[\t ]*".*":[\t ]*\{' |tr -d '"' |awk -F":" '{ print $1; }'`
    fi

    sh $JSON -b < config.json |tr -d '[\t' |tr ']' '=' > .progs_conf

    for p in $PROGS
    do
        MY_ARGS=`cat .progs_conf |grep "\"$p\"" |awk -F'","' ' { print $2; } ' |awk -F'"=' '{ print $1"="$2; }' |tr '\n' ' '`
        if test "#$MY_ARGS" = "#"; then
            echo "Error: $p dose not exist. !!"
            exit 1
        fi
        echo "make $MY_ARGS" |sh
    done
}

run()
{
    for f in $PROGS
    do
        echo "--------- run $f ---------"
        $f
    done
}

make_clean()
{
    rm -f .progs_conf
}

#=================== main ======================
WORKDIR=`pwd`
PROGS=""
JSON=../tools/json.sh

if test $# -lt 1; then
    usage
    exit 1
fi

TARGETDIR=$1

if test $# -gt 1; then
    PROGS=$2
fi

cd $TARGETDIR

make_run

run

make_clean

cd $WORKDIR

