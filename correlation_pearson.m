function [ correlation_matrix ] = correlation_pearson( matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(matrix);
for i = 1:c
    for j = 1:c
        [filt_x,filt_y]=filter_custom(matrix(:,i),matrix(:,j));
        correlation_matrix(i,j)=pairwise_compute(filt_x,filt_y);
    end
end
%------%




%--------------------------------------------------------------------------%

%-----------------------------------------------------------------%
end


