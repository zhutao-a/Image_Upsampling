clear;
clear all;
%%
%���4��ֵ�㷨�������psnr��ssim
n_max=46;
PSNR=zeros(1,n_max+1);
SSIM=zeros(1,n_max+1);
for n=1:n_max+1
    disp(n-1);
    image_1k_filename=['C:\Users\master\Desktop\final\matlab\1k\',num2str(n-1),'.bmp'];
    image_4k_filename=['C:\Users\master\Desktop\final\matlab\gt_4k\',num2str(n-1),'.bmp'];
    image_1k_data=imread(image_1k_filename);  
    image_gt_4k_data=imread(image_4k_filename);
    
    image_4k_data=final_interpolation_x4(image_1k_data);
    PSNR(n)=psnr(image_4k_data,image_gt_4k_data);
    SSIM(n)=ssim(image_4k_data,image_gt_4k_data);
end
PSNR_ave=sum(PSNR)/(n_max+1);
SSIM_ave=sum(SSIM)/(n_max+1);
disp(PSNR_ave);
disp(SSIM_ave);
%%
% %��һ��ͼƬ����fpga����������matlab���������Ƿ�һ��
% n=1;
% image_1k_filename=['C:\Users\master\Desktop\final\matlab\1k\',num2str(n-1),'.bmp'];
% image_4k_filename=['C:\Users\master\Desktop\final\matlab\gt_4k\',num2str(n-1),'.bmp'];
% image_1k_data=imread(image_1k_filename);
% image_gt_4k_data=imread(image_4k_filename);
% image_4k_data=final_interpolation_x4(image_1k_data);%matlab���ɵ�4kͼƬ
% image_4k_data_r=image_4k_data(:,:,1);%matlab���ɵ�4kͼƬ��r����
% ram_4k_data=importdata('ram_4k_data.v');%fpga���ɵ�4kͼƬr����
% %������fpga���ɵ�4kͼƬ����תΪ10����
% [N,~]=size(ram_4k_data);
% dec_ram_4k_data=zeros(N,1);
% for i=1:N
%     temp=10^7;
%     for j=1:8
%         r=fix(ram_4k_data(i)/temp);
%         ram_4k_data(i)=ram_4k_data(i)-r*temp;
%         temp=temp/10;
%         dec_ram_4k_data(i)=dec_ram_4k_data(i)+r*2^(8-j);
%     end
% end
% %fpga���ɵ�4kͼƬ����תΪ������ʽ
% fpga_ram_4k_data=zeros(2160,3840);
% for i=1:540
%     for j=1:960
%         fpga_ram_4k_data((i-1)*4+1,(j-1)*4+1)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+1);
%         fpga_ram_4k_data((i-1)*4+1,(j-1)*4+2)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+2);
%         fpga_ram_4k_data((i-1)*4+1,(j-1)*4+3)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+3);
%         fpga_ram_4k_data((i-1)*4+1,(j-1)*4+4)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+4);
%         fpga_ram_4k_data((i-1)*4+2,(j-1)*4+1)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+5);
%         fpga_ram_4k_data((i-1)*4+2,(j-1)*4+2)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+6);
%         fpga_ram_4k_data((i-1)*4+2,(j-1)*4+3)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+7);
%         fpga_ram_4k_data((i-1)*4+2,(j-1)*4+4)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+8);
%         fpga_ram_4k_data((i-1)*4+3,(j-1)*4+1)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+9);
%         fpga_ram_4k_data((i-1)*4+3,(j-1)*4+2)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+10);
%         fpga_ram_4k_data((i-1)*4+3,(j-1)*4+3)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+11);
%         fpga_ram_4k_data((i-1)*4+3,(j-1)*4+4)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+12);
%         fpga_ram_4k_data((i-1)*4+4,(j-1)*4+1)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+13);
%         fpga_ram_4k_data((i-1)*4+4,(j-1)*4+2)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+14);
%         fpga_ram_4k_data((i-1)*4+4,(j-1)*4+3)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+15);
%         fpga_ram_4k_data((i-1)*4+4,(j-1)*4+4)=dec_ram_4k_data((i-1)*960*16+(j-1)*16+16);
%     end
% end
% %�ж�fpga������matlab�����Ƿ�һ��
% disp(isequal(fpga_ram_4k_data,image_4k_data_r));
% PSNR=psnr(image_4k_data,image_gt_4k_data);
% SSIM=ssim(image_4k_data,image_gt_4k_data);
% disp(PSNR);
% disp(SSIM);
%%
%%���ɵ�һ��1kͼƬr��ɫ������Ҫ���뵽ram�е�����
% n=1;
% image_1k_filename=['C:\Users\master\Desktop\final\matlab\1k\',num2str(n-1),'.bmp'];
% image_4k_filename=['C:\Users\master\Desktop\final\matlab\gt_4k\',num2str(n-1),'.bmp'];
% image_1k_data=imread(image_1k_filename);
% 
% image_1k_data_r=image_1k_data(:,:,1);
% [M,N]=size(image_1k_data_r);%M=2160/4;N=3840/4;P=3;
% %r��ɫ��չ
% image_1k_data_r_m=zeros(M+4,N+4);
% image_1k_data_r_m(3:M+2,3:N+2)=image_1k_data_r;%b,[M,N]
% image_1k_data_r_m(1,:)=image_1k_data_r_m(3,:);%��һ����չ
% image_1k_data_r_m(2,:)=image_1k_data_r_m(3,:);%�ڶ�����չ
% image_1k_data_r_m(M+4,:)=image_1k_data_r_m(M+2,:);%���һ����չ
% image_1k_data_r_m(M+3,:)=image_1k_data_r_m(M+2,:);%��������չ
% 
% image_1k_data_r_m(:,1)=image_1k_data_r_m(:,3);%��һ����չ
% image_1k_data_r_m(:,2)=image_1k_data_r_m(:,3);%�ڶ�����չ
% image_1k_data_r_m(:,N+4)=image_1k_data_r_m(:,N+2);%���һ����չ
% image_1k_data_r_m(:,N+3)=image_1k_data_r_m(:,N+2);%��������չ
% 
% fid=fopen('C:\Users\master\Desktop\final\matlab\interpolation\ram_1k_data.v','w');
% b_data_to_printf=zeros(5,8);
% for i=1:540
%     disp(i);
%     for j=1:964
%         data_to_printf=image_1k_data_r_m(i:i+4,j);
%         b_data_to_printf= dec2bin(data_to_printf,8)-'0';%ת����Ϊ�ַ�����
%         for k=1:8
%             if(k<=5)        %�����Ч������
%                 for m=1:8
%                     fprintf(fid,'%d',b_data_to_printf(k,m));
%                 end
%                 fprintf(fid,'\n');
%             else            %���0
%                 for m=1:8
%                     fprintf(fid,'%d',0);
%                 end
%                 fprintf(fid,'\n');
%             end 
%         end
%     end
% end
% fclose(fid);






