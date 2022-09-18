/*
 * asmstd.s
 *
 *  Created on: Sep. 17, 2022
 *      Author: yazdan
 */
.syntax unified

.global asmStd

.section .text.rodata

/**
* void asmStd(float *arr, uint32_t len, float *std);
*
* R0 = pointer to array
* R1 = lenght of the array
* R2 = pointer to standard deviation
*/

asmStd:
 // Callee-save convention
 PUSH {R4, R5}

 // move 0 to S0 (sum) as float
 MOV R5, #0
 VMOV S0, R5
 VCVT.f32.u32 S0, S0
 MOV R4, R1
 PUSH {R4}
premean:
 SUBS R4, R4, #1
 BLT mean // end summing up

 // find base address of arr element
 ADD R5, R0, R4, LSL #2

 // load arr element to flt registry
 // and add to sum
 VLDR.f32 S1, [R5]
 VADD.f32 S0, S0, S1

 B premean // loop

mean:
 VMOV S2, R1
 VCVT.f32.u32 S2, S2
 VDIV.f32 S0, S0, S2

 // move 0 (variance sum) as float to S2

 MOV R5, #0
 VMOV S2, R5
 VCVT.f32.u32 S2, S2

 POP {R4}
 SUB R5, R4, #1
 VMOV S3, R5
 VCVT.f32.u32 S3, S3

variance:
 SUBS R4, R4, #1
 BLT END
 ADD R5, R0, R4, LSL #2
 VLDR.f32 S4, [R5]
 VSUB.f32 S4, S4, S0 //(a[i - mean	)
 VMUL.f32 S4, S4, S4 // power of 2
 VDIV.f32 S4, S4, S3
 VADD.f32 S2, S2, S4
 B variance


END:
 VSQRT.f32 S2, S2
 VSTR.f32 S2, [R2]
 POP {R4, R5}
 BX LR
