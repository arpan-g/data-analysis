close all;
value=1;
[b,a] = butter(3,[0.4 0.5],'bandpass');
dataIn1=node1(value,1:end);
dataIn2=node2(value,1:end);

% fftd1=fft(dataIn1);
% absFFTD1=abs(fftd1);
% plot(absFFTD1(1,5:end-5));
% fftd2=fft(node8(value,:));
% absFFTD2=abs(fftd2);
% r=corrcoef(absFFTD2(1,5:end-5),absFFTD1(1,5:end-5));

% psd

dataOut1 = filter(b,a,dataIn1);
dataOut2=filter(b,a,dataIn2);
r=corrcoef(dataOut1,dataOut2);
% plot(dataIn,'r')
% hold on;
% plot(dataOut,'b');
% sound(dataIn);
% hold off;