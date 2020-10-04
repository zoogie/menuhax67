#include "rop_gadgets.h"
.arm
	.text

#define ROPADDR 0x35040000  //linearmem dst for Launcher.dat - 0x38C40000 for new3ds, will be patched in at 3dsx installer runtime if needed
#define ROPSIZE 0x10110     //Launcher.dat size - cannot be smaller than this (this is the default *hax ropbin size)
#define GARBAGE 0x44444444

	.global	_start  		// this payload is copied inside cfg savegame block 0xC0000, which is 3ds parental controls (size 0xC0)
@---------------------------------------// the initial exploit handling starts at offset 0xA8 then pivots back here at offset 0 to finish loading Launcher.dat to linearmem, and then jumping to it
_start:	

	.word 0				// zeroed out so parental controls wont be activated
	.word POP_R0PC			// arg1 GSP_ForceLcdBlack
		.word GSPGPU_SERVHANDLEADR // (r0)
	.word GSP_ForceLcdBlack		//
		.word GARBAGE 		// (--) sp+=8 then pop r4,pc
		.word GARBAGE 		// (r1) - SetLcdForceBlacks arg1 (u8 boolean) due to it loading r1 from a stack pointer offset
		.word GARBAGE 		// (r4)
	.word POP_R0PC			// pop {r0 pc}
		.word MNT		// (r0) - mount address
	.word POP_R1PC			// pop {r1 pc}
		.word 0x9 		// (r1) - direct SDMC code          
	.word FS_MountSdmc		// FS_MountSdmc(): r0=mount_addr  r1=sd code 9
		.word GARBAGE		// (r4)
		.word GARBAGE		// (r5)
		.word GARBAGE		// (r6)
	.word POP_R0127PC		// pop {r0 r1 r2 r7 pc}
		.word FILE		// (r0) - _this
		.word PATH		// (r1) - path
		.word 0x00000001	// (r2) - openflags (read only)
		.word GARBAGE   	// (r5)
	.word IFile_Open		// IFile_Open(): r0=_this r1=UTF16 path r2=openflags ends with ldmfd sp! {r4-r8pc}
		.word GARBAGE		// (r4)
		.word GARBAGE		// (r5)
		.word GARBAGE		// (r6)
		.word GARBAGE		// (r7)
		.word GARBAGE		// (r8)
	.word POP_R012347PC		// ldmfd sp! {r0pc}
		.word FILE		// (r0) - _this
		.word FILE + 32		// (r1) - &writtenbytes
		.word ROPADDR		// (r2) - src
		.word ROPSIZE		// (r3) - size
		.word GARBAGE		// (r4)
		.word GARBAGE		// (r7)
	.word IFile_Read		// IFile_Read(_this &writtenbytes src size) ends with ldmfd sp! {r4-r9pc}
		.word GARBAGE		// (r4)
		.word GARBAGE		// (r5)
		.word . - 0x10		// (r6) base address for the upcoming stack pivot: ldmib r6!, {r2, r4, r5, ip, sp, lr, pc}
		.word ROPADDR		// (r7) sp ROPADDR is dst (Launcher.dat)
		.word GARBAGE		// (r8) lr (dont care)
		.word ROP_POPPC		// (r9) pc
	.word STACK_PIVOT		// pivot to sd rop payload Launcher.dat
stage0_end: 

.fill	((_start + 0xA8 - stage0_end)/4),4, GARBAGE

	.word BASE + 0xA8 + 0x4;  	//r6 setup ldr address
	.word BASE + 0xA8 - 0x8;  	//stack pivot register address (r6)
	.word STACK_PIVOT; 		//stack pivot
	.word BASE + 4; 		//sp
	.word R6_SETUP;  		//r6 setup for stack pivot
	.word ROP_POPPC;   		//pc