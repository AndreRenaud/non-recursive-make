include build_rules.mk

default: prog1

SUBDIRS=lib1 lib2 prog1 prog2

define INCLUDE_FILE
	D = $S
	include $S/Makefile
endef
$(foreach S,$(SUBDIRS),$(eval $(INCLUDE_FILE)))

.PHONY: clean
clean:
	echo "  CLEAN build/$(ARCH)..."
	rm -rf build/$(ARCH)/
	-rmdir build 2>/dev/null