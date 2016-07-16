clear all;


for i_it = 0:10
start_time=8*i_it;
end_time=start_time+8;
isomorphicTreeMatching_4x2  
readFile8
[r,~]=size(tree);
evaluation_matrix(i_it+1)=r;
end