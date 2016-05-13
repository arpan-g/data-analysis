%% new data set
% clear all;

fileID = fopen(file,'r');
input= textscan(fileID,'%u %u64 %u64','Delimiter',' ');
clear sensor_id;
clear start_time;
clear end_time;
sensor_id=input{1};
start_time=input{2};
end_time = input{3};
sensor_array=[21,14,27,22,15,28,23,16,29,24,17,11,30,31,32,25,18,12,13,6,5,4,10];
% sensor_array=[];
len=length(sensor_array);
[r,c]=size(sensor_id);
count=ones(1,len);
for elements = 1:r
    if(end_time(elements)==0||start_time(elements)==0)
        continue;
    end
    switch sensor_id(elements)
        case sensor_array(1)
            node1(count(1),1)=start_time(elements);
            node1(count(1),2)=end_time(elements);
            count(1)=count(1)+1;
        case sensor_array(2)
            node2(count(2),1)=start_time(elements);
            node2(count(2),2)=end_time(elements);
            count(2)=count(2)+1;
        case sensor_array(3)
            node3(count(3),1)=start_time(elements);
            node3(count(3),2)=end_time(elements);
            count(3)=count(3)+1;
        case sensor_array(4)
            node4(count(4),1)=start_time(elements);
            node4(count(4),2)=end_time(elements);
            count(4)=count(4)+1;
        case sensor_array(5)
            node5(count(5),1)=start_time(elements);
            node5(count(5),2)=end_time(elements);
            count(5)=count(5)+1;
        case sensor_array(6)
            node6(count(6),1)=start_time(elements);
            node6(count(6),2)=end_time(elements);
            count(6)=count(6)+1;
        case sensor_array(7)
            node7(count(7),1)=start_time(elements);
            node7(count(7),2)=end_time(elements);
            count(7)=count(7)+1;
        case sensor_array(8)
            node8(count(8),1)=start_time(elements);
            node8(count(8),2)=end_time(elements);
            count(8)=count(8)+1;
        case sensor_array(9)
            node9(count(9),1)=start_time(elements);
            node9(count(9),2)=end_time(elements);
            count(9)=count(9)+1;
        case sensor_array(10)
            node10(count(10),1)=start_time(elements);
            node10(count(10),2)=end_time(elements);
            count(10)=count(10)+1;
        case sensor_array(11)
            node11(count(11),1)=start_time(elements);
            node11(count(11),2)=end_time(elements);
            count(11)=count(11)+1;
        case sensor_array(12)
            node12(count(12),1)=start_time(elements);
            node12(count(12),2)=end_time(elements);
            count(12)=count(12)+1;
            %new entry
        case sensor_array(13)
            node13(count(13),1)=start_time(elements);
            node13(count(13),2)=end_time(elements);
            count(13)=count(13)+1;
        case sensor_array(14)
            node14(count(14),1)=start_time(elements);
            node14(count(14),2)=end_time(elements);
            count(14)=count(14)+1;
        case sensor_array(15)
            node15(count(15),1)=start_time(elements);
            node15(count(15),2)=end_time(elements);
            count(15)=count(15)+1;
        case sensor_array(16)
            node16(count(16),1)=start_time(elements);
            node16(count(16),2)=end_time(elements);
            count(16)=count(16)+1;
        case sensor_array(17)
            node17(count(17),1)=start_time(elements);
            node17(count(17),2)=end_time(elements);
            count(17)=count(17)+1;
        case sensor_array(18)
            node18(count(18),1)=start_time(elements);
            node18(count(18),2)=end_time(elements);
            count(18)=count(18)+1;
        case sensor_array(19)
            node19(count(19),1)=start_time(elements);
            node19(count(19),2)=end_time(elements);
            count(19)=count(19)+1;
        case sensor_array(20)
            node20(count(20),1)=start_time(elements);
            node20(count(20),2)=end_time(elements);
            count(20)=count(20)+1;
        case sensor_array(21)
            node21(count(21),1)=start_time(elements);
            node21(count(21),2)=end_time(elements);
            count(21)=count(21)+1;
        case sensor_array(22)
            node22(count(22),1)=start_time(elements);
            node22(count(22),2)=end_time(elements);
            count(22)=count(22)+1;
        case sensor_array(23)
            node23(count(23),1)=start_time(elements);
            node23(count(23),2)=end_time(elements);
            count(23)=count(23)+1;
    end
    
    
end

sampling_start=min([node1(1,1),node2(1,1),node3(1,1),node4(1,1),node5(1,1),node6(1,1),node7(1,1),node8(1,1),node9(1,1),node10(1,1),node11(1,1),node12(1,1),node13(1,1),node14(1,1),node15(1,1),node16(1,1),node17(1,1),node18(1,1),node19(1,1),node20(1,1),node21(1,1),node22(1,1),node23(1,1)]);
sampling_end=max([node1(end,2),node2(end,1),node3(end,1),node4(end,1),node5(end,1),node6(end,1),node7(end,1),node8(end,1),node9(end,1),node10(end,1),node11(end,1),node12(end,1),node13(end,1),node14(end,1),node15(end,1),node16(end,1),node17(end,1),node18(end,1),node19(end,1),node20(end,1),node21(end,1),node22(end,1),node23(end,1)]);
max_count = count-1;

kimi = 1;
count=ones(1,len);
for time= sampling_start : 100:sampling_end
    
    
    
    if (time>node1(count(1),1)&&time<node1(count(1),2))
        pir_array(1,kimi)=1;
    else
        pir_array(1,kimi)=0;
    end
    if (time>node2(count(2),1)&&time<node2(count(2),2))
        pir_array(2,kimi)=1;
    else
        pir_array(2,kimi)=0;
    end
    if (time>node3(count(3),1)&&time<node3(count(3),2))
        pir_array(3,kimi)=1;
    else
        pir_array(3,kimi)=0;
    end
    if (time>node4(count(4),1)&&time<node4(count(4),2))
        pir_array(4,kimi)=1;
    else
        pir_array(4,kimi)=0;
    end
    if (time>node5(count(5),1)&&time<node5(count(5),2))
        pir_array(5,kimi)=1;
    else
        pir_array(5,kimi)=0;
    end
    if (time>node6(count(6),1)&&time<node6(count(6),2))
        pir_array(6,kimi)=1;
    else
        pir_array(6,kimi)=0;
    end
    if (time>node7(count(7),1)&&time<node7(count(7),2))
        pir_array(7,kimi)=1;
    else
        pir_array(7,kimi)=0;
    end
    if (time>node8(count(8),1)&&time<node8(count(8),2))
        pir_array(8,kimi)=1;
    else
        pir_array(8,kimi)=0;
    end
    if (time>node9(count(9),1)&&time<node9(count(9),2))
        pir_array(9,kimi)=1;
    else
        pir_array(9,kimi)=0;
    end
    if (time>node10(count(10),1)&&time<node10(count(10),2))
        pir_array(10,kimi)=1;
    else
        pir_array(10,kimi)=0;
    end
    if (time>node11(count(11),1)&&time<node11(count(11),2))
        pir_array(11,kimi)=1;
    else
        pir_array(11,kimi)=0;
    end
    if (time>node12(count(12),1)&&time<node12(count(12),2))
        pir_array(12,kimi)=1;
    else
        pir_array(12,kimi)=0;
    end
    %new entry
    if (time>node13(count(13),1)&&time<node13(count(13),2))
        pir_array(13,kimi)=1;
    else
        pir_array(13,kimi)=0;
    end
    if (time>node14(count(14),1)&&time<node14(count(14),2))
        pir_array(14,kimi)=1;
    else
        pir_array(14,kimi)=0;
    end
    if (time>node15(count(15),1)&&time<node15(count(15),2))
        pir_array(15,kimi)=1;
    else
        pir_array(15,kimi)=0;
    end
    if (time>node16(count(16),1)&&time<node16(count(16),2))
        pir_array(16,kimi)=1;
    else
        pir_array(16,kimi)=0;
    end
    if (time>node17(count(17),1)&&time<node17(count(17),2))
        pir_array(17,kimi)=1;
    else
        pir_array(17,kimi)=0;
    end
    if (time>node18(count(18),1)&&time<node18(count(18),2))
        pir_array(18,kimi)=1;
    else
        pir_array(18,kimi)=0;
    end
    if (time>node19(count(19),1)&&time<node19(count(19),2))
        pir_array(19,kimi)=1;
    else
        pir_array(19,kimi)=0;
    end
    if (time>node20(count(20),1)&&time<node20(count(20),2))
        pir_array(20,kimi)=1;
    else
        pir_array(20,kimi)=0;
    end
    if (time>node21(count(21),1)&&time<node21(count(21),2))
        pir_array(21,kimi)=1;
    else
        pir_array(21,kimi)=0;
    end
    if (time>node22(count(22),1)&&time<node22(count(22),2))
        pir_array(22,kimi)=1;
    else
        pir_array(22,kimi)=0;
    end
    if (time>node23(count(23),1)&&time<node23(count(23),2))
        pir_array(23,kimi)=1;
    else
        pir_array(23,kimi)=0;
    end
    
    %     new entry
    if(time>node1(count(1),2))
        if(count(1)<max_count(1))
            count(1)=count(1)+1;
        end
    end
    if(time>node2(count(2),2))
        if(count(2)<max_count(2))
            count(2)=count(2)+1;
        end
    end
    if(time>node3(count(3),2))
        if(count(3)<max_count(3))
            count(3)=count(3)+1;
        end
    end
    if(time>node4(count(4),2))
        if(count(4)<max_count(4))
            count(4)=count(4)+1;
        end
    end
    if(time>node5(count(5),2))
        if(count(5)<max_count(5))
            count(5)=count(5)+1;
        end
    end
    if(time>node6(count(6),2))
        if(count(6)<max_count(6))
            count(6)=count(6)+1;
        end
    end
    if(time>node7(count(7),2))
        if(count(7)<max_count(7))
            count(7)=count(7)+1;
        end
    end
    if(time>node8(count(8),2))
        if(count(8)<max_count(8))
            count(8)=count(8)+1;
        end
    end
    if(time>node9(count(9),2))
        if(count(9)<max_count(9))
            count(9)=count(9)+1;
        end
    end
    if(time>node10(count(10),2))
        if(count(10)<max_count(10))
            count(10)=count(10)+1;
        end
    end
    if(time>node11(count(11),2))
        if(count(11)<max_count(11))
            count(11)=count(11)+1;
        end
    end
    if(time>node12(count(12),2))
        if(count(12)<max_count(12))
            count(12)=count(12)+1;
        end
    end
    %new entry
    if(time>node13(count(13),2))
        if(count(13)<max_count(13))
            count(13)=count(13)+1;
        end
    end
    if(time>node14(count(14),2))
        if(count(14)<max_count(14))
            count(14)=count(14)+1;
        end
    end
    if(time>node15(count(15),2))
        if(count(15)<max_count(15))
            count(15)=count(15)+1;
        end
    end
    if(time>node16(count(16),2))
        if(count(16)<max_count(16))
            count(16)=count(16)+1;
        end
    end
     if(time>node17(count(17),2))
        if(count(17)<max_count(17))
            count(17)=count(17)+1;
        end
     end
     if(time>node18(count(18),2))
        if(count(18)<max_count(18))
            count(18)=count(18)+1;
        end
     end
     if(time>node19(count(19),2))
        if(count(19)<max_count(19))
            count(19)=count(19)+1;
        end
     end
     if(time>node20(count(20),2))
        if(count(20)<max_count(20))
            count(20)=count(20)+1;
        end
     end
     if(time>node21(count(21),2))
        if(count(21)<max_count(21))
            count(21)=count(21)+1;
        end
     end
    
     if(time>node22(count(22),2))
        if(count(22)<max_count(22))
            count(22)=count(22)+1;
        end
     end
    
     
     if(time>node23(count(23),2))
        if(count(23)<max_count(23))
            count(23)=count(23)+1;
        end
     end
    
    kimi = kimi+1;
end

% save('washington_1.mat','pir_array');
