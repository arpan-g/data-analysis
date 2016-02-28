value=3;
MAX_VALUE = 16728;
clear mega_imf;
clear diff;
megaNode=[node1(value,1:MAX_VALUE);node2(value,1:MAX_VALUE);node3(value,1:MAX_VALUE);node4(value,1:MAX_VALUE);node5(value,1:MAX_VALUE);node6(value,1:MAX_VALUE);node7(value,1:MAX_VALUE);node8(value,1:MAX_VALUE)];
for j = 1:8
    clear ZCR;
    clear ZCT;
    clear imf;
    clear index;
    imf=emd(megaNode(j,:));
    len_imf = size(imf);
    count =1;
    % calc freq mean(abs(diff(sign(imf(i,:)))));
    for i = 1:len_imf(1)
        ZCR(i)=mean(abs(diff(sign(imf(i,:)))));
        
        ZCT(i)=1/ZCR(i);
        
%         if(ZCR(i)==0)
        if(ZCT(i)>358 && ZCT(i)<2000)
            index(count)=i;
            count = count+1;
        end
    end
    j
    sum_imf=0;
    len_index=size(index);
    for i = 1:len_index(2)
        sum_imf = sum_imf+imf(index(i),:);
    end
    mega_imf(j,:) = sum_imf;
end
% for i = 1:8
%     figure;
%     plot(mega_imf(i,:));
%     hline = refline([0 0]);
%     hline.Color = 'r';
% end