lib1_src := foo.c bar.c
lib1_obj := $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(lib1_src))
lib1_dep := $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(lib1_src))
lib1 := build/$(ARCH)/$(D)/lib1.a

-include $(lib1_dep)

lib1: $(lib1)
$(lib1): $(lib1_obj)
	echo "  AR $@..."
	$(AR) -cr $@ $^
