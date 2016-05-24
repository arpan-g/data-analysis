function[coordinates] = readCoordinates(path)
file = path;
fileID = fopen(file,'r');
[c1 c2 c3]=textread(file, '%u,%f,%f', 'commentstyle', 'shell');
len=numel(c1);
for i = 1:len
    coordinates(i,:)=[c2(i),c3(i)];
end
end