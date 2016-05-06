function []= writter(a)
file='test.txt';
% FListOpen=fopen('all');

% if(~ismember(file,FListOpen))
    fileID_local = fopen(file,'a');
% end
% fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d\n',a);
fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a);
fclose(fileID_local);


end
