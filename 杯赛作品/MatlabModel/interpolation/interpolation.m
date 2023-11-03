function final_dot_16_4k=interpolation(dot_25_1k)
dot_25_1k=double(dot_25_1k);
final_dot_16_4k=zeros(4,4);
gauss_dot_36_4k=zeros(6,6);
%高斯滤波第1行
dot_9_1k=dot_25_1k(1:3,1:3);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(1,1)=temp(4,4);

dot_9_1k=dot_25_1k(1:3,2:4);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(1,2:5)=temp(4,:);

dot_9_1k=dot_25_1k(1:3,3:5);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(1,6)=temp(4,1);

%高斯滤波第2：5行
dot_9_1k=dot_25_1k(2:4,1:3);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(2:5,1)=temp(1:4,4);

dot_9_1k=dot_25_1k(2:4,2:4);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(2:5,2:5)=temp;

dot_9_1k=dot_25_1k(2:4,3:5);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(2:5,6)=temp(1:4,1);

%高斯滤波第6行
dot_9_1k=dot_25_1k(3:5,1:3);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(6,1)=temp(1,4);

dot_9_1k=dot_25_1k(3:5,2:4);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(6,2:5)=temp(1,1:4);

dot_9_1k=dot_25_1k(3:5,3:5);
temp=interpolate_16point(dot_9_1k);
temp=average_adjust_16point(temp,dot_9_1k(2,2));
gauss_dot_36_4k(6,6)=temp(1,1);
%进行高斯平滑
filter=1/16*[1,2,1;        
             2,4,2;
             1,2,1];
gauss_dot_36_4k=double(gauss_dot_36_4k);
for i=1:4
    for j=1:4
        final_dot_16_4k(i,j)=fix(sum(sum(gauss_dot_36_4k(i:i+2,j:j+2).*filter)));
    end
end
final_dot_16_4k=average_adjust_16point(final_dot_16_4k,dot_25_1k(3,3));

final_dot_16_4k=uint8(final_dot_16_4k);






