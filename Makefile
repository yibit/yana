# Copyright (c) 2013-2017 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

all test check sample clean install uninstall: platform-deps
	cd src && $(MAKE) $@

platform-deps:
	sh ./tools/configure.sh build_config.mk .

doc:
	cd mkdocs && $(MAKE)

distclean:
	rm -f src/*.o util/*.o src/*.a src/*.so src/*.sl src/*.a_* src/*.so_* src/*.sl_*
	rm -f samples/*.o samples/*_sample samples/*_sample_*
	rm -f third-party/gtest/src/*.o third-party/tap/*.o
	rm -f tests/*.o tests/*_test tests/*_test_* third-party/tap/*_test build_config.mk
	find . -name \*.xml -type f |xargs rm -f
	find . -name \*.gcda -type f |xargs rm -f
	find . -name \*.gcno -type f |xargs rm -f
	find . -name \*~ -type f |xargs rm -f
	find . -name \*.bak -type f |xargs rm -f

format:
	find include src tests -name "*.[h|c]" -o -name "*.cc" |xargs -I {} clang-format -i --style=file {}

cover:
	gcovr -x -r . -o coverage.xml

xml:
	tests/rdfsa_test  --gtest_output=xml:rdfsa_test.xml
