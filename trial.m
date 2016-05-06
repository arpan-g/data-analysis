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
sensor_array=[15,22,27,16,23,28,17,24,29,18,25,30];
% sensor_array=[];
[r,c]=size(sensor_id);
count=ones(1,12);
for elements = 1:r
    if(end_time(elements)==0)
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
    end
    
    
end

sampling_start=min([node1(1,1),node2(1,1),node3(1,1),node4(1,1),node5(1,1),node6(1,1),node7(1,1),node8(1,1),node9(1,1),node10(1,1),node11(1,1),node12(1,1)]);
sampling_end=max([node1(end,2),node2(end,1),node3(end,1),node4(end,1),node5(end,1),node6(end,1),node7(end,1),node8(end,1),node9(end,1),node10(end,1),node11(end,1),node12(end,1)]);
max_count = count-1;

kimi = 1;
count=ones(1,12);
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
    kimi = kimi+1;
end

  save('washington_1.mat','pir_array');
