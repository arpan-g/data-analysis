% []
load(file);
[rw,col]=size(newPirArray);
% mega_number=1;
% index=[27,22,15,28,23,16,29,24,17,30,25,18];
for i = 1:col
    data_combine(:,mega_number)=newPirArray(:,i);
    mega_number=mega_number+1;
end
    