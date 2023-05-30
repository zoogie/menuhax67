#define IFile_Open 0x0022bdec+4 //0x0022bc6c+4 180
#define IFile_Read 0x0022bcd8+4  //0x0022bb58+4 180
#define FS_MountSdmc 0x00118bec+4
#define GSP_ForceLcdBlack 0x0012E120+4
#define GSPGPU_SERVHANDLEADR 0x0033bfd0

#define STACK_PIVOT 0x001002d8 //: ldmib r6!, {r2, r4, r5, ip, sp, lr, pc}
#define R6_SETUP 0x001829f0 //: ldr r6, [r5, #4] ; cmp r6, #0 ; beq #0x82a38 ; ldr r0, [r5] ; ldr r1, [r0, #4] ; mov r0, r5 ; blx r1     -0x100
#define POP_R0127PC 0x0023c914+1 //: pop {r0, r1, r2, r7, pc}
#define POP_R012347PC 0x001ead12+1 //: pop {r0, r1, r2, r3, r4, r7, pc}  0x80
#define ROP_POPPC 0x0010e5d8
#define POP_R0PC 0x00157920
#define POP_R1PC 0x0023735c   //0x002371dc  180

#define BASE 0x00347a10 
#define MNT 0x00322a76   // YS:
#define PATH 0x0023a94e  // YS:/Launcher.dat
#define FILE BASE-0x400