function[tree] = readFile4x3(path)
[c1, c2, c3, c4, c5, c6, c7, c8,c9,c10,c11,c12]=textread(path, '%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u', 'commentstyle', 'shell');
tree=[c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12];
end


