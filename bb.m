function [ y ] = bb( a,p1,p2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
num = a;
den = max(p1, p2);
y=num/den;

end