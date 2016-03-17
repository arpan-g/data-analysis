optimistic_neighbouring_map=[ 1     1     1     -1     0     0     0     0;    1     1     -1     1     0     0     0     0;    1     -1     1     1     1     -1     0     0;    -1     1     1     1     -1     1     0     0;    0     0     1     -1     1     1     1     -1;    0     0     -1     1     1     1     -1     1;    0     0     0     0     1     -1     1     1;    0     0     0     0     -1     1     1     1];
neighbouring_map=[1,1,1,zeros(1,5);1,1,0,1,zeros(1,4);1,0,1,1,1,0,0,0;0,1,1,1,0,1,0,0;0,0,1,0,1,1,1,0;0,0,0,1,1,1,0,1;0,0,0,0,1,0,1,1;0,0,0,0,0,1,1,1];
fileID_local = fopen('exp.txt','w');




% for i = 1:8
%     for j = i:8
%         if(i~=j)
%             fprintf(fileID,'%1.2f,%1d\n',R(i,j),optimistic_neighbouring_map(i,j));
%             min_threshold(window_count,1)=window_size;
%             switch(optimistic_neighbouring_map(i,j))
%                 case 0
%                     min_threshold(window_count,2)=max(min_threshold(window_count,2),R(i,j));
%                 case -1
%                     min_threshold(window_count,3)=min(min_threshold(window_count,3),R(i,j));
%                 case 1
%                     min_threshold(window_count,4)=min(min_threshold(window_count,4),R(i,j));
%                     
%                     %       accumulate(count_snip,1)=R(i,j);
%                     %       accumulate(count_snip,2)=optimistic_neighbouring_map(i,j);
%                     %       count_snip=count_snip+1;
%             end
%         end
%     end
% end
%  fprintf(fileID,'%d\n',window_size);
for i = 1:12
    fprintf(fileID_local,'%1.2f,%1d,%1d\n',evaluation_matrix(i,1),evaluation_matrix(i,2),evaluation_matrix(i,3));
end

% fprintf(fileID,'%1d,%1d\n',window_size,sum(evaluation_matrix(:,2))+sum(evaluation_matrix(:,3)));
fclose(fileID_local);
% figure
% hist(norm_correlation_sorted(:))
% [mu,s,muci,sci]=normfit(norm_correlation_sorted);
% x=0:0.01:1;
% norm=normpdf(x,mu,s);
% figure
% plot(x,norm)



% fprintf(fileID,'%6s %12s\n','x','exp(x)');

