#!/bin/sh

usage()
{
    echo "    $0 <name>   "
    echo "                "

    return 0
}

if test $# -ne 1; then
    usage
    exit 1
fi

UNAME=`uname -s`

name=$1
git clone https://github.com/yibit/yana $name --depth=1
cd $name

rm -rf .git
mv include/yana include/$name
mv mkdocs/run-yana.sh mkdocs/run-$name.sh

replace()
{
    if test "x$UNAME" == "xDarwin"; then
        find . -type f |grep -v yana.sh |xargs grep -l "$1" |xargs -I {} sed -i '' "s/$1/$2/g" {}
    else
        find . -type f |grep -v yana.sh |xargs grep -l $1 |xargs -I {} sed -i "s/$1/$2/g" {}
    fi
}

XNAME=`echo $name |tr a-z A-Z`

replace "yana" "$name"
replace "YANA" "$XNAME"

rm -f tools/yana.sh

git init

