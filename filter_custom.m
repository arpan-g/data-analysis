    function [ filt_x,filt_y ] = filter_custom( mat_x,mat_y)
        loop_count=1;
        [row_size,col_size]=size(mat_x);
        for count = 1:row_size
%             if(~((mat_x(count)==4096&&mat_y(count)==0)||(mat_x(count)==0&&mat_y(count)==4096)))
                filt_x(loop_count)=mat_x(count);
                filt_y(loop_count)=mat_y(count);
                loop_count=loop_count+1;
%             end
        end
    end