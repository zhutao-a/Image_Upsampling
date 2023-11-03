#define _CRT_SECURE_NO_WARNINGS 1
#include "upsampling.h"

void readRGBby24(BITMAPINFO* bitInfo, FILE* pfile) 
{
    int width  = REAL_WIDTH;
    int height = REAL_HEIGHT;
    int size = (height) * (width);
    BYTE* img_tmp = (BYTE*)malloc(size * 3);
    if (pfile == NULL)
    {
        printf("pfile is NULL!\n");
        return;
    }
    else
    {
        if (img_tmp == NULL)
        {
            printf("img_temp is NULL!\n");
            return;
        }
        fread(img_tmp, sizeof(BYTE), size * 3, pfile);//img_tmp是有960*540*3个数的值

        int i, j;
        int root = 0;
        for (i = 0; i < REAL_HEIGHT; i++)
        {
            for (j = 0; j < REAL_WIDTH; j++)
            {
                bitInfo->imgDate[i][j].rgbBlue = img_tmp[root++];
                bitInfo->imgDate[i][j].rgbGreen = img_tmp[root++];
                bitInfo->imgDate[i][j].rgbRed = img_tmp[root++];
            }
        }
    }
}

void readBMP(BITMAPINFO* bitInfo, char  path[])
{
    FILE* pfile;
    printf("path: %s\n", path);
    pfile = fopen(path, "rb");
    if (pfile == NULL)
    {
        printf("open fail");
        return;
    }
    else
    {
        bitInfo->bmfHeader = (BITMAPFILEHEADER*)malloc(sizeof(BITMAPFILEHEADER));
        bitInfo->bmiHeader = (BITMAPINFOHEADER*)malloc(sizeof(BITMAPINFOHEADER));
        fread(bitInfo->bmfHeader, 1, sizeof(BITMAPFILEHEADER), pfile);
        fread(bitInfo->bmiHeader, 1, sizeof(BITMAPINFOHEADER), pfile);
    }
    if (bitInfo->bmfHeader->bfType != 0x4d42)
    {
        printf("file is not .bmp file!");
    }
    else
    {
        printf("open success\n");
        if (bitInfo->bmiHeader->biBitCount == 24)
        {
            printf("call readRGBby24()\n");
            readRGBby24(bitInfo, pfile);
        }
        else
        {
            printf("biBitCount is not 24\n");
        }

    }
    fclose(pfile);
}

void savePicture(BITMAPINFO* bitInfo, char  path[])
{
    FILE* pfout = fopen(path, "wb");
    // 修改bmfHeader、bmiHeader
    bitInfo->bmiHeader->biSizeImage = (bitInfo->bmiHeader->biWidth) * (bitInfo->bmiHeader->biHeight) * 3;

    bitInfo->bmfHeader->bfSize = (bitInfo->bmiHeader->biSizeImage) + (bitInfo->bmfHeader->bfOffBits);
    fwrite(bitInfo->bmfHeader, sizeof(BITMAPFILEHEADER), 1, pfout);
    fwrite(bitInfo->bmiHeader, sizeof(BITMAPINFOHEADER), 1, pfout);
    int i, j;
    for (i = 0; i < REAL_HEIGHT; i++)
    {
        for (j = 0; j < REAL_WIDTH; j++)
        {
            fwrite(&bitInfo->imgDate[i][j], sizeof(RGBQUAD), 1, pfout);
        }
    }
    fclose(pfout);
}










