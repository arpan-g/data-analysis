t = 0:0.01:10-0.01;
x = cos(2*pi*0.5*t) + randn(size(t))*0.1;
% z = sin(2*pi*0.5*t) + randn(size(t))*0.1;
% z([1:350 550:end]) = 0;
% [c,lags] = xcorr(x,z,'coeff');
z = x; z([1:350 550:end]) = [];
[c,lags] = xcorr(node7(1,:),node8(1,:),'none');
% subplot(211), plot(t,x,'k',(0:length(z)-1)*0.01,z,'r'), legend('A','B')
subplot(212), plot(lags,c,'k'), xlabel('lags [steps]'), ylabel('corr')