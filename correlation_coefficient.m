function [ y ] =    correlation_coefficient(d,p_1,p_2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
num = d*d;
den = p_1*p_2;
y=num/den;

end