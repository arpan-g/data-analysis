count =1;
neighbouring_map=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];
fileID = fopen('exp.txt','a');
for i = 1:8
    for j = 1:8
        if(i~=j)
      fprintf(fileID,'%1.2f,%1d\n',R(i,j),neighbouring_map(i,j)); 
        end
    end
end
fclose(fileID);
% figure
% hist(norm_correlation_sorted(:))
% [mu,s,muci,sci]=normfit(norm_correlation_sorted);
% x=0:0.01:1;
% norm=normpdf(x,mu,s);
% figure
% plot(x,norm)
x = 0:.1:1;
A = [x; exp(x)];


% fprintf(fileID,'%6s %12s\n','x','exp(x)');

