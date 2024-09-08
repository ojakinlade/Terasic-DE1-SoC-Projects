HPS_INSTANCE_NAME=hps_0
TARGET_SW_APP_NAME= hps_fpga
TARGET_SW_SRC_DIR = HPS
TARGET_SW_APP = $(TARGET_SW_SRC_DIR)/$(TARGET_SW_APP_NAME)


ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)

HWLIBS_ROOT = $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
#CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -g -Wall -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/
LDFLAGS =  -g -Wall 
CC = $(CROSS_COMPILE)gcc
#ARCH= arm

#############
# Quartus II
# QUARTUS_SUBDIR = quartus_prj
# QUARTUS_QPF := $(firstword $(wildcard $(QUARTUS_SUBDIR)/*.qpf))
# ifeq ($(QUARTUS_QPF),)
# $(error ERROR: QUARTUS_QPF *.qpf file not set and could not be discovered)
# endif
# QUARTUS_QSF := $(patsubst %.qpf,%.qsf,$(QUARTUS_QPF))
# QUARTUS_BASE := $(basename $(QUARTUS_QPF))
# QUARTUS_HDL_SOURCE := $(wildcard *.v *.sv *.vhd)
# QUARTUS_MISC_SOURCE := $(wildcard *.stp *.sdc)

# # QSys
# QSYS_FILE := $(firstword $(wildcard $(QUARTUS_SUBDIR)/*top*.qsys) $(wildcard $(QUARTUS_SUBDIR)/*main*.qsys) $(wildcard $(QUARTUS_SUBDIR)/*soc*.qsys) $(wildcard $(QUARTUS_SUBDIR)/*.qsys))
# ifeq ($(QSYS_FILE),)
# $(error ERROR: QSYS_FILE *.qsys file not set and could not be discovered)
# endif
# QSYS_DEPS += $(wildcard $(QUARTUS_SUBDIR)/*.qsys)
# QSYS_BASE := $(basename $(QSYS_FILE))
# QSYS_QIP := $(wildard $(QSYS_BASE)/synthesis/$(QSYS_BASE).qip) $(wildcard $(QSYS_BASE)/$(QSYS_BASE).qip)
# QSYS_SOPCINFO := $(QSYS_BASE).sopcinfo

# QUARTUS_SOF := $(QUARTUS_BASE).sof
# QUARTUS_RBF := $(patsubst %.sof,%.rbf,$(QUARTUS_SOF))
# QUARTUS_RBF := $(patsubst $(QUARTUS_SOF),soc_system,$(QUARTUS_RBF))
# QUARTUS_CPF_ENABLE_COMPRESSION ?= 1
# ifeq ($(QUARTUS_CPF_ENABLE_COMPRESSION),1)
# QUARTUS_CPF_ARGS += -o bitstream_compression=on
# endif

HEADER_GEN_TOO=sopc-create-header-files

build: $(TARGET_SW_APP)

$(TARGET_SW_APP): $(TARGET_SW_APP).o
	$(CC) $(LDFLAGS)   $^ -o $@ 

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET_SW_APP) *.a *.o *~ *.rbf

dts:
	dtc -O dtb -o fpga.dtbo -b 0 -@ fpga.dts
version:
	$(CC) -v

#gen_header:
#$(HEADER_GEN_TOO) $(QSYS_SOPCINFO) --single $(TARGET_SW_SRC_DIR)/$(HPS_INSTANCE_NAME).h --module $(HPS_INSTANCE_NAME)

gen_header:
	$(HEADER_GEN_TOO) RTL/$(TARGET_SW_APP_NAME).sopcinfo --single $(TARGET_SW_SRC_DIR)/$(HPS_INSTANCE_NAME).h --module $(HPS_INSTANCE_NAME)

qsys_info:
	@echo "QSYS_BASE: $(QSYS_BASE)"
	@echo "QSYS_FILE: $(QSYS_FILE)"
	@echo "QSYS_DEPS: $(QSYS_DEPS)"
	@echo "QSYS_QIP: $(QSYS_QIP)"
	@echo "QSYS_SOPCINFO: $(QSYS_SOPCINFO)"

sof_info:
	@echo "QUARTUS_SOF: $(QUARTUS_SOF)"
	@echo "QUARTUS_RBF: $(QUARTUS_RBF)"

$(QUARTUS_RBF): %.rbf: %.sof
	quartus_cpf -c $(QUARTUS_CPF_ARGS) $< $@

.PHONY: rbf
rbf: $(QUARTUS_RBF)

.PHONY: create_rbf
create_rbf:
	quartus_cpf -c $(QUARTUS_CPF_ARGS) $(QUARTUS_SOF) $(QUARTUS_RBF)
	cp $(QUARTUS_RBF) $(QUARTUS_SUBDIR)/soc_system.rbf

################################################
# Device Tree

DTS.SOPC2DTS := sopc2dts
DTS.DTC := dtc

DTS.BOARDINFO ?= $(QSYS_BASE)_board_info.xml
DTS.COMMON ?= hps_common_board_info.xml

DTS.EXTRA_DEPS += $(DTS.BOARDINFO) $(DTS.COMMON)

DTS.SOPC2DTS_ARGS += $(if $(DTS.BOARDINFO),--board $(DTS.BOARDINFO))
DTS.SOPC2DTS_ARGS += $(if $(DTS.COMMON),--board $(DTS.COMMON))
DTS.SOPC2DTS_ARGS += --bridge-removal all
DTS.SOPC2DTS_ARGS += --clocks

define dts.sopc2dts
$(if $(DTS.BOARDINFO),,$(warning WARNING: DTS BoardInfo file was not specified or found))
$(DTS.SOPC2DTS) --input $1 --output $2 $3 $(DTS.SOPC2DTS_ARGS)
endef


# Device Tree Source (dts)
DEVICE_TREE_SOURCE := $(patsubst %.sopcinfo,%.dts,$(QSYS_SOPCINFO))

HELP_TARGETS += dts
dts.HELP := Generate a device tree for this qsys design

.PHONY: dts
dts: $(DEVICE_TREE_SOURCE)

ifeq ($(HAVE_QSYS),1)
$(DEVICE_TREE_SOURCE): $(QSYS_STAMP)
endif

$(DEVICE_TREE_SOURCE): %.dts: %.sopcinfo $(DTS.EXTRA_DEPS)
	$(call dts.sopc2dts,$<,$@)


# Device Tree Blob (dtb)
DEVICE_TREE_BLOB := $(patsubst %.sopcinfo,%.dtb,$(QSYS_SOPCINFO))

HELP_TARGETS += dtb
dtb.HELP := Generate a device tree blob for this qsys design

.PHONY: dtb
dtb: $(DEVICE_TREE_BLOB)

ifeq ($(HAVE_QSYS),1)
$(DEVICE_TREE_BLOB): $(QSYS_STAMP)
endif

$(DEVICE_TREE_BLOB): %.dtb: %.dts
	$(DTS.DTC) -I dts -O dtb -o $@ $<

SCRUB_CLEAN_FILES += $(DEVICE_TREE_SOURCE) $(DEVICE_TREE_BLOB)