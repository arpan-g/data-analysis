clear all
folder_name='txt_files\ai_lab\';
Files=dir(fullfile(folder_name,'*.txt')) ;
[num_files,~]=size(Files);
for file_counter = 1:num_files
     clear newPirArray;
     clear node*;
     clear pir_array
      file = [folder_name,Files(file_counter).name];
      trial
      shorten_filtern
   
end

