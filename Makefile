# Copyright (c) 2013-2017 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

all test check sample clean install uninstall: platform-deps
	cd src && $(MAKE) $@

platform-deps:
	sh ./tools/configure.sh build_config.mk .

distclean:
	rm -f src/*.o util/*.o src/*.a src/*.so src/*.sl src/*.a_* src/*.so_* src/*.sl_*
	rm -f samples/*.o samples/*_sample samples/*_sample_*
	rm -f third-party/gtest/src/*.o third-party/tap/*.o
	rm -f tests/*.o tests/*_test tests/*_test_* third-party/tap/*_test
	find . -name \*~ -type f |xargs rm -f
	find . -name \*.bak -type f |xargs rm -f
