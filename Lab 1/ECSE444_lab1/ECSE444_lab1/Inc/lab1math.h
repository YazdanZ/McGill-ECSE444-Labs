/*
 * lab1math.h
 *
 *  Created on: Sep. 13, 2022
 *      Author: yazdan
 */

#ifndef INC_LAB1MATH_H_
#define INC_LAB1MATH_H_

#include "main.h"

void cMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);
extern void asmMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);

void cMult(float *arr1, float *arr2, float *res, uint32_t len);
extern void asmMult(float *arr1, float *arr2, float *res, uint32_t len);

void cStd(float *arr, uint32_t len, float *std);
extern void asmStd(float *arr, uint32_t len, float *std);

#endif /* INC_LAB1MATH_H_ */
