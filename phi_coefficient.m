function [ y ] = phi_coefficient( a,b,c,d,p_1,p_2,q_1,q_2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
numerator = a*d-b*c;
denominator = sqrt(p_1*p_2*q_1*q_2);
y = numerator /(denominator);

end

