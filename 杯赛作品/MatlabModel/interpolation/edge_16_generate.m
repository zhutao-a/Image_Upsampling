function edge_dot_16_4k=edge_16_generate(dot_9_1k)
dot_9_1k=double(dot_9_1k);
x=[1/8,3/8,5/8,7/8];
%水平方向
edge_dot_16_4k_r=zeros(4,4);
d1_left=dot_9_1k(1,2)-dot_9_1k(1,1);
d1_right=dot_9_1k(1,3)-dot_9_1k(1,2);
d2_left=dot_9_1k(2,2)-dot_9_1k(2,1);
d2_right=dot_9_1k(2,3)-dot_9_1k(2,2);
d3_left=dot_9_1k(3,2)-dot_9_1k(3,1);
d3_right=dot_9_1k(3,3)-dot_9_1k(3,2);
%第一行
pixel_left=fix(5/8*dot_9_1k(2,1)+3/8*dot_9_1k(1,1));
pixel_right=fix(5/8*dot_9_1k(2,3)+3/8*dot_9_1k(1,3));
d_left=fix(5/8*d2_left+3/8*d1_left);
d_right=fix(5/8*d2_right+3/8*d1_right);
x1=abs(d_right)/(abs(d_right)+abs(d_left));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_r(1,i)=pixel_left;
    else
        edge_dot_16_4k_r(1,i)=pixel_right;
    end
end    
%第二行
pixel_left=fix(7/8*dot_9_1k(2,1)+1/8*dot_9_1k(1,1));
pixel_right=fix(7/8*dot_9_1k(2,3)+1/8*dot_9_1k(1,3));
d_left=fix(7/8*d2_left+1/8*d1_left);
d_right=fix(7/8*d2_right+1/8*d1_right);
x1=abs(d_right)/(abs(d_right)+abs(d_left));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_r(2,i)=pixel_left;
    else
        edge_dot_16_4k_r(2,i)=pixel_right;
    end
end   
%第三行
pixel_left=fix(7/8*dot_9_1k(2,1)+1/8*dot_9_1k(3,1));
pixel_right=fix(7/8*dot_9_1k(2,3)+1/8*dot_9_1k(3,3));
d_left=fix(7/8*d2_left+1/8*d3_left);
d_right=fix(7/8*d2_right+1/8*d3_right);
x1=abs(d_right)/(abs(d_right)+abs(d_left));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_r(3,i)=pixel_left;
    else
        edge_dot_16_4k_r(3,i)=pixel_right;
    end
end 
%第四行
pixel_left=fix(5/8*dot_9_1k(2,1)+3/8*dot_9_1k(3,1));
pixel_right=fix(5/8*dot_9_1k(2,3)+3/8*dot_9_1k(3,3));
d_left=fix(5/8*d2_left+3/8*d3_left);
d_right=fix(5/8*d2_right+3/8*d3_right);
x1=abs(d_right)/(abs(d_right)+abs(d_left));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_r(4,i)=pixel_left;
    else
        edge_dot_16_4k_r(4,i)=pixel_right;
    end
end 
%竖直方向
edge_dot_16_4k_c=zeros(4,4);
d1_up=dot_9_1k(2,1)-dot_9_1k(1,1);
d1_down=dot_9_1k(3,1)-dot_9_1k(2,1);
d2_up=dot_9_1k(2,2)-dot_9_1k(1,2);
d2_down=dot_9_1k(3,2)-dot_9_1k(2,2);
d3_up=dot_9_1k(2,3)-dot_9_1k(1,3);
d3_down=dot_9_1k(3,3)-dot_9_1k(2,3);          
%第一列
pixel_up=fix(5/8*dot_9_1k(1,2)+3/8*dot_9_1k(1,1));
pixel_down=fix(5/8*dot_9_1k(3,2)+3/8*dot_9_1k(3,1));
d_up=fix(5/8*d2_up+3/8*d1_up);
d_down=fix(5/8*d2_down+3/8*d1_down);
x1=abs(d_down)/(abs(d_down)+abs(d_up));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_c(i,1)=pixel_up;
    else
        edge_dot_16_4k_c(i,1)=pixel_down;
    end
end
 %第二列
pixel_up=fix(7/8*dot_9_1k(1,2)+1/8*dot_9_1k(1,1));
pixel_down=fix(7/8*dot_9_1k(3,2)+1/8*dot_9_1k(3,1));
d_up=fix(7/8*d2_up+1/8*d1_up);
d_down=fix(7/8*d2_down+1/8*d1_down);
x1=abs(d_down)/(abs(d_down)+abs(d_up));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_c(i,2)=pixel_up;
    else
        edge_dot_16_4k_c(i,2)=pixel_down;
    end
end
 %第三列
pixel_up=fix(7/8*dot_9_1k(1,2)+1/8*dot_9_1k(1,3));
pixel_down=fix(7/8*dot_9_1k(3,2)+1/8*dot_9_1k(3,3));
d_up=fix(7/8*d2_up+1/8*d3_up);
d_down=fix(7/8*d2_down+1/8*d3_down);
x1=abs(d_down)/(abs(d_down)+abs(d_up));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_c(i,3)=pixel_up;
    else
        edge_dot_16_4k_c(i,3)=pixel_down;
    end
end
 %第四列
pixel_up=fix(5/8*dot_9_1k(1,2)+3/8*dot_9_1k(1,3));
pixel_down=fix(5/8*dot_9_1k(3,2)+3/8*dot_9_1k(3,3));
d_up=fix(5/8*d2_up+3/8*d3_up);
d_down=fix(5/8*d2_down+3/8*d3_down);
x1=abs(d_down)/(abs(d_down)+abs(d_up));
for i=1:4
    if(x(i)<x1)
        edge_dot_16_4k_c(i,4)=pixel_up;
    else
        edge_dot_16_4k_c(i,4)=pixel_down;
    end
end
edge_dot_16_4k=fix(1/2*edge_dot_16_4k_r+1/2*edge_dot_16_4k_c);
edge_dot_16_4k=uint8(edge_dot_16_4k);






