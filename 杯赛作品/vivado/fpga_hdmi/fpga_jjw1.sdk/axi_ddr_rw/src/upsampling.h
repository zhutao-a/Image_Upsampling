#ifndef _UPSAMPLING_H
#define _UPSAMPLING_H

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <math.h>

//#define MAXSIZE 4000
#define REAL_WIDTH  bitInfo->bmiHeader->biWidth
#define REAL_HEIGHT bitInfo->bmiHeader->biHeight
#pragma pack(2)


typedef unsigned char   BYTE;
typedef unsigned short  WORD;
typedef unsigned int    dWORD;//�����˸ĳ�d
typedef long            LONG;

// �ļ�ͷ��ƫ������ʾ�����ֽ�Ϊ��λ
typedef struct tagBITMAPFILEHEADER
{
    WORD    bfType;         // λͼ�ļ������ͣ�����ΪBM(1-2�ֽڣ�
    dWORD   bfSize;         // λͼ�ļ��Ĵ�С�����ֽ�Ϊ��λ��3-6�ֽڣ�
    WORD    bfReserved1;    // λͼ�ļ������֣�����Ϊ0(7-8�ֽڣ�
    WORD    bfReserved2;    // λͼ�ļ������֣�����Ϊ0(9-10�ֽڣ�
    dWORD   bfOffBits;      // λͼ���ݵ���ʼλ�ã��������λͼ��11-14�ֽڣ�
} BITMAPFILEHEADER;

typedef struct tagBITMAPINFOHEADER
{
	dWORD   biSize;         // ���ṹ��ռ���ֽ�����15-18�ֽڣ�
	dWORD   biWidth;        // λͼ�Ŀ�ȣ�������Ϊ��λ��19-22�ֽڣ�
	dWORD   biHeight;       // λͼ�ĸ߶ȣ�������Ϊ��λ��23-26�ֽڣ�
    WORD    biPlanes;       // Ŀ���豸�ļ��𣬱���Ϊ1(27-28�ֽڣ�
    WORD    biBitCount;     // ÿ�����������λ����������1��˫ɫ������29-30�ֽڣ�
                            // 4(16ɫ����8(256ɫ��16(�߲�ɫ)��24�����ɫ��֮һ
    dWORD biCompression;    // λͼѹ�����ͣ������� 0����ѹ��������31-34�ֽڣ�
                            // 1(BI_RLE8ѹ�����ͣ���2(BI_RLE4ѹ�����ͣ�֮һ
    dWORD biSizeImage;      // λͼ�Ĵ�С(���а�����Ϊ�˲���������4�ı�������ӵĿ��ֽ�)�����ֽ�Ϊ��λ��35-38�ֽڣ�
    LONG biXPelsPerMeter;   // λͼˮƽ�ֱ��ʣ�ÿ����������39-42�ֽڣ�
    LONG biYPelsPerMeter;   // λͼ��ֱ�ֱ��ʣ�ÿ����������43-46�ֽ�)
    dWORD biClrUsed;        // λͼʵ��ʹ�õ���ɫ���е���ɫ����47-50�ֽڣ�
    dWORD biClrImportant;   // λͼ��ʾ��������Ҫ����ɫ����51-54�ֽڣ�
} BITMAPINFOHEADER;

typedef struct tagRGBQUAD
{
    BYTE rgbBlue;       // ��ɫ�����ȣ�ֵ��ΧΪ0-255)
    BYTE rgbGreen;      // ��ɫ�����ȣ�ֵ��ΧΪ0-255)
    BYTE rgbRed;        // ��ɫ�����ȣ�ֵ��ΧΪ0-255)
                        // BYTE rgbReserved;// ����������Ϊ0
} RGBQUAD;

typedef struct tagBITMAPINFO
{
    BITMAPFILEHEADER*   bmfHeader;
    BITMAPINFOHEADER*   bmiHeader;              // λͼ��Ϣͷ
    RGBQUAD             imgDate[540][960];
} BITMAPINFO;



//void readRGBby24(BITMAPINFO* bitInfo, FILE* pfile);
//void readBMP(BITMAPINFO* bitInfo, char path[]);
//void savePicture(BITMAPINFO* bitInfo, char path[]);

#endif
