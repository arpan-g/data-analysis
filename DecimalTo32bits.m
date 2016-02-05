function [ y ] = DecimalTo32bits( element,first,second,third,fourth )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

flipY = de2bi(element(first),32)+de2bi(bitsll(element(second),8),32)+de2bi(bitsll(element(third),16),32)+de2bi(bitsll(element(fourth),24),32);
y=fliplr(flipY);
end

