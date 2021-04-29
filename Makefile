# make OS
img : helloos.nas
	nasm helloos.nas -o helloos.img

# run OS
run : helloos.img
	qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy

# clean
clean :
	rm -f helloos.img
