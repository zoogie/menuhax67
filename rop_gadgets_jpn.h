#define IFile_Open 0x0022be20+4
#define IFile_Read 0x0022bd0c+4
#define FS_MountSdmc 0x00118bec+4
#define GSP_ForceLcdBlack 0x0012E120+4
#define GSPGPU_SERVHANDLEADR 0x0033bfd0

#define STACK_PIVOT 0x001002d8 //: ldmib r6!, {r2, r4, r5, ip, sp, lr, pc}
#define R6_SETUP 0x00182af0 //: ldr r6, [r5, #4] ; cmp r6, #0 ; beq #0x82a38 ; ldr r0, [r5] ; ldr r1, [r0, #4] ; mov r0, r5 ; blx r1
#define POP_R0127PC 0x002bf54c+1 //: pop {r0, r1, r2, r6, pc}
#define POP_R012347PC 0x001eae46+1 //: pop {r0, r1, r2, r3, r4, r7, pc}
#define ROP_POPPC 0x0010e5d8
#define POP_R0PC 0x00157920
#define POP_R1PC 0x00237390

#define BASE 0x00347a10
#define MNT 0x00322a76   // YS:
#define PATH 0x0023a856  // YS:/Launcher.dat
#define FILE BASE-0x400