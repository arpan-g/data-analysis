function[sum_r]=calculate_correlation_sum(s,e,R)

len=length(s);
sum_r=0;
for i = 1:len
    sum_r=sum_r + R(s(i),e(i));
end

end