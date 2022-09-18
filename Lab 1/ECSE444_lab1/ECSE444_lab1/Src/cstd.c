/*
 * cstd.c
 *
 *  Created on: Sep. 17, 2022
 *      Author: yazdan
 */
#include "main.h"
#include <math.h>

float mean(float *arr, uint32_t len) {
	float tot = 0;
	for (uint32_t i = 0; i < len; i++)
		tot += arr[i];
	return tot / len;
}
void cStd(float *arr, uint32_t len, float *std) {
	float variance = 0;
	float mean_ = mean(arr, len);
	for (uint32_t i = 0; i < len; i++) {
		float temp = (arr[i] - mean_);
		temp = temp * temp;
		variance += temp / (len - 1);
	}

	(*std) = sqrt(variance);
}
