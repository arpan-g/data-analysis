function [x y] = FastGridLayout(A_adja_Matrix,opts,classid)
% 
% *************************************************************************
% *************************************************************************

A=A_adja_Matrix+A_adja_Matrix';
if nargin == 0
    error('FastGridLayout: At least one input argument is needed.');
elseif nargin>3
    error('FastGridLayout: Too many inputs.');
end
if nargin==1
    opts =[];
end
if size(A,1)~=size(A,2)
    error('FastGridLayout: Adjacency matrix should be square.');
elseif isa(A, 'numeric')
    A = (A>0);
elseif ~isequal(A,A')
    error('FastGridLayout: Invalid adjacency matrix.');
end
n=size(A,1);
if n>3000
    error('FastGridLayout: Too many nodes in the network.');
end
if~isa(opts,'struct')
    error('FastGridLayout: Options argument must be a structure.');
end
if isfield(opts,'LayoutStyle')
    if ~ischar(opts.LayoutStyle)
        error('FastGridLayout: Invlid LayoutStyle.');
    end
    if strcmp(opts.LayoutStyle,'Common') || strcmp(opts.LayoutStyle,'Compact') || strcmp(opts.LayoutStyle,'Stretched')
        W = glweight(A,opts.LayoutStyle);
    elseif strcmp(opts.LayoutStyle,'Custom')
        if size(A,1)~=size(A,2)
            error('FastGridLayout: W matrix should be square.')
        elseif ~isequal(A,A')
            error('FastGridLayout: Invalid adjacency matrix.');
        end
        nw=size(A,1);
        if nw>3000
            error('FastGridLayout: Too many nodes in the network.');
        end
        W=A;
    else
        error('FastGridLayout: The LayoutStyle should be Common, Compact, Stretched');
    end
end
if isfield(opts,'Perturbation')
    if ~isnumeric(opts.Perturbation) || ~isscalar(opts.Perturbation) || ~isreal(opts.Perturbation)
        error('FastGridLayout: Invlid Perturbation parameter');
    end
    if (opts.Perturbation<0) || (opts.Perturbation>1)
        error('FastGridLayout: Invlid Perturbation parameter');
    end

    pert=opts.Perturbation;

end
if isfield(opts,'MaxIter')
    if ~isnumeric(opts.Perturbation) || ~isscalar(opts.Perturbation) || ~isreal(opts.Perturbation)
        error('FastGridLayout: Invlid Perturbation parameter');
    end
    if (opts.MaxIter<=0)
        error('FastGridLayout: The MaxIter should be larger than 0');
    end
    MaxIt=opts.MaxIter;
end
n=length(A);
x0=fix(rand(n,1)*8);
y0=fix(rand(n,1)*8);
rspace=-10;
rinit=3;
sbound=2;     
minrepul=-60;  
prange=11;    
maxwait=50;
% Note: for extra biological attributes, we add an extra positive value (=10) to the weights  
% of any two nodes which belong to the same modules when graph distances =
% 2 and 3.    
if isfield(opts,'Add_Biological_Attribute')
    if ~ischar(opts.Add_Biological_Attribute)
        error('FastGridLayout: Invlid Add_Biological_Attribute.');
    end
    if strcmp(opts.Add_Biological_Attribute,'Y')
        A=(eye(size(A))+A);
        A2=(A*A);
        A3=(A2*A);
        for i=1:n
            for j=1:n
                if i==j
                    continue;
                end                     
                if (classid(i)==classid(j))&&(A2(i,j)>0)
                    W(i,j)=W(i,j)+10;
                elseif (classid(i)==classid(j))&&(A3(i,j)>0)
                    W(i,j)=W(i,j)+10;
                else
                    W(i,j)=W(i,j);
                end
            end
        end
    end
    
    if ~strcmp(opts.OneClass,'none')
       str=opts.OneClass;
       strlen=length(str)      
       mystr=str2num(str(7:strlen))
        for i=1:n
            for j=1:n
                if i==j
                    continue;
                end
                if classid(i)==mystr&&classid(j)==mystr
                    W(i,j)=W(i,j)+15;
                end             
            end
        end
    end
    
end
tic
[x y F]=glayoutdll(W, x0, y0, rspace, rinit, sbound, minrepul, pert, prange, MaxIt, maxwait);
toc
disp(F)





