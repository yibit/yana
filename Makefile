# Copyright (c) 2013-2018 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

all test check sample clean install uninstall: platform-deps
	cd src && $(MAKE) $@

platform-deps:
	sh ./tools/configure.sh build_config.mk .

doc:
	cd mkdocs && $(MAKE)

distclean: platform-deps
	rm -f src/*.o util/*.o src/*.a src/*.so src/*.sl src/*.a_* src/*.so_* src/*.sl_*
	rm -f samples/*.o samples/*_sample samples/*_sample_*
	rm -f third-party/gtest/src/*.o third-party/tap/*.o
	rm -f tests/*.o tests/*_test tests/*_test_* third-party/tap/*_test build_config.mk
	find . -name \*.xml -o -name \*.gcda -o -name \*.gcno -o -name \*.bak -o -name \.DS_Store -o -name \*~ -type f |xargs rm -f
	cd mkdocs && $(MAKE) distclean

format:
	find include src tests -name "*.[h|c]" -o -name "*.cc" |xargs -I {} clang-format -i --style=file {}

cover:
	gcovr -x -r . -o coverage.xml

xml:
	tests/rdfsa_test  --gtest_output=xml:rdfsa_test.xml

docker build:
	docker build -t yana .

run:
	docker run -d -p 8765:8765 -p 19221:19221 --name=yana yana

inspect:
	docker inspect yana

rmi:
	docker rmi -f yana

stop:
	docker stop yana

start:
	docker start yana

