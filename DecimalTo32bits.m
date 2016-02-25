function [ y ] = DecimalTo32bits( element,first,second,third,fourth )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

y = de2bi(element(fourth),32)+de2bi(bitsll(element(third),8),32)+de2bi(bitsll(element(second),16),32)+de2bi(bitsll(element(first),24),32);
% y=fliplr(flipY);
end

