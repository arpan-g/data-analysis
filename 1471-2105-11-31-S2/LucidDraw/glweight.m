function W = glweight(A, style)
A=(eye(size(A))+A);
A2=(A*A);
A3=(A2*A);
A4=(A3*A);
A5=(A3*A);
n=length(A);
W=zeros(n);
if nargin==1
    style='Common';
end
if strcmp(style,'Common')
    for i=1:n-1
        for j=i+1:n
            if A(i,j)>0
                W(i,j)=40;%40
            elseif A2(i,j)>0
                W(i,j)=20;%20
            elseif A3(i,j)>0
                W(i,j)=0;%0
            elseif A4(i,j)>0
                W(i,j)=-10;%-10
            elseif A5(i,j)>0
                W(i,j)=-10;%-10
            else
                W(i,j)=-10;%-10
            end
        end
    end
elseif strcmp(style,'Compact')
    for i=1:n-1
        for j=i+1:n
            if A(i,j)>0
                W(i,j)=60;
            elseif A2(i,j)>0
                W(i,j)=25;
            elseif A3(i,j)>0
                W(i,j)=5;
            elseif A4(i,j)>0
                W(i,j)=-10;
            elseif A5(i,j)>0
                W(i,j)=-20;
            else
                W(i,j)=-20;
            end
        end
    end
elseif strcmp(style,'Stretched')
    for i=1:n-1
        for j=i+1:n
            if A(i,j)>0
                W(i,j)=20;
            elseif A2(i,j)>0
                W(i,j)=10;
            elseif A3(i,j)>0
                W(i,j)=0;
            elseif A4(i,j)>0
                W(i,j)=-10;
            elseif A5(i,j)>0
                W(i,j)=-10;
            else
                W(i,j)=-10;
            end
        end
    end

else
    error('GLweight: Unrecognized style');
end

W=W+W';
