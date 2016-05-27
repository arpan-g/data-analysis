

%% brute force method
% clear all;
% t = cputime;
n=8;
v=1:n;
R = power_consumption(file);
% R = power_consumption('combined_data\combi_7.mat');

% profile on
masters=perms(v);
sensor_cordinates=readCoordinates('HTC34_Coordinates.txt');

% distance_measure=zeros(n);
for i = 1:n
    for j = 1:n
        if(i~=j)
        distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));
        else
            distance_measure(i,j) = 999;
        end
    end
end
radius = computePIRRadius(3,41);
a_m=zeros(n,n);
a_m(distance_measure<2*radius)=1;

for perm_count =1:factorial(n)
    sum_k=calculate_correlation_sum_grid(masters(perm_count,:),R,a_m);
    sum_k=R()
    count_matrix(perm_count)=sum_k;
end
maximum_sum=max(count_matrix);
[corr_row,corr_colum,v] = find(count_matrix==maximum_sum);

% profile viewer
arrangement=masters(corr_colum,:);
len=numel(corr_colum);
ch_ar=round(rand*len);

if(ch_ar==0)
    ch_ar=1;
end


config=[1,2,3,4,5,6,7,8;2,1,4,3,6,5,8,7;8,7,6,5,4,3,2,1;7,8,5,6,3,4,1,2];
error_matrix=zeros(4,1);

% masters(corr_colum(1),:)
for config_iterator=1 :4
    for error_iterator =1:8
        
        
        if(config(config_iterator,error_iterator)~=masters(corr_colum(ch_ar),error_iterator))
            error_matrix(config_iterator)=error_matrix(config_iterator)+1;
        end
        
    end
end
[error,ind]=min(error_matrix);
% arrangement=masters(corr_colum,:);


