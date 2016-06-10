tree_a_m=zeros(8,8);
for i = 1:7
    tree_a_m(node_s(i),node_e(i))=1;
    tree_a_m(node_e(i),node_s(i))=1;
end
h=tree_a_m.*R;
[a,b]=eig(h);
[c,d]=eig(weight);
a=abs(a);
c=abs(c);
map=a*c';
