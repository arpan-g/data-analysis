function []=LayoutView(A_adja_Matrix,x,y,Label,classid)

x1=x;
y1=y;
n=size(x1,1);
nodesNumber=n;
x1(1:nodesNumber)=x1(1:nodesNumber)-min(x1);
y1(1:nodesNumber)=y1(1:nodesNumber)-min(y1);
x1=x1+3;
y1=y1+3;
edges=sum(A_adja_Matrix(:));
edgesNumber=edges(1,1);
[I J]=find(A_adja_Matrix);
nodeSource(1:edgesNumber)=I(1:edgesNumber);
nodeTarget(1:edgesNumber)=J(1:edgesNumber);
if edgesNumber>18000;
    error('LayoutView: Too many edges in the network.');
end
n=length(Label);
label=cell(nodesNumber,1);
for i=1:n
    label{i}='null label';
    label{i}=Label{i};
end
classid1=classid;
if n~=size(classid,1)
    error('LayoutView: Invalid classid textfile or network textfile. The row number in classid text file must equal the node number of network');
end
label1=label;

LucidDraw.LucidDrawMain(nodesNumber, edgesNumber, label1, x1, y1, classid1, nodeSource, nodeTarget);

