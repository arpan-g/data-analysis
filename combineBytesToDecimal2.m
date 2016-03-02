function [ y ] = combineBytesToDecimal2( node,firstByte,secondByte,thirdByte,fourtByte,prev14 )
%UNTITLED Summary of this function goes here
%   converts an array of bytes to 32bit binary which is inturn converted to
%   decimal
if(prev14<node(fourtByte)&&node(thirdByte)>230)
y = bi2de(de2bi(node(firstByte),32)+de2bi(bitsll(node(secondByte),8),32)+ de2bi(bitsll(node(thirdByte),16),32)+de2bi(bitsll(prev14,24),32));
   
else
    y = bi2de(de2bi(node(firstByte),32)+de2bi(bitsll(node(secondByte),8),32)+ de2bi(bitsll(node(thirdByte),16),32)+de2bi(bitsll(node(fourtByte),24),32)); 
end
    
end

