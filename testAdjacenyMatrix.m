clear all;
a=getAdjacencyMatrix();
count = 1;
for i = 1:43
    for j = 1:43
            if(a(i,j)~=a(j,i))
                aas(count,:)=[i,j];
                count = count+1;
            end
    end
end