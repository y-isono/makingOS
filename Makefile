TOOLPATH = ./z_tools/
EDIMG    = $(TOOLPATH)edimg
IMGTOL   = $(TOOLPATH)imgtol
NASK     = nasm#$(TOOLPATH)nask

all : helloos.bin haribote.sys haribote.img

helloos.bin : ipl10.nas
	$(NASK) ipl10.nas -o helloos.bin

haribote.sys : haribote.nas
	$(NASK) haribote.nas -o haribote.sys

haribote.img : helloos.bin haribote.sys
	$(EDIMG)  imgin:./z_tools/fdimg0at.tek \
	wbinimg src:helloos.bin len:512 from:0 to:0 \
	copy from:haribote.sys to:@: \
	imgout:haribote.img

# make OS
img : haribote.img
	make -r haribote.img

# run OS
run :
	make img
	cp haribote.img ./z_tools/qemu/fdimage0.bin
	make -r -C ./z_tools/qemu

# clean
clean :
	rm -f *bin *sys *img
