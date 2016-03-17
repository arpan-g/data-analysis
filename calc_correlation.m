function [ value ] = calc_correlation( signal_1,signal_2 )


a=similar_data(signal_1,signal_2,1);
d=similar_data(signal_1,signal_2,-1);
p_1=sum(abs(signal_1)); %number of 1's in 1st array
p_2=sum(abs(signal_2));%number of 1'2 in 2nd array
% [b,c] = disimilar_data(signal_1,signal_2);
%b= proportion of 1s in the first variable and 0s in second
%variable in the same positions
%c = proportion of 0s in the first variable and 1s in second variable
% in the same positions
% q_1 = c+d; % number of 0's in 1st array
% q_2 = b+d; % number of 0's in 2nd array

value=correlation_coefficient(a,p_1,p_2);

end