
#
# dictionary rules
#

bootstrap-DICTIONARY :=
openbios-DICTIONARY :=
openbios-qemu-DICTIONARY :=
bootstrap-DICTIONARY:=$(bootstrap-DICTIONARY) forth/bootstrap/start.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/rstack.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/vocabulary.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/string.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/preprocessor.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/preinclude.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/creation.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/split.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/lists.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/64bit.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/lib/locals.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/structures.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/fcode.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/property.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/device.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/package.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/other.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/pathres.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/preof.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/font.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/logo.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/display.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/terminal.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/extra.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/feval.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/table.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/tree.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/device/builtin.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/debugging/client.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/debugging/fcode.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/debugging/firmware.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/debugging/see.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/devices.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/nvram.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/callback.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/help.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/iocontrol.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/banner.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/reset.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/power.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/script.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/security.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/selftest.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/admin/userboot.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/util/util.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/util/pci.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/packages/packages.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/system/main.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) forth/system/ciface.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) libopenbios/clib.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) libopenbios/helpers.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) packages/cmdline.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) packages/disk-label.fs
openbios-DICTIONARY:=$(openbios-DICTIONARY) drivers/pci.fs
openbios-qemu-DICTIONARY:=$(openbios-qemu-DICTIONARY) arch/ppc/ppc.fs
openbios-qemu-DICTIONARY:=$(openbios-qemu-DICTIONARY) arch/ppc/qemu/tree.fs
openbios-qemu-DICTIONARY:=$(openbios-qemu-DICTIONARY) arch/ppc/qemu/qemu.fs


$(ODIR)/bootstrap.dict: $(bootstrap-DICTIONARY) $(ODIR)/forthstrap
	$(call quiet-command,$(ODIR)/forthstrap -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/lib/ -I$(SRCDIR)/forth/device/ -I$(SRCDIR)/forth/debugging/ -I$(SRCDIR)/forth/admin/ -I$(SRCDIR)/forth/util/ -I$(SRCDIR)/forth/packages/ -I$(SRCDIR)/forth/system/ -I$(SRCDIR)/libopenbios/ -I$(SRCDIR)/packages/ -I$(SRCDIR)/drivers/ -I$(SRCDIR)/arch/ppc/ -I$(SRCDIR) -I$(ODIR)/forth -D $@ -M $@.d -c $@-console.log $(bootstrap-DICTIONARY),"  GEN   $(TARGET_DIR)$@")

$(ODIR)/openbios.dict: $(openbios-DICTIONARY) $(ODIR)/forthstrap $(ODIR)/bootstrap.dict
	$(call quiet-command,$(ODIR)/forthstrap -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/lib/ -I$(SRCDIR)/forth/device/ -I$(SRCDIR)/forth/debugging/ -I$(SRCDIR)/forth/admin/ -I$(SRCDIR)/forth/util/ -I$(SRCDIR)/forth/packages/ -I$(SRCDIR)/forth/system/ -I$(SRCDIR)/libopenbios/ -I$(SRCDIR)/packages/ -I$(SRCDIR)/drivers/ -I$(SRCDIR)/arch/ppc/ -I$(SRCDIR) -I$(ODIR)/forth -D $@ -M $@.d -d $(ODIR)/bootstrap.dict -c $@-console.log $(openbios-DICTIONARY),"  GEN   $(TARGET_DIR)$@")

$(ODIR)/openbios-qemu.dict: $(openbios-qemu-DICTIONARY) $(ODIR)/forthstrap $(ODIR)/openbios.dict $(ODIR)/QEMU,VGA.bin
	$(call quiet-command,$(ODIR)/forthstrap -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/bootstrap/ -I$(SRCDIR)/forth/lib/ -I$(SRCDIR)/forth/device/ -I$(SRCDIR)/forth/debugging/ -I$(SRCDIR)/forth/admin/ -I$(SRCDIR)/forth/util/ -I$(SRCDIR)/forth/packages/ -I$(SRCDIR)/forth/system/ -I$(SRCDIR)/libopenbios/ -I$(SRCDIR)/packages/ -I$(SRCDIR)/drivers/ -I$(SRCDIR)/arch/ppc/ -I$(SRCDIR) -I$(ODIR)/forth -D $@ -M $@.d -d $(ODIR)/openbios.dict -c $@-console.log $(openbios-qemu-DICTIONARY),"  GEN   $(TARGET_DIR)$@")

dictionaries: $(ODIR)/bootstrap.dict $(ODIR)/openbios.dict $(ODIR)/openbios-qemu.dict 

#
# fcode rules
#

$(ODIR)/QEMU,VGA.bin: $(SRCDIR)/drivers/vga.fs
	$(call quiet-command,$(TOKE) -o $@ $^,"  TOKE  $(TARGET_DIR)$@")


#
# host compiler rules
#

$(ODIR)/host/kernel/dict.o: kernel/dict.c
	$(call quiet-command,$(HOSTCC) $(HOSTCFLAGS) $(HOSTINCLUDES) -c -o $@ $<," HOSTCC $(TARGET_DIR)$@")
$(ODIR)/host/kernel/bootstrap.o: kernel/bootstrap.c
	$(call quiet-command,$(HOSTCC) $(HOSTCFLAGS) $(HOSTINCLUDES) -c -o $@ $<," HOSTCC $(TARGET_DIR)$@")
$(ODIR)/host/kernel/forth.o: kernel/forth.c
	$(call quiet-command,$(HOSTCC) $(HOSTCFLAGS) $(HOSTINCLUDES) -c -o $@ $<," HOSTCC $(TARGET_DIR)$@")
$(ODIR)/host/kernel/stack.o: kernel/stack.c
	$(call quiet-command,$(HOSTCC) $(HOSTCFLAGS) $(HOSTINCLUDES) -c -o $@ $<," HOSTCC $(TARGET_DIR)$@")
$(ODIR)/forthstrap: $(ODIR)/host/kernel/dict.o $(ODIR)/host/kernel/bootstrap.o $(ODIR)/host/kernel/forth.o $(ODIR)/host/kernel/stack.o
	$(call quiet-command,$(HOSTCC) $(HOSTCFLAGS) -o $@ $^," HOSTCC $(TARGET_DIR)$@")
host-libraries: 
host-executables:  $(ODIR)/forthstrap

#
# target compiler rules
#

$(ODIR)/target/kernel/dict.o: kernel/dict.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/kernel/forth.o: kernel/forth.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/kernel/stack.o: kernel/stack.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/ctype.o: libc/ctype.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/diskio.o: libc/diskio.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/extra.o: libc/extra.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/misc.o: libc/misc.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/string.o: libc/string.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libc/vsprintf.o: libc/vsprintf.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/ashldi3.o: libgcc/ashldi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/ashrdi3.o: libgcc/ashrdi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/__lshrdi3.o: libgcc/__lshrdi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/__divdi3.o: libgcc/__divdi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/__udivdi3.o: libgcc/__udivdi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/__udivmoddi4.o: libgcc/__udivmoddi4.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/__umoddi3.o: libgcc/__umoddi3.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libgcc/crtsavres.o: libgcc/crtsavres.S
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/bindings.o: libopenbios/bindings.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/bootcode_load.o: libopenbios/bootcode_load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/bootinfo_load.o: libopenbios/bootinfo_load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/client.o: libopenbios/client.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/console.o: libopenbios/console.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/elf_info.o: libopenbios/elf_info.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/elf_load.o: libopenbios/elf_load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/font_8x8.o: libopenbios/font_8x8.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/init.o: libopenbios/init.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/initprogram.o: libopenbios/initprogram.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/ipchecksum.o: libopenbios/ipchecksum.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/load.o: libopenbios/load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/ofmem_common.o: libopenbios/ofmem_common.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/prep_load.o: libopenbios/prep_load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/xcoff_load.o: libopenbios/xcoff_load.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/libopenbios/video_common.o: libopenbios/video_common.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/bootinfo-loader.o: packages/bootinfo-loader.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/cmdline.o: packages/cmdline.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/deblocker.o: packages/deblocker.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/disk-label.o: packages/disk-label.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/elf-loader.o: packages/elf-loader.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/init.o: packages/init.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/mac-parts.o: packages/mac-parts.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/nvram.o: packages/nvram.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/pc-parts.o: packages/pc-parts.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/packages/xcoff-loader.o: packages/xcoff-loader.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/pci.o: drivers/pci.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/pci_database.o: drivers/pci_database.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/ide.o: drivers/ide.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/timer.o: drivers/timer.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/kbd.o: drivers/kbd.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/adb_bus.o: drivers/adb_bus.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/adb_kbd.o: drivers/adb_kbd.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/adb_mouse.o: drivers/adb_mouse.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/cuda.o: drivers/cuda.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/pmu.o: drivers/pmu.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/vga_load_regs.o: drivers/vga_load_regs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/vga_set_mode.o: drivers/vga_set_mode.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/macio.o: drivers/macio.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/pc_kbd.o: drivers/pc_kbd.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/pc_serial.o: drivers/pc_serial.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/escc.o: drivers/escc.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/fw_cfg.o: drivers/fw_cfg.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/usb.o: drivers/usb.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/usbhid.o: drivers/usbhid.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/usbohci.o: drivers/usbohci.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/usbohci_rh.o: drivers/usbohci_rh.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/lsi.o: drivers/lsi.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/drivers/virtio.o: drivers/virtio.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ioglue.o: fs/ioglue.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/grubfs/grubfs_fs.o: fs/grubfs/grubfs_fs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/block.o: fs/hfs/block.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/btree.o: fs/hfs/btree.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/data.o: fs/hfs/data.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/file.o: fs/hfs/file.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/hfs.o: fs/hfs/hfs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/low.o: fs/hfs/low.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/medium.o: fs/hfs/medium.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/node.o: fs/hfs/node.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/record.o: fs/hfs/record.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/volume.o: fs/hfs/volume.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfs/hfs_fs.o: fs/hfs/hfs_fs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfs/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_blockiter.o: fs/hfsplus/hfsp_blockiter.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_btree.o: fs/hfsplus/hfsp_btree.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/libhfsp.o: fs/hfsplus/libhfsp.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_record.o: fs/hfsplus/hfsp_record.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_unicode.o: fs/hfsplus/hfsp_unicode.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_volume.o: fs/hfsplus/hfsp_volume.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/hfsplus/hfsp_fs.o: fs/hfsplus/hfsp_fs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/fs/hfsplus/include -I$(SRCDIR)/fs/ -fno-strict-aliasing  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_fs.o: fs/iso9660/iso9660_fs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_close.o: fs/iso9660/iso9660_close.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_closedir.o: fs/iso9660/iso9660_closedir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_lseek.o: fs/iso9660/iso9660_lseek.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_mount.o: fs/iso9660/iso9660_mount.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_open.o: fs/iso9660/iso9660_open.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_opendir.o: fs/iso9660/iso9660_opendir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_read.o: fs/iso9660/iso9660_read.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/iso9660/iso9660_readdir.o: fs/iso9660/iso9660_readdir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_close.o: fs/ext2/ext2_close.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_closedir.o: fs/ext2/ext2_closedir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_fs.o: fs/ext2/ext2_fs.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_lseek.o: fs/ext2/ext2_lseek.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_mount.o: fs/ext2/ext2_mount.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_open.o: fs/ext2/ext2_open.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_opendir.o: fs/ext2/ext2_opendir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_read.o: fs/ext2/ext2_read.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_readdir.o: fs/ext2/ext2_readdir.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/fs/ext2/ext2_utils.o: fs/ext2/ext2_utils.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/ofmem.o: arch/ppc/qemu/ofmem.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/qemu.o: arch/ppc/qemu/qemu.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/init.o: arch/ppc/qemu/init.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/main.o: arch/ppc/qemu/main.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/methods.o: arch/ppc/qemu/methods.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/vfd.o: arch/ppc/qemu/vfd.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/console.o: arch/ppc/qemu/console.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -I$(SRCDIR)/arch/ppc  -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/start.o: arch/ppc/qemu/start.S
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/switch.o: arch/ppc/qemu/switch.S
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/context.o: arch/ppc/qemu/context.c
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/timebase.o: arch/ppc/timebase.S
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $<,"  CC    $(TARGET_DIR)$@")
$(ODIR)/target/include/qemu-dict.h: $(ODIR)/openbios-qemu.dict
	$(call quiet-command,$(ODIR)/forthstrap -x -D $@ -d $< </dev/null, "  GEN   $(TARGET_DIR)$@")
$(ODIR)/target/arch/ppc/qemu/kernel.o: $(SRCDIR)/arch/ppc/qemu/kernel.c $(ODIR)/target/include/qemu-dict.h
	$(call quiet-command,$(CC) $$EXTRACFLAGS $(CFLAGS) $(INCLUDES) -c -o $@ $(SRCDIR)/arch/ppc/qemu/kernel.c, "  CC    $(TARGET_DIR)$@")
$(ODIR)/openbios-qemu.elf: $(ODIR)/target/arch/ppc/qemu/start.o $(ODIR)/target/arch/ppc/qemu/switch.o $(ODIR)/target/arch/ppc/qemu/context.o $(ODIR)/target/arch/ppc/timebase.o $(ODIR)/libqemu.a $(ODIR)/libbootstrap.a $(ODIR)/libopenbios.a $(ODIR)/libpackages.a $(ODIR)/libdrivers.a $(ODIR)/libfs.a $(ODIR)/liblibc.a $(ODIR)/libgcc.a
	$(call quiet-command,$(LD) --warn-common -N -T $(SRCDIR)/arch/$(ARCH)/qemu/ldscript -o $@.nostrip --whole-archive $^,"  LINK  $(TARGET_DIR)$@")
	$(call quiet-command,$(NM) $@.nostrip | sort > $(ODIR)/openbios-qemu.syms,"  GEN   $(TARGET_DIR)$@.syms")
	$(call quiet-command,$(STRIP) $@.nostrip -o $@,"  STRIP $(TARGET_DIR)$@")
$(ODIR)/libbootstrap.a: $(ODIR)/target/kernel/dict.o $(ODIR)/target/kernel/forth.o $(ODIR)/target/kernel/stack.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libdrivers.a: $(ODIR)/target/drivers/pci.o $(ODIR)/target/drivers/pci_database.o $(ODIR)/target/drivers/ide.o $(ODIR)/target/drivers/timer.o $(ODIR)/target/drivers/kbd.o $(ODIR)/target/drivers/adb_bus.o $(ODIR)/target/drivers/adb_kbd.o $(ODIR)/target/drivers/adb_mouse.o $(ODIR)/target/drivers/cuda.o $(ODIR)/target/drivers/pmu.o $(ODIR)/target/drivers/vga_load_regs.o $(ODIR)/target/drivers/vga_set_mode.o $(ODIR)/target/drivers/macio.o $(ODIR)/target/drivers/pc_kbd.o $(ODIR)/target/drivers/pc_serial.o $(ODIR)/target/drivers/escc.o $(ODIR)/target/drivers/fw_cfg.o $(ODIR)/target/drivers/usb.o $(ODIR)/target/drivers/usbhid.o $(ODIR)/target/drivers/usbohci.o $(ODIR)/target/drivers/usbohci_rh.o $(ODIR)/target/drivers/lsi.o $(ODIR)/target/drivers/virtio.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libfs.a: $(ODIR)/target/fs/ioglue.o $(ODIR)/target/fs/grubfs/grubfs_fs.o $(ODIR)/target/fs/hfs/block.o $(ODIR)/target/fs/hfs/btree.o $(ODIR)/target/fs/hfs/data.o $(ODIR)/target/fs/hfs/file.o $(ODIR)/target/fs/hfs/hfs.o $(ODIR)/target/fs/hfs/low.o $(ODIR)/target/fs/hfs/medium.o $(ODIR)/target/fs/hfs/node.o $(ODIR)/target/fs/hfs/record.o $(ODIR)/target/fs/hfs/volume.o $(ODIR)/target/fs/hfs/hfs_fs.o $(ODIR)/target/fs/hfsplus/hfsp_blockiter.o $(ODIR)/target/fs/hfsplus/hfsp_btree.o $(ODIR)/target/fs/hfsplus/libhfsp.o $(ODIR)/target/fs/hfsplus/hfsp_record.o $(ODIR)/target/fs/hfsplus/hfsp_unicode.o $(ODIR)/target/fs/hfsplus/hfsp_volume.o $(ODIR)/target/fs/hfsplus/hfsp_fs.o $(ODIR)/target/fs/iso9660/iso9660_fs.o $(ODIR)/target/fs/iso9660/iso9660_close.o $(ODIR)/target/fs/iso9660/iso9660_closedir.o $(ODIR)/target/fs/iso9660/iso9660_lseek.o $(ODIR)/target/fs/iso9660/iso9660_mount.o $(ODIR)/target/fs/iso9660/iso9660_open.o $(ODIR)/target/fs/iso9660/iso9660_opendir.o $(ODIR)/target/fs/iso9660/iso9660_read.o $(ODIR)/target/fs/iso9660/iso9660_readdir.o $(ODIR)/target/fs/ext2/ext2_close.o $(ODIR)/target/fs/ext2/ext2_closedir.o $(ODIR)/target/fs/ext2/ext2_fs.o $(ODIR)/target/fs/ext2/ext2_lseek.o $(ODIR)/target/fs/ext2/ext2_mount.o $(ODIR)/target/fs/ext2/ext2_open.o $(ODIR)/target/fs/ext2/ext2_opendir.o $(ODIR)/target/fs/ext2/ext2_read.o $(ODIR)/target/fs/ext2/ext2_readdir.o $(ODIR)/target/fs/ext2/ext2_utils.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libgcc.a: $(ODIR)/target/libgcc/ashldi3.o $(ODIR)/target/libgcc/ashrdi3.o $(ODIR)/target/libgcc/__lshrdi3.o $(ODIR)/target/libgcc/__divdi3.o $(ODIR)/target/libgcc/__udivdi3.o $(ODIR)/target/libgcc/__udivmoddi4.o $(ODIR)/target/libgcc/__umoddi3.o $(ODIR)/target/libgcc/crtsavres.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/liblibc.a: $(ODIR)/target/libc/ctype.o $(ODIR)/target/libc/diskio.o $(ODIR)/target/libc/extra.o $(ODIR)/target/libc/misc.o $(ODIR)/target/libc/string.o $(ODIR)/target/libc/vsprintf.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libopenbios.a: $(ODIR)/target/libopenbios/bindings.o $(ODIR)/target/libopenbios/bootcode_load.o $(ODIR)/target/libopenbios/bootinfo_load.o $(ODIR)/target/libopenbios/client.o $(ODIR)/target/libopenbios/console.o $(ODIR)/target/libopenbios/elf_info.o $(ODIR)/target/libopenbios/elf_load.o $(ODIR)/target/libopenbios/font_8x8.o $(ODIR)/target/libopenbios/init.o $(ODIR)/target/libopenbios/initprogram.o $(ODIR)/target/libopenbios/ipchecksum.o $(ODIR)/target/libopenbios/load.o $(ODIR)/target/libopenbios/ofmem_common.o $(ODIR)/target/libopenbios/prep_load.o $(ODIR)/target/libopenbios/xcoff_load.o $(ODIR)/target/libopenbios/video_common.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libpackages.a: $(ODIR)/target/packages/bootinfo-loader.o $(ODIR)/target/packages/cmdline.o $(ODIR)/target/packages/deblocker.o $(ODIR)/target/packages/disk-label.o $(ODIR)/target/packages/elf-loader.o $(ODIR)/target/packages/init.o $(ODIR)/target/packages/mac-parts.o $(ODIR)/target/packages/nvram.o $(ODIR)/target/packages/pc-parts.o $(ODIR)/target/packages/xcoff-loader.o 
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
$(ODIR)/libqemu.a: $(ODIR)/target/arch/ppc/qemu/ofmem.o $(ODIR)/target/arch/ppc/qemu/qemu.o $(ODIR)/target/arch/ppc/qemu/init.o $(ODIR)/target/arch/ppc/qemu/main.o $(ODIR)/target/arch/ppc/qemu/methods.o $(ODIR)/target/arch/ppc/qemu/vfd.o $(ODIR)/target/arch/ppc/qemu/console.o  $(ODIR)/target/arch/ppc/qemu/kernel.o
	$(call quiet-command,$(AR) cru $@ $^; $(RANLIB) $@,"  AR    $(TARGET_DIR)$@")
target-libraries: 
target-executables:  $(ODIR)/target/include/qemu-dict.h $(ODIR)/target/arch/ppc/qemu/kernel.o $(ODIR)/openbios-qemu.elf
