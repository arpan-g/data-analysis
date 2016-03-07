% % clear;
% % signal=[0,ones(1,126),0];
% % fftd=fft(signal);
% % power=fftd.*conj(fftd);
% % total=sum(power);
% % figure1=figure;
% % stairs(signal);
% % ylim([0 1.2]);
% % xlim([0 130]);
% % power_file = '07_03/power_1.png';
% % saveas(figure1,power_file);
% 
%     
%     len=size(energyMatrix)
% transitionMatrix = zeros(8,1);
% % [array,counts,column_number]=calculate_first_trigger(newPirArray);
% 
% for i = 1:len(1)
%     count =1;
%     for j = 1:len(2)
%        
%         
%         if(j>1 && j<len(2))
%             if(energyMatrix(i,j)>10000)
%                 tempMatrix(i,count)=1;
% %             elseif(newPirArray(i,j+1)<newPirArray(i,j))
% %             transitionMatrix(i,count)=-1;
%             else
%                 tempMatrix(i,count)=0;
%             end
%                 count = count +1;
%         end
%         
%     end
% end
 signal_1 = [1 ,0,0,1];
signal_2 = [0,1,1,0];

stem(signal_1)
hold on;
stem(signal_2)
xlim([-1 5])
ylim([0 1.2])
legend('signal_1','signal_2')
% legend('signal_2')
xlabel('time')
ylabel('signal amplitude')