ARCH=ppc
TARGET=powerpc-linux-
CFLAGS=--target=powerpc64le-linux-gnu -m32 -mcpu=powerpc -msoft-float -fno-builtin -mbig-endian -mno-altivec -mno-vsx -mno-mma -mno-spe
AS_FLAGS=-fintegrated-as --target=powerpc64le-linux-gnu -m32 -mcpu=powerpc -msoft-float -fno-builtin -mbig-endian -mno-altivec -mno-vsx -mno-mma -mno-spe
HOSTARCH?=amd64
CROSSCFLAGS=-DSWAP_ENDIANNESS -DNATIVE_BITWIDTH_SMALLER_THAN_HOST_BITWIDTH
VERSION="1.1"
SRCDIR=/Users/setech/Src/Gits/qemu/roms/openbios
