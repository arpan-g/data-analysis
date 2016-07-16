% n=9;
% vf2=1:n;
% vf=zeros(1,n);
% for i = 1:n
%     vf(i)=sum(vf2(1:i));
% end
% 
% plot(vf2,vf2);
% hold on
% plot(vf2,vf);
% legend('vf2','vf');
G=graph(-R,'OmitSelfLoops');
p = plot(G,'EdgeLabel',-G.Edges.Weight);
[T,pred] = minspantree(G);
highlight(p,T)
