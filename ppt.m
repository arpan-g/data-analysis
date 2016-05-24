R=power_consumption('combined_data\combi.mat');
[s,e]=prims(R*-1,1,n);
plot_tree(s,e);

