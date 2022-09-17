/*
 * asmmult.s
 *
 *  Created on: Sep. 17, 2022
 *      Author: yazdan
 */
.syntax unified

.global asmMult

.section .text.rodata

/**
* void asmMult(float *arr1, float *arr2, float *res, uint32_t len);
*
* R0 = pointer to array1
* R1 = pointer to array2
* R2 = pointer to results array
* R3 = size of array
*/

asmMult:
  PUSH {R4, R5}

loop:
 SUBS R3, R3, #1 // size = size - 1
 BLT done // loop finishes when R1 < 0
 ADD R4, R0, R3, LSL #2 // calculate base address for arr1 el
 ADD R5, R1, R3, LSL #2 // calculate base address for arr1 el

 VLDR.f32 S0, [R4] // load arr1 element into float register S0
 VLDR.f32 S1, [R5] // load arr1 element into float register S1
 VMUL.f32 S2, S0, S1

 ADD R4, R2, R3, LSL #2 // calculate base address for results el
 VSTR.f32 S2, [R4]

continue:
 B loop

done:
 POP {R4, R5}
 BX LR
