function[y]= compute_weighted_arrangement(arrangement,a_m,distance_measure,R)
[n,~]=size(a_m);
[r,~]=size(arrangement);
for i = 1:n
    min_value=min(distance_measure(i,:));
    weight(i,:)=distance_measure(i,:)/min_value;
end
weight = 1./distance_measure;
sum_r=zeros(r,1);
for i = 1:r
   sum_r(i)= calculate_correlation_sum_grid_weight(arrangement(i,:),R,a_m,weight); 

end
max_sum=max(sum_r);
y=arrangement(abs(sum_r-max_sum)<0.0001,:);
