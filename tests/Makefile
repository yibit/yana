# Copyright (c) 2013-2015 The yibit Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

include ../build_config.mk

GTEST_HOME= ../third-party/gtest

CC_bin= rdfsa_test

C_bin_SRC_c= \
	../src/rdfsa.c

CC_bin_SRC_cc= \
	rdfsa_test.cc \
	$(GTEST_HOME)/src/gtest-all.cc \
	$(GTEST_HOME)/src/gtest_main.cc

YIBIT_HEADER_DIR= ../include

MY_COMMON_FLAGS= -I$(YIBIT_HEADER_DIR) -I$(GTEST_HOME)/include -I$(GTEST_HOME)

YIBIT_SLIB_HEADERS=

YIBIT_HEADERS=


all $(CC_bin): cc_bin

include ../src/Makefile.inc

