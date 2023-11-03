function image_4k_data=final_interpolation_x4(image_1k_data)
image_1k_data=double(image_1k_data);
[M,N,P]=size(image_1k_data);%M=2160/4;N=3840/4;P=3;
%r��ɫ��չ
image_1k_data_r_m=zeros(M+4,N+4);
image_1k_data_r_m(3:M+2,3:N+2)=image_1k_data(:,:,1);%b,[M,N]
image_1k_data_r_m(1,:)=image_1k_data_r_m(3,:);%��һ����չ
image_1k_data_r_m(2,:)=image_1k_data_r_m(3,:);%�ڶ�����չ
image_1k_data_r_m(M+4,:)=image_1k_data_r_m(M+2,:);%���һ����չ
image_1k_data_r_m(M+3,:)=image_1k_data_r_m(M+2,:);%��������չ

image_1k_data_r_m(:,1)=image_1k_data_r_m(:,3);%��һ����չ
image_1k_data_r_m(:,2)=image_1k_data_r_m(:,3);%�ڶ�����չ
image_1k_data_r_m(:,N+4)=image_1k_data_r_m(:,N+2);%���һ����չ
image_1k_data_r_m(:,N+3)=image_1k_data_r_m(:,N+2);%��������չ
%g��ɫ��չ
image_1k_data_g_m=zeros(M+4,N+4);
image_1k_data_g_m(3:M+2,3:N+2)=image_1k_data(:,:,2);%b,[M,N]
image_1k_data_g_m(1,:)=image_1k_data_g_m(3,:);%��һ����չ
image_1k_data_g_m(2,:)=image_1k_data_g_m(3,:);%�ڶ�����չ
image_1k_data_g_m(M+4,:)=image_1k_data_g_m(M+2,:);%���һ����չ
image_1k_data_g_m(M+3,:)=image_1k_data_g_m(M+2,:);%��������չ

image_1k_data_g_m(:,1)=image_1k_data_g_m(:,3);%��һ����չ
image_1k_data_g_m(:,2)=image_1k_data_g_m(:,3);%�ڶ�����չ
image_1k_data_g_m(:,N+4)=image_1k_data_g_m(:,N+2);%���һ����չ
image_1k_data_g_m(:,N+3)=image_1k_data_g_m(:,N+2);%��������չ
%b��ɫ��չ
image_1k_data_b_m=zeros(M+4,N+4);
image_1k_data_b_m(3:M+2,3:N+2)=image_1k_data(:,:,3);%b,[M,N]
image_1k_data_b_m(1,:)=image_1k_data_b_m(3,:);%��һ����չ
image_1k_data_b_m(2,:)=image_1k_data_b_m(3,:);%�ڶ�����չ
image_1k_data_b_m(M+4,:)=image_1k_data_b_m(M+2,:);%���һ����չ
image_1k_data_b_m(M+3,:)=image_1k_data_b_m(M+2,:);%��������չ

image_1k_data_b_m(:,1)=image_1k_data_b_m(:,3);%��һ����չ
image_1k_data_b_m(:,2)=image_1k_data_b_m(:,3);%�ڶ�����չ
image_1k_data_b_m(:,N+4)=image_1k_data_b_m(:,N+2);%���һ����չ
image_1k_data_b_m(:,N+3)=image_1k_data_b_m(:,N+2);%��������չ
%��ֵ����
image_4k_data=zeros(4*M,4*N,P);
%r��ɫ��ֵ
for i=1:M
    for j=1:N
        image_4k_data(4*(i-1)+1:4*i,4*(j-1)+1:4*j,1)=interpolation(image_1k_data_r_m(i:i+4,j:j+4));
    end
end
disp('r_ok');
%g��ɫ��ֵ
for i=1:M
    for j=1:N
        image_4k_data(4*(i-1)+1:4*i,4*(j-1)+1:4*j,2)=interpolation(image_1k_data_g_m(i:i+4,j:j+4));
    end
end
disp('g_ok');
%b��ɫ��ֵ
for i=1:M
    for j=1:N        
        image_4k_data(4*(i-1)+1:4*i,4*(j-1)+1:4*j,3)=interpolation(image_1k_data_b_m(i:i+4,j:j+4));
    end
end
disp('b_ok');
image_4k_data=uint8(image_4k_data);
