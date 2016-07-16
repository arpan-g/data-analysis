clear all;
file='master_data_wsu_4x3_fil_1.mat';
load(file);
temp=newPirArray;
count=1;
t=20;
for start_time=0:t:224
    clear newPirArray;
    end_time=start_time+t;
         if(end_time<224)
             newPirArray=temp(:,start_time*36000+1:end_time*36000);
             save(['split_files/wsu4x3',num2str(count)],'newPirArray');
             count=count+1;
         end
end



