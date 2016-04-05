
fileID = fopen('0115.txt','r');
input= textscan(fileID,'%u %u64 %u64 %u','Delimiter',' ');
sensor_id=input{1};
start_time=input{2};
end_time = input{3};
sensor_array=[367,365,433,368,359,361,360,432,363,388,387,386,385,393];
[r,c]=size(sensor_id);
fileID_local = fopen('txt_files\complete.txt','w');
for elements = 1:r
    req_sensor=intersect(sensor_id(elements),sensor_array);
    if(~isempty(req_sensor))
%         if((start_time(elements)>1159635600000&&end_time(elements)<1159735600000))
%                 ||(start_time(elements)>1159635600000&&end_time(elements)<1159735600000))
            fprintf(fileID_local,'%u %u %u \n', ...
                sensor_id(elements),start_time(elements),end_time(elements));
%         end
    end
  
end



fclose(fileID_local);