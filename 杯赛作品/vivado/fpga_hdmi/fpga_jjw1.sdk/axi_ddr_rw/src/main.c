#include <stdio.h>
#include "ff.h"
#include "upsampling.h"
#include "malloc.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "string.h"
#include "sleep.h"

#include "xaxivdma.h"
#include "xaxivdma_i.h"
#include "display_ctrl_hdmi/display_ctrl.h"
#include "vdma_api/vdma_api.h"


char bass_path_in[]="0:/fpga_1k";//ͼƬ����·��
char bass_path_out[]="0:/fpga_4k";//ͼƬ���·��

unsigned int const base_addr_1k =0x10000000;//�洢1kͼƬ����ַ
unsigned int const base_addr_4k =0x16000000;//�洢4kͼƬ����ַ

//�궨��
#define BYTES_PIXEL        3                          //�����ֽ�����RGB888ռ3���ֽ�
#define DYNCLK_BASEADDR    XPAR_AXI_DYNCLK_0_BASEADDR //��̬ʱ�ӻ���ַ
#define VDMA_ID            XPAR_AXIVDMA_0_DEVICE_ID   //VDMA����ID
#define DISP_VTC_ID        XPAR_VTC_0_DEVICE_ID       //VTC����ID
//ȫ�ֱ���
XAxiVdma     vdma;
DisplayCtrl  dispCtrl;
VideoMode    vd_mode;
unsigned int frame_buffer_addr = 0x20000000;

FRESULT readBMP(BITMAPINFO* bitInfo, char path[]);//��������·��path��sd����ȡ1kͼƬ
void expand_1k_image(BITMAPINFO* bitInfo,dWORD(*image_1k_data)[964]);//��1kͼƬ����2����չ
void store_1k_to_ddr(dWORD(*image_1k_data)[964]);//����չ���1k��Ҫ�����ddr
void read_4k_from_ddr(RGBQUAD* image_4k_data);//��ddr�а�Ҫ�����4kͼƬ
void savePicture(BITMAPINFO* bitInfo, RGBQUAD* image_4k_data,char path[]);//�������·��path��4kͼƬ����sd��
void BMP_to_bmp(char *filename_out,char *filename_in);//����д��BMPתΪСд
int scan_bmp_name(char pic_name[][30],char bass_path_in[]);//��ȡ����ͼƬ����
void get_real_path(char path_in[][50],char path_out[][50],char pic_name[][30],int fileCnt);//�õ����յ��������·��
void store_4k_for_vdma(dWORD* image_4k_data);//��4kͼƬ���ݷ�4���������ddr���Ա�vdma��ʾ


int main()
{
	FATFS fatfs;
	char* sd_Path = "0:/";
	FRESULT status;

	f_mount(&fatfs, sd_Path, 1);//����SD��
	Xil_DCacheDisable();//���ݻ��岻ʹ��

	int fileCnt=0;
	char pic_name[50][30];
	char path_out[50][50];
	char path_in[50][50];
	dWORD finish_4k_flag;

	fileCnt=scan_bmp_name(pic_name,bass_path_in);//��ȡ����ͼƬ����
	get_real_path(path_in,path_out,pic_name,fileCnt);//�õ����յ��������·��

	BITMAPINFO* bitInfo = (BITMAPINFO*)malloc(sizeof(BITMAPINFO));//����bmp�ļ��ڴ�
	dWORD(*image_1k_data)[964] = (dWORD(*)[964])malloc(544 * 964 * sizeof(dWORD));//������չ��1kͼƬ�ռ�
	RGBQUAD* image_4k_data = (RGBQUAD*)malloc(3840 * 2160 * sizeof(RGBQUAD));//����4kͼƬ�ռ�

	//��ֵ����
	int i=0;
	while(1)
	{
		status=readBMP(bitInfo, path_in[i]);//��������·����ȡͼƬ
		while(status!=FR_OK)
		{
			printf("read picture again\n");
			status=readBMP(bitInfo, path_in[i]);//��������·����ȡͼƬ
			sleep(1);
		}
		expand_1k_image(bitInfo,image_1k_data);//��1kͼƬ����2����չ
		store_1k_to_ddr(image_1k_data);//����չ���1k��Ҫ�����ddr
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000), (dWORD)i);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+4), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+8), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+12), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+16), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+20), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+24), (dWORD)0xffffffff);
		Xil_Out32((UINTPTR)(base_addr_1k+0x04000000+28), (dWORD)0xffffffff);

		while(1)//�ȣ�ֱ������4k��ֵ��ɱ�־λ
		{
			finish_4k_flag=Xil_In32((UINTPTR)(base_addr_4k+0x04000000));
			if(finish_4k_flag==i)
			{
				finish_4k_flag=Xil_In32((UINTPTR)(base_addr_4k+0x04000000+4));
				if(finish_4k_flag==0x00ffffff)
				{
					printf("read 4k finish flag\n");
					break;
				}
			}
			usleep(10);
		}

		read_4k_from_ddr(image_4k_data);//��ddr�а�Ҫ�����4kͼƬ
		store_4k_for_vdma((dWORD*)image_4k_data);//��4kͼƬ���ݷ�4���������ddr���Ա�vdma��ʾ
		savePicture(bitInfo,image_4k_data,path_out[i]);//�������·��path��4kͼƬ����sd��
		i=i+1;
		printf("N.%d image interpolation done\n",i);
		if(i == fileCnt||i == 5)//�����Ҫ���ͼƬ��
		{
			printf("all required images interpolation done\n");
			break;
		}
	}
	free(bitInfo);
	free(image_1k_data);
	free(image_4k_data);

	//��ʾ����
	//����video�������ֱ��ʣ�1920*1080
	vd_mode = VMODE_1920x1080;
	//����VDMA
	run_vdma_frame_buffer(&vdma, VDMA_ID, vd_mode.width, vd_mode.height,frame_buffer_addr,0, 0,ONLY_READ);
	//��ʼ��Display controller
	DisplayInitialize(&dispCtrl, DISP_VTC_ID, DYNCLK_BASEADDR);
	//����VideoMode
	DisplaySetMode(&dispCtrl, &vd_mode);
	DisplayStart(&dispCtrl);
	printf("start hdmi display\n");
	char c;
	while(1)
	{
		printf("input 'a' to next region and 'b' to prior region\n");
		scanf("%c",&c);
		if(c=='a')
		{
			frame_buffer_addr=frame_buffer_addr+0x5eec00;
		}
		else if(c=='b')
		{
			frame_buffer_addr=frame_buffer_addr-0x5eec00;
		}
		if(frame_buffer_addr<0x20000000)
		{
			frame_buffer_addr=0x20000000;
		}
		else if(frame_buffer_addr>(0x20000000+(4*5-1)*0x5eec00))
		{
			frame_buffer_addr=0x20000000+(4*5-1)*0x5eec00;
		}
		run_vdma_frame_buffer(&vdma, VDMA_ID, vd_mode.width, vd_mode.height,frame_buffer_addr,0, 0,ONLY_READ);
	}
    return 0;
}


FRESULT readBMP(BITMAPINFO* bitInfo, char path[])//��������·��path��sd����ȡ1kͼƬ
{
    FIL pfile;
    UINT br;
    FRESULT status;
    printf("path_in: %s\n", path);
    status=f_open(&pfile,path,FA_READ);
    if (status != FR_OK)
    {
        printf("open fail\n");
        return status;
    }
    else
    {
    	bitInfo->bmfHeader = (BITMAPFILEHEADER*)malloc(sizeof(BITMAPFILEHEADER));
    	bitInfo->bmiHeader = (BITMAPINFOHEADER*)malloc(sizeof(BITMAPINFOHEADER));
    	f_read(&pfile,bitInfo->bmfHeader,sizeof(BITMAPFILEHEADER),&br);
    	f_read(&pfile,bitInfo->bmiHeader,sizeof(BITMAPINFOHEADER),&br);
    }
    if (bitInfo->bmfHeader->bfType != 0x4d42)
    {
        printf("file is not .bmp file!\n");
    }
    else
    {
    	if (bitInfo->bmiHeader->biBitCount == 24)
    	{
    	    f_read(&pfile,bitInfo->imgDate,(UINT)(REAL_WIDTH*REAL_HEIGHT*3*sizeof(BYTE)),&br);
    	    //printf("read 1k from sd finish\n");
    	}
    	else
    	{
    	     printf("biBitCount is not 24\n");
    	}
    }
	f_close(&pfile);
	return status;
}

void expand_1k_image(BITMAPINFO* bitInfo,dWORD(*image_1k_data)[964])//��1kͼƬ����2����չ
{
	int i=0,j=0;
	for (i = 0; i < 540; i++)//��������������������������������Ա���matlabһ��,u32��ŵ�����Ϊ0_b_g_r
	{
		for (j = 0; j < 960; j++)
		{
			*(*(image_1k_data+(i+2))+j+2) = (dWORD)((bitInfo->imgDate[539 - i][j].rgbBlue)<<16)|(dWORD)((bitInfo->imgDate[539 - i][j].rgbGreen)<<8)|(dWORD)((bitInfo->imgDate[539 - i][j].rgbRed));
		}
	}
	for (j=0;j<964;j++)		//��һ�С�������չ,���һ�С������ڶ�����չ
	{
		*(*(image_1k_data+0)+j) = *(*(image_1k_data+2)+j);
		*(*(image_1k_data+1)+j) = *(*(image_1k_data+2)+j);
		*(*(image_1k_data+542)+j) = *(*(image_1k_data+541)+j);
		*(*(image_1k_data+543)+j) = *(*(image_1k_data+541)+j);
	}
	for (i = 0; i < 544; i++)	//��һ�С�������չ,���һ�С������ڶ�����չ
	{
		*(*(image_1k_data+i)+0) = *(*(image_1k_data+i)+2);
		*(*(image_1k_data+i)+1) = *(*(image_1k_data+i)+2);
		*(*(image_1k_data+i)+962) = *(*(image_1k_data+i)+961);
		*(*(image_1k_data+i)+963) = *(*(image_1k_data+i)+961);
	}
	//printf("expand 1k finish\n");
}

void store_1k_to_ddr(dWORD(*image_1k_data)[964])//����չ���1k��Ҫ�����ddr
{
	int i=0,j=0,k=0;
	int bias_addr_1k=0;//ƫ�Ƶ�ַ
	for(i=0;i<540;i++)//��1kͼ�����ݰ�Ҫ�����DDR3������ַΪbase_addr_1k
	{
		for(j=0;j<964;j++)
		{
			for(k=0;k<8;k++)
			{
				if(k<5)
				{
					Xil_Out32((UINTPTR)(base_addr_1k+bias_addr_1k), *(*(image_1k_data+(i+k))+j));
				}
				else
				{
					Xil_Out32((UINTPTR)(base_addr_1k+bias_addr_1k), (dWORD)0);
				}
				bias_addr_1k=bias_addr_1k+4;
			}
		}

	}
	//printf("store 1k to ddr finish\n");
}

void read_4k_from_ddr(RGBQUAD* image_4k_data)//��ddr�а�Ҫ�����4kͼƬ
{
	int i=0,j=0,k=0;
	int bias_addr_4k=0;//ƫ�Ƶ�ַ
	dWORD image_4k_temp[16]={0};
	for (i = 0; i < 540; i++)
	{
		for (j = 0; j < 960; j++)
		{
			for(k=0;k<16;k++)			//��ȡ��16����
			{
				image_4k_temp[k]=(dWORD)Xil_In32((UINTPTR)(base_addr_4k+bias_addr_4k));
				bias_addr_4k=bias_addr_4k+4;
			}
			//��һ��
			image_4k_data[(2159-4*i)*3840+4*j].rgbBlue=(BYTE)(image_4k_temp[0]>>16);
			image_4k_data[(2159-4*i)*3840+4*j].rgbGreen=(BYTE)(image_4k_temp[0]>>8);
			image_4k_data[(2159-4*i)*3840+4*j].rgbRed=(BYTE)(image_4k_temp[0]);

			image_4k_data[(2159-4*i)*3840+4*j+1].rgbBlue=(BYTE)(image_4k_temp[1]>>16);
			image_4k_data[(2159-4*i)*3840+4*j+1].rgbGreen=(BYTE)(image_4k_temp[1]>>8);
			image_4k_data[(2159-4*i)*3840+4*j+1].rgbRed=(BYTE)(image_4k_temp[1]);

			image_4k_data[(2159-4*i)*3840+4*j+2].rgbBlue=(BYTE)(image_4k_temp[2]>>16);
			image_4k_data[(2159-4*i)*3840+4*j+2].rgbGreen=(BYTE)(image_4k_temp[2]>>8);
			image_4k_data[(2159-4*i)*3840+4*j+2].rgbRed=(BYTE)(image_4k_temp[2]);

			image_4k_data[(2159-4*i)*3840+4*j+3].rgbBlue=(BYTE)(image_4k_temp[3]>>16);
			image_4k_data[(2159-4*i)*3840+4*j+3].rgbGreen=(BYTE)(image_4k_temp[3]>>8);
			image_4k_data[(2159-4*i)*3840+4*j+3].rgbRed=(BYTE)(image_4k_temp[3]);
			//�ڶ���
			image_4k_data[(2159-(4*i+1))*3840+4*j].rgbBlue=(BYTE)(image_4k_temp[4]>>16);
			image_4k_data[(2159-(4*i+1))*3840+4*j].rgbGreen=(BYTE)(image_4k_temp[4]>>8);
			image_4k_data[(2159-(4*i+1))*3840+4*j].rgbRed=(BYTE)(image_4k_temp[4]);

			image_4k_data[(2159-(4*i+1))*3840+4*j+1].rgbBlue=(BYTE)(image_4k_temp[5]>>16);
			image_4k_data[(2159-(4*i+1))*3840+4*j+1].rgbGreen=(BYTE)(image_4k_temp[5]>>8);
			image_4k_data[(2159-(4*i+1))*3840+4*j+1].rgbRed=(BYTE)(image_4k_temp[5]);

			image_4k_data[(2159-(4*i+1))*3840+4*j+2].rgbBlue=(BYTE)(image_4k_temp[6]>>16);
			image_4k_data[(2159-(4*i+1))*3840+4*j+2].rgbGreen=(BYTE)(image_4k_temp[6]>>8);
			image_4k_data[(2159-(4*i+1))*3840+4*j+2].rgbRed=(BYTE)(image_4k_temp[6]);

			image_4k_data[(2159-(4*i+1))*3840+4*j+3].rgbBlue=(BYTE)(image_4k_temp[7]>>16);
			image_4k_data[(2159-(4*i+1))*3840+4*j+3].rgbGreen=(BYTE)(image_4k_temp[7]>>8);
			image_4k_data[(2159-(4*i+1))*3840+4*j+3].rgbRed=(BYTE)(image_4k_temp[7]);
			//������
			image_4k_data[(2159-(4*i+2))*3840+4*j].rgbBlue=(BYTE)(image_4k_temp[8]>>16);
			image_4k_data[(2159-(4*i+2))*3840+4*j].rgbGreen=(BYTE)(image_4k_temp[8]>>8);
			image_4k_data[(2159-(4*i+2))*3840+4*j].rgbRed=(BYTE)(image_4k_temp[8]);

			image_4k_data[(2159-(4*i+2))*3840+4*j+1].rgbBlue=(BYTE)(image_4k_temp[9]>>16);
			image_4k_data[(2159-(4*i+2))*3840+4*j+1].rgbGreen=(BYTE)(image_4k_temp[9]>>8);
			image_4k_data[(2159-(4*i+2))*3840+4*j+1].rgbRed=(BYTE)(image_4k_temp[9]);

			image_4k_data[(2159-(4*i+2))*3840+4*j+2].rgbBlue=(BYTE)(image_4k_temp[10]>>16);
			image_4k_data[(2159-(4*i+2))*3840+4*j+2].rgbGreen=(BYTE)(image_4k_temp[10]>>8);
			image_4k_data[(2159-(4*i+2))*3840+4*j+2].rgbRed=(BYTE)(image_4k_temp[10]);

			image_4k_data[(2159-(4*i+2))*3840+4*j+3].rgbBlue=(BYTE)(image_4k_temp[11]>>16);
			image_4k_data[(2159-(4*i+2))*3840+4*j+3].rgbGreen=(BYTE)(image_4k_temp[11]>>8);
			image_4k_data[(2159-(4*i+2))*3840+4*j+3].rgbRed=(BYTE)(image_4k_temp[11]);
			//������
			image_4k_data[(2159-(4*i+3))*3840+4*j].rgbBlue=(BYTE)(image_4k_temp[12]>>16);
			image_4k_data[(2159-(4*i+3))*3840+4*j].rgbGreen=(BYTE)(image_4k_temp[12]>>8);
			image_4k_data[(2159-(4*i+3))*3840+4*j].rgbRed=(BYTE)(image_4k_temp[12]);

			image_4k_data[(2159-(4*i+3))*3840+4*j+1].rgbBlue=(BYTE)(image_4k_temp[13]>>16);
			image_4k_data[(2159-(4*i+3))*3840+4*j+1].rgbGreen=(BYTE)(image_4k_temp[13]>>8);
			image_4k_data[(2159-(4*i+3))*3840+4*j+1].rgbRed=(BYTE)(image_4k_temp[13]);

			image_4k_data[(2159-(4*i+3))*3840+4*j+2].rgbBlue=(BYTE)(image_4k_temp[14]>>16);
			image_4k_data[(2159-(4*i+3))*3840+4*j+2].rgbGreen=(BYTE)(image_4k_temp[14]>>8);
			image_4k_data[(2159-(4*i+3))*3840+4*j+2].rgbRed=(BYTE)(image_4k_temp[14]);

			image_4k_data[(2159-(4*i+3))*3840+4*j+3].rgbBlue=(BYTE)(image_4k_temp[15]>>16);
			image_4k_data[(2159-(4*i+3))*3840+4*j+3].rgbGreen=(BYTE)(image_4k_temp[15]>>8);
			image_4k_data[(2159-(4*i+3))*3840+4*j+3].rgbRed=(BYTE)(image_4k_temp[15]);
		}
	}
	//printf("read 4k from ddr finish\n");
}

void savePicture(BITMAPINFO* bitInfo, RGBQUAD* image_4k_data,char path[])//�������·��path��4kͼƬ����sd��
{
	FIL pfile;
	UINT br;
	printf("path_out: %s\n", path);
	f_open(&pfile,path,FA_CREATE_ALWAYS|FA_WRITE);
    // �޸�bmfHeader��bmiHeader
	REAL_WIDTH=3840;
	REAL_HEIGHT=2160;
    bitInfo->bmiHeader->biSizeImage = (bitInfo->bmiHeader->biWidth) * (bitInfo->bmiHeader->biHeight) * 3;
    bitInfo->bmfHeader->bfSize = (bitInfo->bmiHeader->biSizeImage) + (bitInfo->bmfHeader->bfOffBits);

    f_write(&pfile,bitInfo->bmfHeader,sizeof(BITMAPFILEHEADER),&br);
    f_write(&pfile,bitInfo->bmiHeader,sizeof(BITMAPINFOHEADER),&br);

    f_write(&pfile,image_4k_data,REAL_WIDTH*REAL_HEIGHT*sizeof(RGBQUAD),&br);

    //printf("store 4k to ddr finish. one picture interpolation is over\r\n");
    f_close(&pfile);
}

int scan_bmp_name(char pic_name[][30],char bass_path_in[])//��ȡ����ͼƬ����
{
    FRESULT res;
    FILINFO finfo;
    DIR dir;
    TCHAR *fn;
    int fileCnt=0;
	res = f_opendir(&dir,bass_path_in);
	if(res == FR_OK)
		{
			while (f_readdir(&dir, &finfo) == FR_OK){
				fn = finfo.fname;
				BMP_to_bmp(pic_name[fileCnt],fn);
				if(!fn[0])break;
				fileCnt++; //ͼƬ������ȫ�ֱ�����
			}
		}
	f_closedir(&dir);
	return fileCnt;
}

void BMP_to_bmp(char filename_out[],char filename_in[])//����д��BMPתΪСд
{
    int i;
    int length = strlen(filename_in);
    for (i=0; i<length; i++)
    {
        if(filename_in[i]>='A' && filename_in[i]<='Z')
        {
        	filename_out[i] = filename_in[i]-('A'-'a');
        }
        else
        {
        	filename_out[i] = filename_in[i];
        }
    }
    filename_out[length]='\0';
}

void get_real_path(char path_in[][50],char path_out[][50],char pic_name[][30],int fileCnt)//�õ����յ��������·��
{
	int i=0,j=0,len_in=0,len_out=0,len_pic=0;
	len_in=strlen(bass_path_in);
	len_out=strlen(bass_path_out);
	for(i=0;i<fileCnt;i++)
	{
		len_pic=strlen(pic_name[i]);
		for(j=0;j<len_in;j++)
		{
			path_in[i][j]=bass_path_in[j];
		}
		for(j=0;j<len_out;j++)
		{
			path_out[i][j]=bass_path_out[j];
		}
		path_in[i][len_in]='/';
		path_out[i][len_out]='/';
		for(j=len_in+1;j<len_in+1+len_pic;j++)
		{
			path_in[i][j]=pic_name[i][j-(len_in+1)];
		}
		for(j=len_out+1;j<len_out+1+len_pic;j++)
		{
			path_out[i][j]=pic_name[i][j-(len_out+1)];
		}
		path_in[i][len_in+len_pic+1]='\0';
		path_out[i][len_out+len_pic+1]='\0';
	}
}

void store_4k_for_vdma(dWORD* image_4k_data)//��4kͼƬ���ݷ�4���������ddr���Ա�vdma��ʾ
{
	int i=0,j=0;
	static unsigned int vdma_ddr_addr = 0x20000000;
	for(i=1080;i>0;--i)//��������
	{
		for(j=0;j<1440;++j)
		{
			Xil_Out32((UINTPTR)(vdma_ddr_addr),(u32)*(image_4k_data+2880*i+j));
			vdma_ddr_addr += 4;
		}
	}
	for(i=1080;i>0;--i)//��������
	{
		for(j=1440;j<2880;++j)
		{
			Xil_Out32((UINTPTR)(vdma_ddr_addr),(u32)*(image_4k_data+2880*i+j));
			vdma_ddr_addr += 4;
		}
	}
	for(i=2160;i>1080;--i)//��������
	{
		for(j=0;j<1440;++j)
		{
			Xil_Out32((UINTPTR)(vdma_ddr_addr),(u32)*(image_4k_data+2880*i+j));
			vdma_ddr_addr += 4;
		}
	}
	for(i=2160;i>1080;--i)//��������
	{
		for(j=1440;j<2880;++j)
		{
			Xil_Out32((UINTPTR)(vdma_ddr_addr),(u32)*(image_4k_data+2880*i+j));
			vdma_ddr_addr += 4;
		}
	}
}

















