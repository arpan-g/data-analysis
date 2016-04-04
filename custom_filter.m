% fftd=fft(node1(1,:));
% absFFT=abs(fftd);
% plot(absFFT(2:end))
[b,a] = butter(3,[0.4 0.8],'stop');
dataOut1 = filter(b,a,node1(1,:));
dataOut2=filter(b,a,node8(1,:));
r=corrcoef(dataOut1,dataOut2)
% plot(node1(1,:));
% hold on;
% plot(dataOut);
% legend('ori','filt');
% fftd=fft(dataOut);
% absFFT=abs(fftd);
% figure
% plot(absFFT(2:end))
plot(node1(1,:))
% hold on
figure
plot(dataOut1)