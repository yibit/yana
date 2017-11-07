#!/bin/sh

usage()
{
    echo "    $0 <name>   "
    echo "                "

    exit 0
}

if test $# -ne 1; then
    usage
fi

Y_SED="sed -i"
UNAME=`uname -s`

name=$1
git clone https://github.com/yibit/yana $name --depth=1
cd $name

rm -rf .git
mv include/yana include/$name
mv mkdocs/run-yana.sh mkdocs/run-$name.sh

if test "x$UNAME" == "xDarwin"; then
    find . -type f |grep -v yana.sh |xargs grep -l yana |xargs -I {} sed -i '' "s/yana/$name/g" {}
else
    find . -type f |grep -v yana.sh |xargs grep -l yana |xargs -I {} sed -i "s/yana/$name/g" {}
fi

rm -f tools/yana.sh

