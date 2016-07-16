clear all
folder_name='WSU_4X3_complete\';
Files=dir(fullfile(folder_name,'*.txt')) ;
[num_files,~]=size(Files);
for file_counter = 25:num_files
% file_counter=28;
clear newPirArray;
clear node*;
clear pir_array
% file_counter='44_4_21';
file = [folder_name,Files(file_counter).name];
% file=[folder_name,'aiLab_4_21.txt'];
try
trial
shorten_filtern
beep
catch ME
end


end

