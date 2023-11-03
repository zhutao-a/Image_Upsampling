function binear_dot_16_4k=binear_16_generate(dot_9_1k)
dot_9_1k=double(dot_9_1k);
binear_dot_16_4k=zeros(4,4);
%左上4点
x=5/8;y=5/8;
binear_dot_16_4k(1,1)=fix((1-x)*(1-y)*dot_9_1k(1,1)+x*(1-y)*dot_9_1k(1,2)+(1-x)*y*dot_9_1k(2,1)+x*y*dot_9_1k(2,2));
x=7/8;y=5/8;
binear_dot_16_4k(1,2)=fix((1-x)*(1-y)*dot_9_1k(1,1)+x*(1-y)*dot_9_1k(1,2)+(1-x)*y*dot_9_1k(2,1)+x*y*dot_9_1k(2,2));
x=5/8;y=7/8;
binear_dot_16_4k(2,1)=fix((1-x)*(1-y)*dot_9_1k(1,1)+x*(1-y)*dot_9_1k(1,2)+(1-x)*y*dot_9_1k(2,1)+x*y*dot_9_1k(2,2));
x=7/8;y=7/8;
binear_dot_16_4k(2,2)=fix((1-x)*(1-y)*dot_9_1k(1,1)+x*(1-y)*dot_9_1k(1,2)+(1-x)*y*dot_9_1k(2,1)+x*y*dot_9_1k(2,2));
%右上4点
x=1/8;y=5/8;
binear_dot_16_4k(1,3)=fix((1-x)*(1-y)*dot_9_1k(1,2)+x*(1-y)*dot_9_1k(1,3)+(1-x)*y*dot_9_1k(2,2)+x*y*dot_9_1k(2,3));
x=3/8;y=5/8;
binear_dot_16_4k(1,4)=fix((1-x)*(1-y)*dot_9_1k(1,2)+x*(1-y)*dot_9_1k(1,3)+(1-x)*y*dot_9_1k(2,2)+x*y*dot_9_1k(2,3));
x=1/8;y=7/8;
binear_dot_16_4k(2,3)=fix((1-x)*(1-y)*dot_9_1k(1,2)+x*(1-y)*dot_9_1k(1,3)+(1-x)*y*dot_9_1k(2,2)+x*y*dot_9_1k(2,3));
x=3/8;y=7/8;
binear_dot_16_4k(2,4)=fix((1-x)*(1-y)*dot_9_1k(1,2)+x*(1-y)*dot_9_1k(1,3)+(1-x)*y*dot_9_1k(2,2)+x*y*dot_9_1k(2,3));
%左下4点
x=5/8;y=1/8;
binear_dot_16_4k(3,1)=fix((1-x)*(1-y)*dot_9_1k(2,1)+x*(1-y)*dot_9_1k(2,2)+(1-x)*y*dot_9_1k(3,1)+x*y*dot_9_1k(3,2));
x=7/8;y=1/8;
binear_dot_16_4k(3,2)=fix((1-x)*(1-y)*dot_9_1k(2,1)+x*(1-y)*dot_9_1k(2,2)+(1-x)*y*dot_9_1k(3,1)+x*y*dot_9_1k(3,2));
x=5/8;y=3/8;
binear_dot_16_4k(4,1)=fix((1-x)*(1-y)*dot_9_1k(2,1)+x*(1-y)*dot_9_1k(2,2)+(1-x)*y*dot_9_1k(3,1)+x*y*dot_9_1k(3,2));
x=7/8;y=3/8;
binear_dot_16_4k(4,2)=fix((1-x)*(1-y)*dot_9_1k(2,1)+x*(1-y)*dot_9_1k(2,2)+(1-x)*y*dot_9_1k(3,1)+x*y*dot_9_1k(3,2));
%右下4点
x=1/8;y=1/8;
binear_dot_16_4k(3,3)=fix((1-x)*(1-y)*dot_9_1k(2,2)+x*(1-y)*dot_9_1k(2,3)+(1-x)*y*dot_9_1k(3,2)+x*y*dot_9_1k(3,3));
x=3/8;y=1/8;
binear_dot_16_4k(3,4)=fix((1-x)*(1-y)*dot_9_1k(2,2)+x*(1-y)*dot_9_1k(2,3)+(1-x)*y*dot_9_1k(3,2)+x*y*dot_9_1k(3,3));
x=1/8;y=3/8;
binear_dot_16_4k(4,3)=fix((1-x)*(1-y)*dot_9_1k(2,2)+x*(1-y)*dot_9_1k(2,3)+(1-x)*y*dot_9_1k(3,2)+x*y*dot_9_1k(3,3));
x=3/8;y=3/8;
binear_dot_16_4k(4,4)=fix((1-x)*(1-y)*dot_9_1k(2,2)+x*(1-y)*dot_9_1k(2,3)+(1-x)*y*dot_9_1k(3,2)+x*y*dot_9_1k(3,3));

binear_dot_16_4k=uint8(binear_dot_16_4k);





