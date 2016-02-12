function [ temperature ] = calculateTemperature( senValue )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=0.001010024;
b=0.000242127;
c=0.000000146;
R=(10000*(1023-senValue))/senValue;
    temp = a+b*log((R)) + c*(log(R)^3);
    temperature = 1/temp-273;

end

