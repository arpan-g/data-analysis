
    function [variance]=calc_var(x)
        variance=0;
        meanx=mean(x);
        [rc,cc]=size(x);
        for row_count=1:cc
            variance = variance+(x(row_count)-meanx)^2;
        end
        variance = sqrt(variance);
    end