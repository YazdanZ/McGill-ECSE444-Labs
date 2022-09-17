/*
 * cmult.c
 *
 *  Created on: Sep. 17, 2022
 *      Author: yazdan
 */

# include "main.h"

void cMult(float *arr1, float *arr2, float *res, uint32_t len) {
	for (uint32_t i = 0; i < len; i++) {
		res[i] = arr1[i] * arr2[i];
	}
}
