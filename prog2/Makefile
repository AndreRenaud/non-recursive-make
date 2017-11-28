prog2_src = main.c
prog2_obj = $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(prog2_src))
prog2_dep = $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(prog2_src))
prog2 := build/$(ARCH)/$(D)/prog2

PROG2_LFLAGS = $(LFLAGS) $(shell $(PKG_CONFIG) --libs zlib)

prog2: $(prog2)
$(prog2): $(prog2_obj) $(lib1) $(lib2)
	echo "  LD $@..."
	$(CC) -o $@ $^ $(PROG2_LFLAGS) $(lib1) $(lib2)

-include $(prog2_dep)

