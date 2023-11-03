#ifndef _INTERPOLATION_H
#define _INTERPOLATION_H
#include "upsampling.h"

void near_16_generate(BYTE(*near_dot_16_4k)[4], BYTE(*dot_9_1k)[3]);//最近邻插值
void binear_16_generate(BYTE(*binear_dot_16_4k)[4], BYTE(*dot_9_1k)[3]);//新型双线性插值
void edge_16_generate(BYTE(*edge_dot_16_4k)[4], BYTE(*dot_9_1k)[3]);//边缘插值

void average_adjust_16point(BYTE(*adjust_dot_16_4k)[4], BYTE(*dot_16_4k)[4], BYTE average);//16点的均值调整

void interpolate_16point(BYTE(*final_dot_16_4k)[4], BYTE(*dot_9_1k)[3]);//根据sobel算子选择边缘插值、双线性插值、最近邻插值

void interpolation(BYTE(*final_dot_16_4k)[4], BYTE(*dot_25_1k)[5]);//根据输入的25点1k图片像素，得到最终的4k图片的16个像素

void final_interpolation_x4(BYTE(*image_4k_data)[3840], BYTE(*image_1k_data)[960]);//求出4k图像的r,g,b中的一个



#endif // !1
