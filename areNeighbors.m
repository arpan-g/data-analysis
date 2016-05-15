function[bool]=areNeighbors(nodeA,nodeB,a_m)
bool=0;
if(nodeA==0||nodeB==0)
    return;
end
bool=a_m(nodeA,nodeB);

end