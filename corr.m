<<<<<<< HEAD
% t = 0:0.01:10-0.01;
% x = cos(2*pi*0.5*t) + randn(size(t))*0.1;
% z = sin(2*pi*0.5*t) + randn(size(t))*0.1;
% z([1:350 550:end]) = 0;
% [c,lags] = xcorr(x,z,'coeff');
% z = x; z([1:350 550:end]) = [];
clear corrValues;
% figure1 =figure;
value=1;
node_id = 8;
a=[pirA ;pirB; pirC; pirD; pirF; pirG;pirH];
% a = [node1(value,1:6778);node2(value,1:6778);node3(value,1:6778);node4(value,1:6778);node5(value,1:6778);node6(value,1:6778);node7(value,1:6778);node8(value,1:6778)];
plotTitle=['node1';'node2';'node3';'node4';'node5';'node6';'node7';'node8'];
for j = 1:7
    for i = 1:7
        
        [c,lags]=xcorr(a(j,:),a(i,:),0,'coeff');
        corValues(j,i) = max(c);
        % subplot(211), plot(t,x,'k',(0:length(z)-1)*0.01,z,'r'), legend('A','B')
        
        % subplot(212),
        % plot(lags,c,'k'), xlabel('lags [steps]'), ylabel('corr')
        
        
        
    end
end
% plot(corValues);xlabel('nodeID'),ylabel('corr');title('node8');
% saveas(figure1,'node8.png')
imagesc(corValues);
colorbar();
=======
% t = 0:0.01:10-0.01;
% x = cos(2*pi*0.5*t) + randn(size(t))*0.1;
% z = sin(2*pi*0.5*t) + randn(size(t))*0.1;
% z([1:350 550:end]) = 0;
% [c,lags] = xcorr(x,z,'coeff');
% z = x; z([1:350 550:end]) = [];
clear corrValues;
% figure1 =figure;
value=1;
node_id = 8;
a=[pirA ;pirB; pirC; pirD; pirE; pirF; pirG;pirH];
% a = [node1(value,1:6778);node2(value,1:6778);node3(value,1:6778);node4(value,1:6778);node5(value,1:6778);node6(value,1:6778);node7(value,1:6778);node8(value,1:6778)];
plotTitle=['node1';'node2';'node3';'node4';'node5';'node6';'node7';'node8'];
for j = 1:8
for i = 1:8
    
    [c,lags] = xcorr(a(j,:),a(i,:),0,'coeff');
     corValues(j,i) = c;
    % subplot(211), plot(t,x,'k',(0:length(z)-1)*0.01,z,'r'), legend('A','B')
    
    % subplot(212),
    % plot(lags,c,'k'), xlabel('lags [steps]'), ylabel('corr')
    
    
    
end
end
% plot(corValues);xlabel('nodeID'),ylabel('corr');title('node8');
% saveas(figure1,'node8.png')
imagesc(corValues);
colorbar();
>>>>>>> ff6a48a4cb1abbd75a6418d9df3e7c42c4d2779d
