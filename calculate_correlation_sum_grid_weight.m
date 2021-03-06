function[sum_r]=calculate_correlation_sum_grid_weight(map,R,a_m,w)
%map index is the sensor, value is the grid point.

sum_r=0;
[r,~]=size(a_m);

for r_i = 1:r
    for r_j = r_i+1:r
        if(a_m(r_i,r_j)==1)
            
        sensor_a=find(map==r_i);
        sensor_b=find(map==r_j);
        sum_r=sum_r + R(sensor_a,sensor_b)*w(r_i,r_j);
        end
    end
end

end