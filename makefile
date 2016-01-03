.PHONY : all edit pdf read clean tidy

all: TARGET=all
edit: TARGET=edit
pdf: TARGET=pdf
read: TARGET=read
clean: TARGET=clean
tidy: TARGET=tidy

all edit pdf read clean tidy :
	@exec $(MAKE) -C src $(TARGET)


