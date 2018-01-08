#!/bin/sh

HTTP_MODULE=`cat build_config.mk |head -1| awk '{print $2;}'`
ps -ef |grep "$HTTP_MODULE 9876" |grep -v -E "(grep|.git)" |awk '{ print $2; }' |xargs -I {} kill {}
