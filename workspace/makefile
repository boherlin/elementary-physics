SUBDIRS = \
	1-masses-combined-in-series-and-in-parallel \
	2-increasing-momentum-or-charge \
	3-mechanical-electrical-analogies \
	4-increasing-magnetic-flux \
	5-increasing-energy

.PHONY : $(SUBDIRS) recurse

all: TARGET=all
edit: TARGET=edit
pdf: TARGET=pdf
read: TARGET=read
clean: TARGET=clean
tidy: TARGET=tidy

recurse all edit pdf read clean tidy : $(SUBDIRS)

$(SUBDIRS):
	@exec $(MAKE) -C $@ $(TARGET)


