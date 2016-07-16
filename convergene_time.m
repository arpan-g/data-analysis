clear all;
file='master_data_wsu_4x3_fil_1.mat';
load(file);
counter=1;
error_count=1;
% for t = 3:3:30
t=20;
combine_data=[];
    e=0;
    for start_time=0:t:400
        end_time=start_time+t;
       temp = newPirArray(:,start_time*36000+1:end_time*36000);
        if(end_time<401)
            isomorphicTreeMatching_4x3;
%             e=error_calculator(arrangement)+e;
            [evaluation_matrix(counter),~]=size(mapping);
            counter=counter+1;
        end
% temp=newPirArray(:,81*36000:100*36000);
% a=sum(temp');
% if(min(a)>1000)
%     combine_data=[combine_data,temp];
% end

% bar(a)

% title(name);


        
    end
%     evaluation_matrix(error_count)=e;
%     error_count=error_count+1;
% end