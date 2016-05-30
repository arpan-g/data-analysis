% R = power_consumption('txt_files\ai_lab\ai_lab_grid_3X4_combine.mat');

% iteration=1;
% sum_k=0;
% count=1;
% max=0;
% file='test.txt';
% fileID_local = fopen(file,'w');
% num=12;
% a=1:12;
% a(2,:)=1:12;
%  b=zeros(3628800,12);
tic
[r,~]=size(b);
for i = b
    
       fprintf(fileID_local,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',i);
%     sum_k= R(a(1),a(2))+R(a(1),a(4))+R(a(2),a(3))+R(a(2),a(5))+R(a(3),a(6))...
%         +R(a(4),a(5))+R(a(4),a(7))+R(a(5),a(6))+R(a(5),a(8))+R(a(6),a(9))...
%         +R(a(7),a(8))+R(a(7),a(10))+R(a(7),a(11))+R(a(8),a(9))+R(a(8),a(10))...
%         +R(a(8),a(11))+R(a(8),a(12))+R(a(9),a(11))+R(a(9),a(12))+R(a(10),a(11))...
%         +R(a(11),a(12));
%     if(max<sum_k)
%         count=1;
%         arrangement=zeros(1,num);
%         arrangement(count,:)=a;
%         count=count+1;
%         max=sum_k;
%         
%     elseif(abs(max-sum_k)<0.000001)
%         arrangement(count,:)=a;
%         count=count+1;
%     end
% 
%    
%      a= nextperm(a,12);
%     iteration=iteration+1;
    
end
fclose(fileID_local);
toc