prog1_src = main.c
prog1_obj = $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(prog1_src))
prog1_dep = $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(prog1_src))
prog1 := build/$(ARCH)/$(D)/prog1

prog1: $(prog1)
$(prog1): $(prog1_obj) $(lib1)
	echo "  LD $@..."
	$(CC) -o $@ $^ $(LFLAGS) $(lib1)

-include $(prog1_dep)
