function classid=Read_Classid(datafile,Label)
nn=length(Label);


try
[n1 n2]=textread(datafile,'%s %u');
catch ME2
    disp(sprintf('Please check classid file %s', datafile));
     % ME2 = addCause(ME2, ME1);
      rethrow(ME2)
end



mm=length(n1);
classid=ones(nn,1);
for  i=1:nn
    for  j=1:mm
        if  (strcmp(n1(j),Label(i)))&&((n2(j)>=1&&n2(j)<=12))
            classid(i) =n2(j);
            continue;
        end
    end
end


