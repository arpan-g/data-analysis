% clear all;
load('long_tests\pir_data\pir_05_04.mat');
R=zeros(8,8);

for i = 1:8
    for j = i:8
        R(i,j)=similar_data(newPirArray(i,:),newPirArray(j,:),1);
        R(j,i)=R(i,j);
    end
end
% for i=1:8
%     norm(i)=R(i,i);
% end
% 
%         for i = 1:8
%             for j= 1:8
%                 R(i,j)=R(i,j)/norm(i);
%             end
%         end