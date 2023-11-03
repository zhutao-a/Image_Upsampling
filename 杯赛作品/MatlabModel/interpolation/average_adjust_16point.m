function adjust_dot_16_4k=average_adjust_16point(dot_16_4k,average)
dot_16_4k=double(dot_16_4k);
average=double(average);

adjust_dot_16_4k=dot_16_4k-(fix(sum(sum(dot_16_4k))/16)-average);
adjust_dot_16_4k=uint8(adjust_dot_16_4k);






