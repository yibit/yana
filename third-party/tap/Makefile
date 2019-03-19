# Copyright (c) 2013-2018 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

include ../../build_config.mk


C_bin= tap_test

C_bin_SRC_c= \
	tap.c \
	tap_test.c

YIBIT_HEADER_DIR= ../include

MY_COMMON_FLAGS= -I$(YIBIT_HEADER_DIR)

YIBIT_SLIB_HEADERS=

YIBIT_HEADERS=


all $(C_bin): c_bin

include ../../src/Makefile.inc
