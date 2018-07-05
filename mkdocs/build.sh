#!/bin/sh

BASE_DIR=$SMPDIR

if test "#$BASE_DIR" = "#"; then
    BASE_DIR=../src
fi

SITE_DIR=`cat mkdocs.yml |grep site_dir |awk -F':' '{ print $2; }'`
if test "#$SITE_DIR" = "#"; then
    SITE_DIR=site
fi

_copy_docs()
{
    mkdocs=`find $BASE_DIR |grep -E "\.md$"`

    for doc in $mkdocs; do

        base_path=`echo $doc |grep -E "\.md$" |awk -F'src/' '{ print $2; }' |awk -F'/' '{ print $1; }' |grep -v -E "\.md$"`
        # fix path
        base_path="./docs/$base_path"
        mkdir -p $base_path
        cp $doc $base_path/

    done

    return 0 
}

_add_missing()
{
 
    return 0
}

if test $# -eq 0; then
    _copy_docs
else
    _add_missing
fi
