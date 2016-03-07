% hold on;
% element=1;
% plot(node1(element,:));hold on;
% plot(node2(element,:));hold on;
% plot(node3(element,:));hold on;
% plot(node4(element,:));hold on;
% plot(node5(element,:));hold on;
% plot(node6(element,:));hold on;
% plot(node7(element,:));hold on;
% plot(node8(element,:));hold on;
% legend('1','2','3','4','5','6','7','8');

array=[1,6];
for i = array
plot(energyMatrix(i,:));hold on;
end
legend('1','6');
legend('1','2','3','4','5','6','7','8');