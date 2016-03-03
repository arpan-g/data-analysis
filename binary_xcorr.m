function [ c,index ] = binary_xcorr( signal_1,signal_2,lag )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
count = 1;
for i =-lag:lag
    if(i<0)
        signal_2 = [signal_2,zeros(1,-i)];
        
        signal_2 = signal_2(1,-i+1:end);
        
    elseif(i>0)
        signal_2 = [zeros(1,i),signal_2];
        
        signal_2 = signal_2(1,1:end-i);
    end
    
    c(count)=calc_correlation(signal_1,signal_2);
    index(count)=i;
    count = count + 1;
end


end

