SUBDIRS := $(wildcard */.)

.PHONY: all $(SUBDIRS)
default: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@
