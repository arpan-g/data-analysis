[r,c]=size(best_window);
prev_window=10;
count =1;
avg_window=zeros(1,2);
for i = 1:r
    
if(best_window(i,1)==prev_window)
    avg_window(count,2)=(best_window(i,3)-best_window(i,4))+avg_window(count,2);
else 
    count = count +1;
    avg_window(count,1)=best_window(i,1);
    avg_window(count,2)=(best_window(i,3)-best_window(i,4))+avg_window(count,2);
 end
prev_window=best_window(i,1);
end
