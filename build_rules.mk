ARCH?=$(shell uname -m)

ifeq "$(ARCH)" "arm"
BUILDROOT?=$(shell readlink -f ../buildroot)
PKG_CONFIG?=$(BUILDROOT)/output/host/usr/bin/pkg-config
CROSS_COMPILE?=$(shell readlink -f ../arm-unknown-linux-gnueabi)/bin/arm-unknown-linux-gnueabi-
UBOOT_DIR?=$(shell readlink -f ../u-boot)
LINUX_DIR?=$(shell readlink -f ../linux)

CFLAGS += -march=armv5t
endif

ifeq "$(ARCH)" "x86_64"
PKG_CONFIG=pkg-config
endif

CC    = $(CROSS_COMPILE)gcc
CPP   = $(CROSS_COMPILE)g++
CXX   = $(CROSS_COMPILE)g++
AR    = $(CROSS_COMPILE)ar
LD    = $(CROSS_COMPILE)ld
STRIP = $(CROSS_COMPILE)strip

# Make sure we can access the various library include files directly
CFLAGS += -Ilib1 -Ilib2

CFLAGS+= -Werror -Wall -pipe
ifeq "$(DEBUG)" ""
        CFLAGS += -O2
else
        CFLAGS += -O -g
endif

ifeq "$(PROFILE)" "1"
        CFLAGS+=-pg --coverage
        LFLAGS+=-pg --coverage -lgcov
endif

# Turn on static analysis by default
C?=1
ifeq "$(C)" "0"
check_source =
else
CFLAGS+=-D_FORTIFY_SOURCE=2
check_source = echo "  CPPCHECK $1..." ; \
               cppcheck --quiet --std=c99 $1
endif

build/$(ARCH)/%.o : %.c
	echo "  CC $@..."
	mkdir -p $(dir $@)
	$(call check_source,$<)
	$(CC) $(CFLAGS) -c -o $@ $<

build/$(ARCH)/%.dep: %.c
ifneq ($(MAKECMDGOALS),clean)
	echo "  DEP $<..."
	mkdir -p $(dir $@)
	$(CC) $< $(CFLAGS) -MM -MG -MT $(basename $@).o -o $@
endif

# Turn off verbose output by default
V?=0
ifeq "$(V)" "0"
MAKEFLAGS = --no-print-directory --quiet
endif

