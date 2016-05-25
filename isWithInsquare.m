function [ y ] = isWithInsquare( a,b,r )
%check coordinates of point a are within a square rom point b of length r
y=0;
SquareAX1 = a(1)-r/2;
SquareAX2 = a(1)+r/2;
SquareBX1 = b(1)-r/2;
SquareBX2 =b(1)+r/2;

SquareAY1=a(2)-r/2;
SquareAY2=a(2)+r/2;
SquareBY1=b(2)-r/2;
SquareBY2=b(2)+r/2;



if(((SquareAX1<SquareBX2)||(abs(SquareAX1-SquareBX2)<0.0001))&& ((SquareAX2 >= SquareBX1)||(abs(SquareAX2-SquareBX1)<0.0001)) &&...
        ((SquareAY1<=SquareBY2)||(abs(SquareAY1-SquareBY2)<0.0001)) && ((SquareAY2 >= SquareBY1)||(abs(SquareAY2-SquareBY1)<0.0001)) )
    if(((abs(SquareAX2-SquareBX1)<0.0001)&&(abs(SquareBY2-SquareAY1)<0.0001))||((abs(SquareBX2-SquareAX1)<0.0001)&&(abs(SquareAY2-SquareBY1)<0.0001)))
        y=0;
        return
    end
    y=1;
end
    
    
end