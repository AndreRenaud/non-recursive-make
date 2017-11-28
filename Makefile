include build_rules.mk

# Make sure we can access the various library include files directly
CFLAGS += -Ilib1 -Ilib2

default: prog1

all: prog1 prog2

SUBDIRS=lib1 lib2 prog1 prog2

define INCLUDE_FILE
	D = $S
	include $S/Makefile
endef
$(foreach S,$(SUBDIRS),$(eval $(INCLUDE_FILE)))

.PHONY: clean
clean: $(CLEAN)
	echo "  CLEAN build/$(ARCH)..."
	rm -rf build/$(ARCH)/
	-rmdir build 2>/dev/null
