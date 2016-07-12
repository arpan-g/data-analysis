% subplot(2,1,1)
% subplot(2,1,2)
% 
% nrows = 4;
% ncol  = 2;
% 
% ax1=subplot(nrows,ncol,1);
% stem(time_1,pirA);hold on;
% legend('node1');
% ax2=subplot(nrows,ncol,2);
% stem(time_2,pirB);hold on;
% 
% legend('node2');
% ax3=subplot(nrows,ncol,3);
% stem(time_3,pirC);hold on;
% legend('node3');
% 
% ax4=subplot(nrows,ncol,4);
% stem(time_4,pirD);hold on;
% legend('node4');
% 
% ax5=subplot(nrows,ncol,5);
% stem(time_5,pirE);hold on;
% legend('node5');
% ax6=subplot(nrows,ncol,6);
% stem(time_6,pirF);hold on;
% legend('node6');
% 
% ax7=subplot(nrows,ncol,7);
% stem(time_7,pirG);hold on;
% legend('node7');
% 
% ax8=subplot(nrows,ncol,8);
% stem(time_8,pirH);hold on;
% legend('node8');
% 
% linkaxes([ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8],'xy');
% 
% % xlabel('time(s)');
% % ylabel('pir output');
% % legend('node1','node2','node3','node4','node5','node6','node7','node8');
% % legend('node3','node4','node5','node7','node8');
% ax=gca;
% ax.YTick = [0,1,1.1];
% % plottools
% 
% 
% 
% % plot(transTime1);
% % hold on;
% % plot(transTime2);


x = [time_1;time_2;time_3;time_4;time_5;time_6;time_7;time_8];
y = [1,8];
c = [pirA;pirB;pirC;pirD;pirE;pirF;pirG;pirH];
imagesc(x,y,c);
xlabel('time(s)');
ylabel('nodeId');
% labels = {'lost_packet','0','1'};
% lcolorbar(labels,'fontweight','bold');
 colorbar();