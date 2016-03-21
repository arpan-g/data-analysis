clear correlation_array;
count=1;
for i= 1:8
    for j = i+1:8
        correlation_array(count)=R(i,j);
        count=count+1;
    end
end
mn=mean(correlation_array);
sd=std(sort(correlation_array));
dist=mn+sd/3;
plot(evaluation_matrix(:,1))
hold on;
plot(evaluation_matrix(:,4))
legend('threshold','mn+sd/3')
xlabel('datasets');
ylabel('correlation coefficients')