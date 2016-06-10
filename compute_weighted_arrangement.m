function[y]= compute_weighted_arrangement(arrangement,a_m,distance_measure,R)
[n,~]=size(a_m);
[r,~]=size(arrangement);
min_value=min(distance_measure(:));
weight=distance_measure/min_value;
weight = 1./weight;
sum_r=zeros(r,1);
for i = 1:r
    sum_r(i)= calculate_correlation_sum_grid_weight(arrangement(i,:),R,a_m,weight);    
end
max_sum=max(sum_r);
y=arrangement(abs(sum_r-max_sum)<0.0001,:);
