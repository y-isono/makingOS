# makingOS
30日でできる！OS自作入門を読んでMac OSで自作OSするリポジトリ

## コンパイル方法
```
nasm helloos.nas -o helloos.img
qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy
```