# makingOS
30日でできる！OS自作入門を読んでMac OSで自作OSするリポジトリ

## コンパイル方法
```
make img
```
もしくは、
```
nasm helloos.nas -o helloos.img
```
## 実行方法
```
make run
```
もしくは、
```
qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy
```