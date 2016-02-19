function [ y ] = combineBytesToDecimal( node,firstByte,secondByte,thirdByte,fourtByte )
%UNTITLED Summary of this function goes here
%   converts an array of bytes to 32bit binary which is inturn converted to
%   decimal

y = bi2de(de2bi(node(firstByte),32)+de2bi(bitsll(node(secondByte),8),32)+ de2bi(bitsll(node(thirdByte),16),32)+de2bi(bitsll(node(fourtByte),24),32));

end

