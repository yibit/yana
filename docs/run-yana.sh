#!/bin/sh

cd /home/yana/_site

python -m SimpleHTTPServer 9876 1> site.log 2>&1

