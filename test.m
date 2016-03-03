hold on;
element=1;
plot(node1(element,:));hold on;
plot(node2(element,:));hold on;
plot(node3(element,:));hold on;
plot(node4(element,:));hold on;
plot(node5(element,:));hold on;
plot(node6(element,:));hold on;
plot(node7(element,:));hold on;
plot(node8(element,:));hold on;
legend('1','2','3','4','5','6','7','8');


for i = 1:8
energy(i)=sum(abs(transitionMatrix(i,:)));
end