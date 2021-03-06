#!/bin/bash

EMBEDDED_SHELL=/home/sboldenko/programs/intelFPGA_lite/17.1/embedded/embedded_command_shell.sh
SOCEDS_DEST_ROOT=/home/sboldenko/programs/intelFPGA_lite/17.1/embedded

SCRIPT_DIR=$(pwd)

echo $SCRIPT_DIR

cd ../

PROJECT_DIR=$(pwd)

echo $PROJECT_DIR

$EMBEDDED_SHELL bsp-create-settings \
--bsp-dir "$PROJECT_DIR/generated_files/software/spl_bsp" \
--preloader-settings-dir "$PROJECT_DIR/quartus/hps_isw_handoff/system_hps_0" \
--settings "$PROJECT_DIR/generated_files/software/spl_bsp/settings.bsp" \
--type spl \
--set spl.CROSS_COMPILE "arm-altera-eabi-" \
--set spl.PRELOADER_TGZ "${SOCEDS_DEST_ROOT}/host_tools/altera/preloader/uboot-socfpga.tar.gz" \
--set spl.boot.BOOTROM_HANDSHAKE_CFGIO "1" \
--set spl.boot.BOOT_FROM_NAND "0" \
--set spl.boot.BOOT_FROM_QSPI "0" \
--set spl.boot.BOOT_FROM_RAM "0" \
--set spl.boot.BOOT_FROM_SDMMC "1" \
--set spl.boot.CHECKSUM_NEXT_IMAGE "1" \
--set spl.boot.EXE_ON_FPGA "0" \
--set spl.boot.FAT_BOOT_PARTITION "1" \
--set spl.boot.FAT_LOAD_PAYLOAD_NAME "u-boot.img" \
--set spl.boot.FAT_SUPPORT "1" \
--set spl.boot.FPGA_DATA_BASE "0xffff0000" \
--set spl.boot.FPGA_DATA_MAX_SIZE "0x10000" \
--set spl.boot.FPGA_MAX_SIZE "0x10000" \
--set spl.boot.NAND_NEXT_BOOT_IMAGE "0xc0000" \
--set spl.boot.QSPI_NEXT_BOOT_IMAGE "0x60000" \
--set spl.boot.RAMBOOT_PLLRESET "1" \
--set spl.boot.SDMMC_NEXT_BOOT_IMAGE "0x40000" \
--set spl.boot.SDRAM_SCRUBBING "0" \
--set spl.boot.SDRAM_SCRUB_BOOT_REGION_END "0x2000000" \
--set spl.boot.SDRAM_SCRUB_BOOT_REGION_START "0x1000000" \
--set spl.boot.SDRAM_SCRUB_REMAIN_REGION "1" \
--set spl.boot.STATE_REG_ENABLE "1" \
--set spl.boot.WARMRST_SKIP_CFGIO "1" \
--set spl.boot.WATCHDOG_ENABLE "1" \
--set spl.debug.DEBUG_MEMORY_ADDR "0xfffffd00" \
--set spl.debug.DEBUG_MEMORY_SIZE "0x200" \
--set spl.debug.DEBUG_MEMORY_WRITE "0" \
--set spl.debug.HARDWARE_DIAGNOSTIC "0" \
--set spl.debug.SEMIHOSTING "0" \
--set spl.debug.SKIP_SDRAM "0" \
--set spl.performance.SERIAL_SUPPORT "1" \
--set spl.reset_assert.DMA "0" \
--set spl.reset_assert.GPIO0 "0" \
--set spl.reset_assert.GPIO1 "0" \
--set spl.reset_assert.GPIO2 "0" \
--set spl.reset_assert.L4WD1 "0" \
--set spl.reset_assert.OSC1TIMER1 "0" \
--set spl.reset_assert.SDR "0" \
--set spl.reset_assert.SPTIMER0 "0" \
--set spl.reset_assert.SPTIMER1 "0" \
--set spl.warm_reset_handshake.ETR "1" \
--set spl.warm_reset_handshake.FPGA "1" \
--set spl.warm_reset_handshake.SDRAM "0"

$EMBEDDED_SHELL bsp-generate-files \
--bsp-dir "$PROJECT_DIR/generated_files/software/spl_bsp" \
--settings "$PROJECT_DIR/generated_files/software/spl_bsp/settings.bsp"

cd $PROJECT_DIR/generated_files/software/spl_bsp

$EMBEDDED_SHELL make