# Copyright (c) 2013-2018 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

include ../build_config.mk

GTEST_HOME= ../third-party/gtest

Static_lib= libgtest.$(PLATFORM_STATIC_EXT)

CC_static_lib_SRC_cc= \
	$(GTEST_HOME)/src/gtest-all.cc \
	$(GTEST_HOME)/src/gtest_main.cc

YIBIT_HEADER_DIR= ../include

MY_COMMON_FLAGS= -I$(YIBIT_HEADER_DIR) -I$(GTEST_HOME)/include -I$(GTEST_HOME)

YIBIT_SLIB_HEADERS=

YIBIT_HEADERS=


all: $(Static_lib)

$(Static_lib): static_lib

test: $(Static_lib) ../tools/mkrunner.sh
	cd .. && sh tools/mkrunner.sh tests

check: test

sample: $(CC_bin) ../tools/mkrunner.sh
	cd .. && sh tools/mkrunner.sh samples

.PHONY: install uninstall clean

include ./Makefile.inc

#include ./Makefile.install
