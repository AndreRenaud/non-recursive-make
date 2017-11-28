lib2_src := lib2.c
lib2_obj := $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(lib2_src))
lib2_dep := $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(lib2_src))
lib2 := build/$(ARCH)/$(D)/lib2.a

lib2: $(lib2)
$(lib2): $(lib2_obj)
	echo "  AR $@..."
	$(AR) -cr $@ $^

-include $(lib2_dep)
