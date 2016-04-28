function[error]= validate_custom(c,orientation)
h_1=[0,0;0,1;1,0;1,1;2,0;2,1;3,0;3,1];
h_2=[0,1;0,0;1,1;1,0;2,1;2,0;3,1;3,0];
h_3=flipud(h_1);
h_4=flipud(h_2);
h=[h_1;h_2;h_3;h_4];
v_1=[0,0;1,0;0,1;1,1;0,2;1,2;0,3;1,3];
v_2=[1,0;0,0;1,1;0,1;1,2;0,2;1,3;0,3];
v_3=flipud(v_1);
v_4=flipud(v_2);
v=[v_1;v_2;v_3;v_4];

e=zeros(4,1);
if(orientation==0)
    if(isequal(h_1,c)||isequal(h_2,c)||isequal(h_3,c)||isequal(h_4,c))
        e=0;
    else
        for orien = 1:4
            for i=1:8
                if(~isequal(h(i+(orien-1)*8,:),c(i,:)))
                    e(orien)=e(orien)+1;
                end
            end
        end
    end
    %vertical
    
else
    if(isequal(v_1,c)||isequal(v_2,c)||isequal(v_3,c)||isequal(v_4,c))
        e=0;
    else
        for orien = 1:4
            for i=1:8
                if(~isequal(v(i+(orien-1)*8,:),c(i,:)))
                    e(orien)=e(orien)+1;
                end
            end
        end
        
    end
    %horizontal
    
    
    
end
error=min(e);
end