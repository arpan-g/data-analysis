function [temp_data]= spike_removal(data)
temp_data=data;
[a,b]=size(data);
for i= 1:b
    if(i>5&&i<b-5)
        if(sum(temp_data(i-5:i+5))/11>0.5)
            temp_data(i)=1;
        else
            temp_data(i)=0;
        end
    end
end