# Copyright (c) 2013-2018 The yana Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.
###############################################################################

TIMESTAMP= `date '+%Y%m%d%H%M%S'`

COMMON_FLAGS= -g -I. -I../include $(MY_COMMON_FLAGS)

CCFLAGS= $(COMMON_FLAGS) $(PLATFORM_CCFLAGS) $(MY_CCFLAGS)
CXXFLAGS= $(COMMON_FLAGS) $(PLATFORM_CXXFLAGS) $(MY_CXXFLAGS)

LDFLAGS= $(PLATFORM_SHARED_LDFLAGS) $(PLATFORM_LDFLAGS) $(MY_LDFLAGS)
LIBS= $(PLATFORM_LIBS) $(MY_LIBS)

CC_bin_OBJS= $(CC_bin_SRC_cc:.cc=.o) $(C_bin_SRC_c:.c=.o)
C_bin_OBJS= $(C_bin_SRC_c:.c=.o)
CC_shared_lib_OBJS= $(CC_shared_lib_SRC_cc:.cc=.o) $(C_shared_lib_SRC_c:.c=.o)
C_shared_lib_OBJS= $(C_shared_lib_SRC_c:.c=.o)
static_lib_OBJS= $(CC_static_lib_SRC_cc:.cc=.o) $(C_static_lib_SRC_c:.c=.o)

.SUFFIXES: .c .cc .h .o

cc_bin: $(CC_bin_OBJS)
	@-if test -r $(CC_bin); then exit; else \
	echo $(ECHO_OPT) "Building $(CC_bin) ... \c"; \
	$(CXX) -o $(CC_bin) $(CXXFLAGS) $(CC_bin_OBJS) $(LIBS); \
	echo "Ok"; \
	echo "--->>>>>>>>> MAKE OK <<<<<<<<<---"; \
	fi

c_bin: $(C_bin_OBJS)
	@-if test -r $(C_bin); then exit; else \
	echo $(ECHO_OPT) "Building $(C_bin) ... \c"; \
	$(CC) -o $(C_bin) $(CCFLAGS) $(C_bin_OBJS) $(LIBS); \
	echo "Ok"; \
	echo "--->>>>>>>>> MAKE OK <<<<<<<<<---"; \
	fi

cc_shared_lib: clean $(CC_shared_lib_OBJS)
	@-if test -r $(CC_shared_lib); then exit; else \
	echo $(ECHO_OPT) "Building $(CC_shared_lib) ... \c"; \
	$(CXX_LD) $(LDFLAGS) -o $(CC_shared_lib) $(CC_shared_lib_OBJS) $(LIBS); \
	echo "Ok"; \
	echo "--->>>>>>>>> MAKE OK <<<<<<<<<---"; \
	fi

c_shared_lib: clean $(C_shared_lib_OBJS)
	@-if test -r $(C_shared_lib); then exit; else \
	echo $(ECHO_OPT) "Building $(C_shared_lib) ... \c"; \
	$(CC_LD) $(LDFLAGS) -o $(C_shared_lib) $(C_shared_lib_OBJS) $(LIBS); \
	echo "Ok"; \
	echo "--->>>>>>>>> MAKE OK <<<<<<<<<---"; \
	fi

static_lib: $(static_lib_OBJS)
	@-if test -r $(Static_lib); then exit; else \
	echo $(ECHO_OPT) "Building $(Static_lib) ... \c"; \
	$(AR) $(ARFLAGS) $(Static_lib) $(static_lib_OBJS); \
	echo "Ok"; \
	echo "--->>>>>>>>> MAKE OK <<<<<<<<<---"; \
	fi

.PHONY: clean

clean:
	@-rm -f $(CC_bin_OBJS) $(C_bin_OBJS) $(CC_shared_lib_OBJS)
	@-rm -f $(C_shared_lib_OBJS) $(static_lib_OBJS)
	@-rm -f *.o
	@echo "*.o removed"

.cc.o:
	@echo $(ECHO_OPT) "$(CXX) $< ... \c"
	@$(CXX) -c $(CXXFLAGS) $< -o $@
	@echo OK

.c.o:
	@echo $(ECHO_OPT) "$(CC) $< ... \c"
	@$(CC) -o $@ -c $(CCFLAGS) $<
	@echo OK
