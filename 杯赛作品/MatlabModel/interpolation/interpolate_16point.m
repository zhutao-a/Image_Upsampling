function final_dot_16_4k=interpolate_16point(dot_9_1k)
T_min=10;
T_max=120;
%���ˮƽ����ֱsobel��ֵ
d_r=dot_9_1k(1,3)-dot_9_1k(1,1)+2*(dot_9_1k(2,3)-dot_9_1k(2,1))+dot_9_1k(3,3)-dot_9_1k(3,1);
d_c=dot_9_1k(3,1)-dot_9_1k(1,1)+2*(dot_9_1k(3,2)-dot_9_1k(1,2))+dot_9_1k(3,3)-dot_9_1k(1,3);
if(abs(d_r)<=T_min&&abs(d_c)<=T_min)          %���ý��ڲ�ֵ
    final_dot_16_4k=edge_16_generate(dot_9_1k);
elseif(abs(d_r)>=T_max||abs(d_c)>=T_max)  
    final_dot_16_4k=edge_16_generate(dot_9_1k);
else                                %����˫���Բ�ֵ
    final_dot_16_4k=edge_16_generate(dot_9_1k);
end



