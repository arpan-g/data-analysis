function[area]=calculateAreaOfIntersection(r,d)
    
area=2*r^2*acos(d/(2*r))-0.5*d*sqrt((2*r-d)*(2*r+d));

    
end