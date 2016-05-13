x=4:8;
y1=factorial(x);
y2=x.*(3.^(x-1));
plot(x,y1);
hold on;
plot(x,y2);
legend('brute force','minimum spanning tree')
xlabel('number of nodes');
ylabel('O(n)');