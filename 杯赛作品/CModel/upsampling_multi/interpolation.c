#define _CRT_SECURE_NO_WARNINGS 1
#include "upsampling.h"
#include "interpolation.h"

//最近邻插值
void near_16_generate(BYTE(* near_dot_16_4k)[4], BYTE(*dot_9_1k)[3])
{
	for (int i=0;i<4;i++)
	{
		for (int j=0;j<4;j++)
		{
			near_dot_16_4k[i][j] = dot_9_1k[1][1];
		}
	}
}

//新型双线性插值
void binear_16_generate(BYTE(*binear_dot_16_4k)[4], BYTE(*dot_9_1k)[3])
{
	//左上4点
	float x = 0, y = 0;
	x = ((float)5) / 8; y = ((float)5) / 8;
	binear_dot_16_4k[0][0]=(1-x)*(1-y)*dot_9_1k[0][0]+x*(1-y)*dot_9_1k[0][1]+(1-x)*y*dot_9_1k[1][0]+x*y*dot_9_1k[1][1];
	x = ((float)7) / 8; y = ((float)5) / 8;
	binear_dot_16_4k[0][1]=(1-x)*(1-y)*dot_9_1k[0][0]+x*(1-y)*dot_9_1k[0][1]+(1-x)*y*dot_9_1k[1][0]+x*y*dot_9_1k[1][1];
	x = ((float)5) / 8; y = ((float)7) / 8;
	binear_dot_16_4k[1][0]=(1-x)*(1-y)*dot_9_1k[0][0]+x*(1-y)*dot_9_1k[0][1]+(1-x)*y*dot_9_1k[1][0]+x*y*dot_9_1k[1][1];
	x = ((float)7) / 8; y = ((float)7) / 8;
	binear_dot_16_4k[1][1]=(1-x)*(1-y)*dot_9_1k[0][0]+x*(1-y)*dot_9_1k[0][1]+(1-x)*y*dot_9_1k[1][0]+x*y*dot_9_1k[1][1];
	//右上4点
	x = ((float)1) / 8; y = ((float)5) / 8;
	binear_dot_16_4k[0][2]=(1-x)*(1-y)*dot_9_1k[0][1]+x*(1-y)*dot_9_1k[0][2]+(1-x)*y*dot_9_1k[1][1]+x*y*dot_9_1k[1][2];
	x = ((float)3) / 8; y = ((float)5) / 8;
	binear_dot_16_4k[0][3]=(1-x)*(1-y)*dot_9_1k[0][1]+x*(1-y)*dot_9_1k[0][2]+(1-x)*y*dot_9_1k[1][1]+x*y*dot_9_1k[1][2];
	x = ((float)1) / 8; y = ((float)7) / 8;
	binear_dot_16_4k[1][2]=(1-x)*(1-y)*dot_9_1k[0][1]+x*(1-y)*dot_9_1k[0][2]+(1-x)*y*dot_9_1k[1][1]+x*y*dot_9_1k[1][2];
	x = ((float)3) / 8; y = ((float)7) / 8;
	binear_dot_16_4k[1][3]=(1-x)*(1-y)*dot_9_1k[0][1]+x*(1-y)*dot_9_1k[0][2]+(1-x)*y*dot_9_1k[1][1]+x*y*dot_9_1k[1][2];
	//左下4点
	x = ((float)5) / 8; y = ((float)1) / 8;
	binear_dot_16_4k[2][0]=(1-x)*(1-y)*dot_9_1k[1][0]+x*(1-y)*dot_9_1k[1][1]+(1-x)*y*dot_9_1k[2][0]+x*y*dot_9_1k[2][1];
	x = ((float)7) / 8; y = ((float)1) / 8;
	binear_dot_16_4k[2][1]=(1-x)*(1-y)*dot_9_1k[1][0]+x*(1-y)*dot_9_1k[1][1]+(1-x)*y*dot_9_1k[2][0]+x*y*dot_9_1k[2][1];
	x = ((float)5) / 8; y = ((float)3) / 8;
	binear_dot_16_4k[3][0]=(1-x)*(1-y)*dot_9_1k[1][0]+x*(1-y)*dot_9_1k[1][1]+(1-x)*y*dot_9_1k[2][0]+x*y*dot_9_1k[2][1];
	x = ((float)7) / 8; y = ((float)3) / 8;
	binear_dot_16_4k[3][1]=(1-x)*(1-y)*dot_9_1k[1][0]+x*(1-y)*dot_9_1k[1][1]+(1-x)*y*dot_9_1k[2][0]+x*y*dot_9_1k[2][1];
	//右下4点
	x = ((float)1) / 8; y = ((float)1) / 8;
	binear_dot_16_4k[2][2]=(1-x)*(1-y)*dot_9_1k[1][1]+x*(1-y)*dot_9_1k[1][2]+(1-x)*y*dot_9_1k[2][1]+x*y*dot_9_1k[2][2];
	x = ((float)3) / 8; y = ((float)1) / 8;
	binear_dot_16_4k[2][3]=(1-x)*(1-y)*dot_9_1k[1][1]+x*(1-y)*dot_9_1k[1][2]+(1-x)*y*dot_9_1k[2][1]+x*y*dot_9_1k[2][2];
	x = ((float)1) / 8; y = ((float)3) / 8;
	binear_dot_16_4k[3][2]=(1-x)*(1-y)*dot_9_1k[1][1]+x*(1-y)*dot_9_1k[1][2]+(1-x)*y*dot_9_1k[2][1]+x*y*dot_9_1k[2][2];
	x = ((float)3) / 8; y = ((float)3) / 8;
	binear_dot_16_4k[3][3]=(1-x)*(1-y)*dot_9_1k[1][1]+x*(1-y)*dot_9_1k[1][2]+(1-x)*y*dot_9_1k[2][1]+x*y*dot_9_1k[2][2];
}


//边缘插值
void edge_16_generate(BYTE(*edge_dot_16_4k)[4], BYTE(*dot_9_1k)[3])
{
	int i = 0, j = 0;
	float x1 = 0, x[4] = { ((float)1)/8,((float)3)/8,((float)5)/8,((float)7)/8 };
	//水平方向
	BYTE edge_dot_16_4k_r[4][4] = { 0 };
	BYTE pixel_left = 0, pixel_right = 0;
	int	 d_left = 0, d_right = 0;
	int  d1_left = dot_9_1k[0][1] - dot_9_1k[0][0];
	int  d1_right = dot_9_1k[0][2] - dot_9_1k[0][1];
	int  d2_left = dot_9_1k[1][1] - dot_9_1k[1][0];
	int  d2_right = dot_9_1k[1][2] - dot_9_1k[1][1];
	int  d3_left = dot_9_1k[2][1] - dot_9_1k[2][0];
	int  d3_right = dot_9_1k[2][2] - dot_9_1k[2][1];
	//第一行
	pixel_left = ((float)5) / 8 * dot_9_1k[1][0] + ((float)3) / 8 * dot_9_1k[0][0];
	pixel_right= ((float)5) / 8 * dot_9_1k[1][2] + ((float)3) / 8 * dot_9_1k[0][2];
	d_left = ((float)5) / 8 * d2_left + ((float)3) / 8 * d1_left;
	d_right = ((float)5) / 8 * d2_right + ((float)3) / 8 * d1_right;
	if (abs(d_right) + abs(d_left) == 0) { x1 = 0; }else { x1 = ((float)abs(d_right)) / (abs(d_right) + abs(d_left)); }
	for (i = 0; i < 4; i++)
	{
		if(x[i]<x1)
			edge_dot_16_4k_r[0][i] = pixel_left;
		else
			edge_dot_16_4k_r[0][i] = pixel_right;
	}
	//第二行
	pixel_left = ((float)7) / 8 * dot_9_1k[1][0] + ((float)1) / 8 * dot_9_1k[0][0];
	pixel_right = ((float)7) / 8 * dot_9_1k[1][2] + ((float)1) / 8 * dot_9_1k[0][2];
	d_left = ((float)7) / 8 * d2_left + ((float)1) / 8 * d1_left;
	d_right = ((float)7) / 8 * d2_right + ((float)1) / 8 * d1_right;
	if (abs(d_right) + abs(d_left) == 0) { x1 = 0; }else { x1 = ((float)abs(d_right)) / (abs(d_right) + abs(d_left)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_r[1][i] = pixel_left;
		else
			edge_dot_16_4k_r[1][i] = pixel_right;
	}
	//第三行
	pixel_left = ((float)7) / 8 * dot_9_1k[1][0] + ((float)1) / 8 * dot_9_1k[2][0];
	pixel_right = ((float)7) / 8 * dot_9_1k[1][2] + ((float)1) / 8 * dot_9_1k[2][2];
	d_left = ((float)7) / 8 * d2_left + ((float)1) / 8 * d3_left;
	d_right = ((float)7) / 8 * d2_right + ((float)1) / 8 * d3_right;
	if (abs(d_right) + abs(d_left) == 0) { x1 = 0; }else { x1 = ((float)abs(d_right)) / (abs(d_right) + abs(d_left)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_r[2][i] = pixel_left;
		else
			edge_dot_16_4k_r[2][i] = pixel_right;
	}
	//第四行
	pixel_left =(( float)5) / 8 * dot_9_1k[1][0] + ((float)3) / 8 * dot_9_1k[2][0];
	pixel_right = ((float)5) / 8 * dot_9_1k[1][2] + ((float)3) / 8 * dot_9_1k[2][2];
	d_left = ((float)5) / 8 * d2_left + ((float)3) / 8 * d3_left;
	d_right = ((float)5) / 8 * d2_right + ((float)3) / 8 * d3_right;
	if (abs(d_right) + abs(d_left) == 0) { x1 = 0; }else { x1 = ((float)abs(d_right)) / (abs(d_right) + abs(d_left)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_r[3][i] = pixel_left;
		else
			edge_dot_16_4k_r[3][i] = pixel_right;
	}
	//垂直方向
	BYTE edge_dot_16_4k_c[4][4] = { 0 };
	BYTE pixel_up = 0, pixel_down = 0;
	int	 d_up = 0, d_down = 0;
	int  d1_up = dot_9_1k[1][0] - dot_9_1k[0][0];
	int  d1_down = dot_9_1k[2][0] - dot_9_1k[1][0];
	int  d2_up = dot_9_1k[1][1] - dot_9_1k[0][1];
	int  d2_down = dot_9_1k[2][1] - dot_9_1k[1][1];
	int  d3_up = dot_9_1k[1][2] - dot_9_1k[0][2];
	int  d3_down = dot_9_1k[2][2] - dot_9_1k[1][2];
	//第一列
	pixel_up = ((float)5) / 8 * dot_9_1k[0][1] + ((float)3) / 8 * dot_9_1k[0][0];
	pixel_down = ((float)5) / 8 * dot_9_1k[2][1] + ((float)3) / 8 * dot_9_1k[2][0];
	d_up = ((float)5) / 8 * d2_up + ((float)3) / 8 * d1_up;
	d_down = ((float)5) / 8 * d2_down + ((float)3) / 8 * d1_down;
	if (abs(d_down) + abs(d_up) == 0) { x1 = 0; }else { x1 = ((float)abs(d_down)) / (abs(d_down) + abs(d_up)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_c[i][0] = pixel_up;
		else
			edge_dot_16_4k_c[i][0] = pixel_down;
	}
	//第二列
	pixel_up = ((float)7) / 8 * dot_9_1k[0][1] + ((float)1) / 8 * dot_9_1k[0][0];
	pixel_down = ((float)7) / 8 * dot_9_1k[2][1] + ((float)1) / 8 * dot_9_1k[2][0];
	d_up = ((float)7) / 8 * d2_up + ((float)1) / 8 * d1_up;
	d_down = ((float)7) / 8 * d2_down + ((float)1) / 8 * d1_down;
	if (abs(d_down) + abs(d_up) == 0) { x1 = 0; }else { x1 = ((float)abs(d_down)) / (abs(d_down) + abs(d_up)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_c[i][1] = pixel_up;
		else
			edge_dot_16_4k_c[i][1] = pixel_down;
	}
	//第三列
	pixel_up = ((float)7) / 8 * dot_9_1k[0][1] + ((float)1) / 8 * dot_9_1k[0][2];
	pixel_down = ((float)7) / 8 * dot_9_1k[2][1] + ((float)1) / 8 * dot_9_1k[2][2];
	d_up = ((float)7) / 8 * d2_up + ((float)1) / 8 * d3_up;
	d_down = ((float)7) / 8 * d2_down + ((float)1) / 8 * d3_down;
	if (abs(d_down) + abs(d_up) == 0) { x1 = 0; }else { x1 = ((float)abs(d_down)) / (abs(d_down) + abs(d_up)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_c[i][2] = pixel_up;
		else
			edge_dot_16_4k_c[i][2] = pixel_down;
	}
	//第四列
	pixel_up = ((float)5) / 8 * dot_9_1k[0][1] + ((float)3) / 8 * dot_9_1k[0][2];
	pixel_down = ((float)5) / 8 * dot_9_1k[2][1] + ((float)3) / 8 * dot_9_1k[2][2];
	d_up = ((float)5) / 8 * d2_up + ((float)3) / 8 * d3_up;
	d_down = ((float)5) / 8 * d2_down + ((float)3) / 8 * d3_down;
	if (abs(d_down) + abs(d_up) == 0) { x1 = 0; }else { x1 = ((float)abs(d_down)) / (abs(d_down) + abs(d_up)); }
	for (i = 0; i < 4; i++)
	{
		if (x[i] < x1)
			edge_dot_16_4k_c[i][3] = pixel_up;
		else
			edge_dot_16_4k_c[i][3] = pixel_down;
	}
	//行列所得像素值求和除2
	int	edge_dot_16_4k_r_add_c[4][4] = {0};
	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 4; j++)
		{
			edge_dot_16_4k_r_add_c[i][j] = (edge_dot_16_4k_r[i][j] + edge_dot_16_4k_c[i][j])/2;
			edge_dot_16_4k[i][j] = edge_dot_16_4k_r_add_c[i][j];
		}
	}
}





//16点的均值调整
void average_adjust_16point(BYTE(*adjust_dot_16_4k)[4], BYTE(*dot_16_4k)[4], BYTE average)
{
	int i = 0, j = 0, sum = 0;
	int temp[4][4] = {0};
	for (i=0;i<4;i++)
	{
		for (j=0;j<4;j++)
		{
			sum = sum + dot_16_4k[i][j];
		}
	}
	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 4; j++)
		{
			temp[i][j] =dot_16_4k[i][j]-sum/16+ average;
		}
	}
	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 4; j++)
		{
			if (temp[i][j] > 255)
				adjust_dot_16_4k[i][j] = 255;
			else if(temp[i][j] <0)
				adjust_dot_16_4k[i][j] = 0;
			else
				adjust_dot_16_4k[i][j] = temp[i][j];
		}
	}
}

//根据sobel算子选择边缘插值、双线性插值、最近邻插值
void interpolate_16point(BYTE(*final_dot_16_4k)[4], BYTE(*dot_9_1k)[3])
{
	int T_min = 10;
	int T_max = 120;
	//求出水平，竖直sobel差值
	int	d_r =dot_9_1k[0][2]-dot_9_1k[0][0]+2*(dot_9_1k[1][2]-dot_9_1k[1][0])+dot_9_1k[2][2]-dot_9_1k[2][0];
	int	d_c= dot_9_1k[2][0]-dot_9_1k[0][0]+2*(dot_9_1k[2][1]-dot_9_1k[0][1])+dot_9_1k[2][2]-dot_9_1k[0][2];
	if (abs(d_r)<= T_min && abs(d_c) <= T_min)			//采用近邻插值
		edge_16_generate(final_dot_16_4k,dot_9_1k);
	else if(abs(d_r)>= T_max ||abs(d_c) >= T_max)		//采用边缘插值
		edge_16_generate(final_dot_16_4k, dot_9_1k);
	else												// 采用双线性插值
		edge_16_generate(final_dot_16_4k, dot_9_1k);
}

//根据输入的25点1k图片像素，得到最终的4k图片的16个像素
void interpolation(BYTE(*final_dot_16_4k)[4], BYTE(*dot_25_1k)[5])
{
	BYTE gauss_dot_36_4k[6][6] = { 0 };
	BYTE dot_9_1k[3][3] = { 0 };
	BYTE temp[4][4] = { 0 };
	BYTE temp_average_adjust[4][4] = { 0 };
	BYTE temp_final_dot_16_4k[4][4] = { 0 };
	int i = 0, j = 0,sum=0;
	//高斯滤波第1行
	for (i=0;i<3;i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i][j];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	gauss_dot_36_4k[0][0] = temp_average_adjust[3][3];

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i][j+1];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	for (i=0;i<4;i++)
	{
		gauss_dot_36_4k[0][i+1] = temp_average_adjust[3][i];
	}

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i][j + 2];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	gauss_dot_36_4k[0][5] = temp_average_adjust[3][0];

	//高斯滤波第2：5行
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i+1][j];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	for (i = 0; i < 4; i++)
	{
		gauss_dot_36_4k[i+1][0] = temp_average_adjust[i][3];
	}

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i + 1][j+1];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 4; j++)
		{
			gauss_dot_36_4k[i+1][j+1] = temp_average_adjust[i][j];
		}
	}

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i + 1][j + 2];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	for (i = 0; i < 4; i++)
	{
		gauss_dot_36_4k[i + 1][5] = temp_average_adjust[i][0];
	}

	//高斯滤波第6行
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i + 2][j];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	gauss_dot_36_4k[5][0] = temp_average_adjust[0][3];

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i + 2][j+1];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	for (i = 0; i < 4; i++)
	{
		gauss_dot_36_4k[5][i+1] = temp_average_adjust[0][i];
	}

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			dot_9_1k[i][j] = dot_25_1k[i + 2][j + 2];
		}
	}
	interpolate_16point(temp, dot_9_1k);
	average_adjust_16point(temp_average_adjust, temp, dot_9_1k[1][1]);
	gauss_dot_36_4k[5][5] = temp_average_adjust[0][0];
	//已经得到需要高斯平滑的36点，开始进行高斯平滑
	for (i=0;i<4;i++) 
	{
		for (j = 0; j < 4; j++) 
		{
			sum = gauss_dot_36_4k[i][j]    +2*gauss_dot_36_4k[i][j+1]  +gauss_dot_36_4k[i][j+2]+
				  2*gauss_dot_36_4k[i+1][j]+4*gauss_dot_36_4k[i+1][j+1]+2*gauss_dot_36_4k[i+1][j+2]+
				  gauss_dot_36_4k[i+2][j]  +2*gauss_dot_36_4k[i+2][j+1]+gauss_dot_36_4k[i+2][j+2];
			sum = sum / 16;
			temp_final_dot_16_4k[i][j] = sum;
		}
	}
	//均值调整
	average_adjust_16point(final_dot_16_4k, temp_final_dot_16_4k, dot_25_1k[2][2]);
}

//将1k图片放大为4k，只处理r,g,b中的一个分量
void final_interpolation_x4(BYTE(*image_4k_data)[3840], BYTE(*image_1k_data)[960])
{
	int i = 0,j=0;
	int m = 0, n = 0;
	BYTE final_dot_16_4k[4][4] = { 0 };
	BYTE dot_25_1k[5][5] = { 0 };
	BYTE(*image_1k_data_m)[964] = (BYTE(*)[964])malloc(544 * 964 * sizeof(BYTE));
	//	对1k图像进行扩展
	for (i = 0; i < 540; i++)		//	原图赋值给扩展后的矩阵
	{
		for (j = 0; j < 960; j++)
		{
			image_1k_data_m [i+2][j+2] = image_1k_data[i][j];
		}
	}
	for (j=0;j<964;j++)		//第一行、二行扩展,最后一行、倒数第二行扩展
	{
		image_1k_data_m[0][j] = image_1k_data_m[2][j];
		image_1k_data_m[1][j] = image_1k_data_m[2][j];
		image_1k_data_m[542][j] = image_1k_data_m[541][j];
		image_1k_data_m[543][j] = image_1k_data_m[541][j];
	}
	for (i = 0; i < 544; i++)	//第一列、二列扩展,最后一列、倒数第二列扩展
	{
		image_1k_data_m[i][0] = image_1k_data_m[i][2];
		image_1k_data_m[i][1] = image_1k_data_m[i][2];
		image_1k_data_m[i][962] = image_1k_data_m[i][961];
		image_1k_data_m[i][963] = image_1k_data_m[i][961];
	}
	//插值生成4k图像
	for (i=0;i<540;i++)
	{
		for (j=0;j<960;j++)
		{
			for (m = 0; m < 5; m++) 
			{
				for (n=0;n<5;n++) 
				{
					dot_25_1k[m][n] = image_1k_data_m[i+m][j+n];
				}
			}
			interpolation(final_dot_16_4k, dot_25_1k);
			for (m = 0; m < 4; m++)
			{
				for (n = 0; n < 4; n++)
				{
					image_4k_data[4*i+m][4*j+n] = final_dot_16_4k[m][n];
				}
			}
		}
	}
	//释放内存
	free(image_1k_data_m);
}












