function [A Label]=Text_to_AdjacencyMatrix(datafile)
[n1 n2]=textread(datafile,'%s %s');
b=unique([n1;n2]);
n=length(b);
A=zeros(n);
for i=1:length(n1)
    ki=find(strcmp(n1{i},b));
    kj=find(strcmp(n2{i},b));
    A(ki,kj)=1;
end
Label=b;

