function [ y ] =    simple_matching_coefficient(a,b,c,d)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
num = a+d;
den = a+b+c+d;
y=num/den;

end