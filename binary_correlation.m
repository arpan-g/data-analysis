%calculate binary coefficients
clear corr_matrix;
num_mins=6;
window_size = num_mins*60*10;%num_mins min=num_mins*60*10ms
overlap_size = window_size/2; %2min = 2*60*100ms
figure1=figure;
corr_matrix = zeros(8,8);
graphMatrix = zeros(8,8);
combine_data = newPirArray; 
% combine_data = [pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
len=size(combine_data);
count = 1;
for i=1:8
    for j=1:8
        for k = 1:overlap_size:len(2)
            
            if(k+window_size<len(2))
                
                a=similar_data(combine_data(i,k:k+window_size),combine_data(j,k:k+window_size),1);
                d=similar_data(combine_data(i,k:k+window_size),combine_data(j,k:k+window_size),0);
                p_1=sum(combine_data(i,k:k+window_size)); %number of 1's in 1st array
                p_2=sum(combine_data(j,k:k+window_size));%number of 1'2 in 2nd array
                [b,c] = disimilar_data(combine_data(i,k:k+window_size),combine_data(j,k:k+window_size));
                %b= proportion of 1s in the first variable and 0s in second
                %variable in the same positions
                %c = proportion of 0s in the first variable and 1s in second variable
                % in the same positions
                q_1 = c+d; % number of 0's in 1st array
                q_2 = b+d; % number of 0's in 2nd array      
%                 value=correlation_coefficient(a,p_1,p_2);
%                 value=gleas( a,p_1,p_2 );
                value=jacard( a,b,c );
%                 value=bb( a,p_1,p_2 );
%                 value=loevinger(a,b,c,d,p_1,p_2,q_1,q_2);
%                 value=cohen(a,b,c,d,p_1,p_2,q_1,q_2);
%                 value=rr( a,b,c,d );
%                 value=simple_matching_coefficient(a,b,c,d);
                
                corr_matrix(i,j) = max(corr_matrix(i,j),value);
               
            end
        end
    end
end
for l =1:8
    for m =1:8
        
        graphMatrix(l,m)=corr_matrix(l,m)>0.40;
    end
    
end
% G= graph(graphMatrix);
% plot(G);
% figure;
h=imagesc(corr_matrix);
xlabel('nodeId');ylabel('nodeId');
% impixelregion(h);
textStrings = num2str(corr_matrix(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
[x,y] = meshgrid(1:8);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
    'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(corr_matrix(:) < midValue,1,3);  %# Choose white or black for the
%#   text color of the strings so
%#   they can be easily seen over
%#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));
colorbar();
saveas(figure1,'29_02/bin_coeff_window_bb.png')