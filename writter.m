function []= writter(a)
file='test.txt';
% FListOpen=fopen('all');

% if(~ismember(file,FListOpen))
fileID_local = fopen(file,'a');
% end
len=length(a);
if(len==6)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d\n',a); %6
elseif(len==8)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d\n',a); %8
    elseif(len==9)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a); %9
elseif(len==12)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a); %12
elseif(len==16)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a); %16
elseif(len==23)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a);%23
elseif(len==30)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a);%30
elseif(len==36)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a);%36
elseif(len==43)
    fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',a);%43
    
end
fclose(fileID_local);


end
