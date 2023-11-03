#define _CRT_SECURE_NO_WARNINGS 1
#include "upsampling.h"
#include "interpolation.h"

pthread_mutex_t lock1;
pthread_mutex_t lock2;
pthread_mutex_t lock3;

void* func_b (void* arg)
{
        int i, j;
        BITMAPINFO* bitInfo = (BITMAPINFO*) arg;

        BYTE(*image_1k_data_b)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
	pthread_mutex_lock(&lock1);

        for (i = 0; i < 540; i++)
        {
                for (j = 0; j < 960; j++)
                {
                        image_1k_data_b[i][j] = (bitInfo->imgDate[539 - i][j].rgbBlue);
                }
        }

        BYTE(*image_4k_data_b)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));
        final_interpolation_x4(image_4k_data_b, image_1k_data_b);
		printf("b ok   ");
		
        REAL_WIDTH = 3840;
        REAL_HEIGHT = 2160;

        for (i = 0; i < 2160; i++)
        {
                for (j = 0; j < 3840; j++)
                {
                        bitInfo->imgDate[i][j].rgbBlue = image_4k_data_b[2159 - i][j];
                }
        }

	pthread_mutex_unlock(&lock2);


        free(image_1k_data_b);
        free(image_4k_data_b);
        return NULL;
}

void* func_g (void* arg)
{
        int i, j;
        BITMAPINFO* bitInfo = (BITMAPINFO*) arg;

        BYTE(*image_1k_data_g)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
        BYTE(*image_4k_data_g)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));

	pthread_mutex_lock(&lock2);


        for (i = 0; i < 540; i++)
        {
                for (j = 0; j < 960; j++)
                {
                        image_1k_data_g[i][j] = (bitInfo->imgDate[539 - i][j].rgbGreen);
                }
        }

        final_interpolation_x4(image_4k_data_g, image_1k_data_g);
		printf("g ok   ");
		
        REAL_WIDTH = 3840;
        REAL_HEIGHT = 2160;

        for (i = 0; i < 2160; i++)
        {
                for (j = 0; j < 3840; j++)
                {
                        bitInfo->imgDate[i][j].rgbGreen = image_4k_data_g[2159 - i][j];
                }
        }
	pthread_mutex_unlock(&lock2);

        free(image_1k_data_g);
        free(image_4k_data_g);


        return NULL;
}


void* func_r(void* arg)
{
        int i, j;
        BITMAPINFO* bitInfo = (BITMAPINFO*) arg;

        BYTE(*image_1k_data_r)[960] = (BYTE(*)[960])malloc(540 * 960 * sizeof(BYTE));
        BYTE(*image_4k_data_r)[3840] = (BYTE(*)[3840])malloc(2160 * 3840 * sizeof(BYTE));

	pthread_mutex_lock(&lock3);


        for (i = 0; i < 540; i++)
        {
                for (j = 0; j < 960; j++)
                {
                        image_1k_data_r[i][j] = (bitInfo->imgDate[539 - i][j].rgbRed);
                }
        }

        final_interpolation_x4(image_4k_data_r, image_1k_data_r);
		printf("r ok   \n");

        REAL_WIDTH = 3840;
        REAL_HEIGHT = 2160;

        for (i = 0; i < 2160; i++)
        {
                for (j = 0; j < 3840; j++)
                {
                        bitInfo->imgDate[i][j].rgbRed = image_4k_data_r[2159 - i][j];
                }
        }
	pthread_mutex_unlock(&lock3);

        free(image_1k_data_r);
        free(image_4k_data_r);
        
        return NULL;
}


int main(int argc, char* argv[])
{	
        int i, j;
        BITMAPINFO* bitInfo = (BITMAPINFO*)malloc(sizeof(BITMAPINFO));
        readBMP(bitInfo, argv[1]);

        pthread_t  th_b, th_g, th_r;
        pthread_create(&th_b, NULL, func_b, bitInfo);
        pthread_create(&th_g, NULL, func_g, bitInfo);
        pthread_create(&th_r, NULL, func_r, bitInfo);

        pthread_join(th_b, NULL);
        pthread_join(th_g, NULL);
        pthread_join(th_r, NULL);


        REAL_WIDTH = 3840;
        REAL_HEIGHT = 2160;

        savePicture(bitInfo, argv[2]);

        free(bitInfo);

        return 0;

}
                                                                                                  




