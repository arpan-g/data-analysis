clear all;
power_consumption;
num_rows=4;
num_cols=2;
n=num_rows*num_cols;
count = 1;
sensor_cordinates=zeros(n,2);
weights=[];
list1=[];
list2=[];
root=4;
optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0; 1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
optimistic_neighbouring_map=abs(optimistic_neighbouring_map);
for i = 1:num_rows
    for j = 1:num_cols
        sensor_cordinates(count,:)=[i,j];
        count= count + 1;
    end
end

distance_measure=zeros(n);
for i = 1:n
    for j = 1:n
      distance_measure(i,j)=distance_euclidean(sensor_cordinates(i,:),sensor_cordinates(j,:));  
    end
end
for i = 1:n
    [rows,col,v]=find(distance_measure(i,:));
    k = length(v);
    weights=[weights,(v)];
    list1=[list1,ones(1,k)*i];
    list2=[list2,col];
%     neighbor_matrix(i,:)=indices(1:k);
end
% graphminspantree(R);
% [a,b,c]=kruskal(optimistic_neighbouring_map,distance_measure);
% DG=sparse(list1,list2,weights);
% UG = tril(DG + DG');
% [ST,pred] = graphminspantree(UG,root,'Method','Kruskal');
% view(biograph(ST,[],'ShowArrows','off','ShowWeights','off'));
% [node_e,node_s,s]=find(ST);
[node_s,node_e]=random_trees;
v=[1,2,3,4,5,6,7,8];
masters=perms(v);
len=length(node_e);
count = 1;
for i = 1:40320
    sum_scalar=0;
for j = 1:len
    sum_scalar=sum_scalar+R(masters(i,node_s(j)),masters(i,node_e(j)));
end
    sum_values(count)=sum_scalar;
    count = count+1;
end
maximum_sum=max(sum_values);
[corr_row,corr_colum,v] = find(sum_values==maximum_sum);
masters(corr_colum,:)
