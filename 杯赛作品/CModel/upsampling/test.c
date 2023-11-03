#define _CRT_SECURE_NO_WARNINGS 1
#include "upsampling.h"
#include "interpolation.h"



int main(int argc, char*  argv[])
{	
	int i = 0,j=0,n=0;
	

	//申请bmp文件内存
	BITMAPINFO* bitInfo = (BITMAPINFO*)malloc(sizeof(BITMAPINFO));
	//申请1k图片二维数组空间
	BYTE(*image_1k_data_b)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
	BYTE(*image_1k_data_g)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
	BYTE(*image_1k_data_r)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
	//申请4k图片二维数组空间
	BYTE(*image_4k_data_b)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));
	BYTE(*image_4k_data_g)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));
	BYTE(*image_4k_data_r)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));

							

		readBMP(bitInfo, argv[1]);
		//将读出来的像素数据正序存放在数组里，以便与matlab一致
		for (i = 0; i < 540; i++)
		{
			for (j = 0; j < 960; j++)
			{
				image_1k_data_b[i][j] = (bitInfo->imgDate[539 - i][j].rgbBlue);
				image_1k_data_g[i][j] = (bitInfo->imgDate[539 - i][j].rgbGreen);
				image_1k_data_r[i][j] = (bitInfo->imgDate[539 - i][j].rgbRed);
			}
		}
		//插值生成最终的4k图片
		final_interpolation_x4(image_4k_data_b, image_1k_data_b);
		printf("b ok   ");
		final_interpolation_x4(image_4k_data_g, image_1k_data_g);
		printf("g ok   ");
		final_interpolation_x4(image_4k_data_r, image_1k_data_r);
		printf("r ok   \n");
		//将生成的4k图片信息写回原图片结构体
		REAL_WIDTH = 3840;
		REAL_HEIGHT = 2160;
		for (i = 0; i < 2160; i++)
		{
			for (j = 0; j < 3840; j++)
			{
				bitInfo->imgDate[i][j].rgbBlue = image_4k_data_b[2159 - i][j];
				bitInfo->imgDate[i][j].rgbGreen = image_4k_data_g[2159 - i][j];
				bitInfo->imgDate[i][j].rgbRed = image_4k_data_r[2159 - i][j];
			}
		}
		//根据输出路径保存图片
		savePicture(bitInfo, argv[2]);
	//释放内存空间
	free(bitInfo);
	free(image_1k_data_b); free(image_1k_data_g); free(image_1k_data_r);
	free(image_4k_data_b); free(image_4k_data_g); free(image_4k_data_r);

	return 0;
}










