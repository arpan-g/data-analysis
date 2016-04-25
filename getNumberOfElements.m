function[noOfLeaves,index] =getNumberOfElements(array,ele)
[rows,cols,val]=find(array==ele);
noOfLeaves=length(cols);
index=cols;

end