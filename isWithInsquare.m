function [ y ] = isWithInsquare( a,b,r )
%check coordinates of point a are within a square rom point b of length r
y=0;
ax1 = a(1)-r/2;
ax2 = a(1)+r/2;
bx1 = b(1)-r/2;
bx2 =b(1)+r/2;

ay1=a(2)-r/2;
ay2=a(2)+r/2;
by1=b(2)-r/2;
by2=b(2)+r/2;



if(((ax1<bx2)||(abs(ax1-bx2)<0.0001))&& ((ax2 >= bx1)||(abs(ax2-bx1)<0.0001)) &&...
        ((ay1<=by2)||(abs(ay1-by2)<0.0001)) && ((ay2 >= by1)||(abs(ay2-by1)<0.0001)) )
    if(((abs(ax2-bx1)<0.0001)&&(abs(by2-ay1)<0.0001))||((abs(bx2-ax1)<0.0001)&&(abs(ay2-by1)<0.0001)))
        y=0;
        return
    end
    if((abs(ax2-bx1)<0.0001)&&(abs(ay2-by1)<0.0001))
        y=0;
        return;
    end
    if((abs(ax1-bx2)<0.0001)&&(abs(ay1-by2)<0.0001))
        y=0;
        return;
    end
    y=1;
end


end