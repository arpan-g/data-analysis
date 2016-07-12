file_read = 'test.txt';
fileID = fopen(file_read,'r');
[c1, c2, c3, c4, c5, c6, c7, c8]=textread(file_read, '%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
tree=[c1 c2 c3 c4 c5 c6 c7 c8];



