file='test_trial.txt';
fileID_local = fopen(file,'w');
% temp=graphMatrix;
temp=a_m;
[r,~]=size(temp);
% for i = 1:43
%     if(sum(temp(i,:))==0)
%         temp(i,:)=[];
%         temp(:,i)=[];
%     end
%     
% 
% end
    
% for i = 1:37
%     for j = i+1:37
%         if(temp(i,j)==1)
%             str=['small_ed.InsertEdge(',num2str(i-1),',',num2str(j-1),',NULL);'];
%             fprintf(fileID_local,'%s',str);
%             str=['small_ed.InsertEdge(',num2str(j-1),',',num2str(i-1),',NULL);'];
%             fprintf(fileID_local,'%s',str);
%             %  str=[num2str(node_s(i)-1),','];
%             %     fprintf(fileID_local,'%s',str);
%         end
%     end
% end

for i = 1:r
    for j = 1:r
    str=[num2str(a_m(i,j)),'&'];
    fprintf(fileID_local,'%s',str);
    end
    str='\n';
    fprintf(fileID_local,'%s',str);
end
    

% end


fclose(fileID_local);