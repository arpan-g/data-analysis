   function [ value ] = pairwise_compute( x,y)
            value=0;
            num = 0;
            
            mx=mean(x);
            my=mean(y);
            [rx,cx]=size(x);
            for row = 1:cx
                num=num+(x(row)-mx)*(y(row)-my);
            end
            den =calc_var(x)*calc_var(y);
            if(den~=0)
                value= num/den;
            end
   end