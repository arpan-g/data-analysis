function [y] = GenerateArray( maxCount,count,startElement,endElement )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
if(maxCount>count)
    diff= maxCount-count-1;
    y = transpose((startElement+3.2):((endElement-(startElement+3.2))/diff):endElement);
else 
    y = 0;
end
end

