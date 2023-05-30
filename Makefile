ifeq ($(strip $(REGION)),)
$(error "Set the REGION Makefile parameter.")
endif

HAXNAME := rop_payload
BASE_ADDR := 0

ifeq ($(REGION),USA)
	BASE_ADDR := 0x00346a10 
endif
ifeq ($(REGION),USA30)
	BASE_ADDR := 0x00347a10
endif
ifeq ($(REGION),EUR)
	BASE_ADDR := 0x00347a10
endif
ifeq ($(REGION),JPN)
	BASE_ADDR := 0x00347a10
endif
ifeq ($(REGION),KOR)
	BASE_ADDR := 0x00346a10
endif

all:	rop_payload.bin

clean:
	rm -f $(HAXNAME).elf rop_payload.bin rop_gadgets.h

rop_payload.bin: $(HAXNAME).elf
	arm-none-eabi-objcopy -O binary $(HAXNAME).elf rop_payload.bin

$(HAXNAME).elf:	$(HAXNAME).s
	arm-none-eabi-gcc -x assembler-with-cpp -nostartfiles -nostdlib -Ttext=$(BASE_ADDR) $< -o $(HAXNAME).elf

