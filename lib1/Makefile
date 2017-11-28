lib1_src = foo.c bar.c a.c b.c c.c d.c e.c f.c g.c h.c i.c j.c k.c l.c m.c n.c o.c p.c q.c r.c s.c t.c u.c v.c w.c x.c y.c z.c
lib1_obj = $(patsubst %.c,build/$(ARCH)/$(D)/%.o,$(lib1_src))
lib1_dep = $(patsubst %.c,build/$(ARCH)/$(D)/%.dep,$(lib1_src))
lib1 := build/$(ARCH)/$(D)/lib1.a

lib1: $(lib1)
$(lib1): $(lib1_obj)
	echo "  AR $@..."
	$(AR) -cr $@ $^

-include $(lib1_dep)
