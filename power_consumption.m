% num_mins=12;
clear standardDeviationMatrix;
clear total_pow;
clear energyMatrix;
window_size = 128;%num_mins min=num_mins*60*10ms
overlap_size = window_size/2;
combine_data = newPirArray;
len=size(combine_data);

for i = 1:8
    count =1;
    for k = 1:overlap_size:len(2)
        if(k+window_size<len(2))
            values=combine_data(i,k:k+window_size);
            F = fft(values);
            pow = F.*conj(F);
            total_pow = sum(pow);
            standardDeviationMatrix(i,count)=max(pow);
            energyMatrix(i,count)=total_pow;
            count =count +1;
        end
    end
end
newCount=1;
for i = 1:count-1
    
    if(max(energyMatrix(:,i)>0))
        
        filteredMatrix(:,newCount)=energyMatrix(:,i);
        newCount=newCount+1;
    end
end

figure;
imagesc(energyMatrix);
colorbar();
% R=corrcoef(transpose(energyMatrix));
R=corrcoef(transpose(standardDeviationMatrix));
for l =1:8
    for m =1:8
        
        graphMatrix(l,m)=R(l,m)>0.45;
    end
    
end
G= graph(graphMatrix);
plot(G);
figure;
h=imagesc(R);
xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
textStrings = num2str(R(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
    'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(R(:) < midValue,1,3);  %# Choose white or black for the
%#   text color of the strings so
%#   they can be easily seen over
%#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));
colorbar();