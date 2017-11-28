lib2_src = lib2.c
lib2_obj = $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(lib2_src))
lib2_dep = $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(lib2_src))
lib2 := build/$(ARCH)/$(D)/lib2.a
LIB2_CFLAGS = $(CFLAGS) $(shell $(PKG_CONFIG) --cflags zlib)

lib2: $(lib2)
$(lib2): $(lib2_obj)
	echo "  AR $@..."
	$(AR) -cr $@ $^

# Lib2 needs special CFLAGS
build/$(ARCH)/lib2/%.o : lib2/%.c
	echo "  CC $@..."
	mkdir -p $(dir $@)
	$(call check_source,$<)
	$(CC) $(LIB2_CFLAGS) -c -o $@ $<


-include $(lib2_dep)
