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
% sensor_array=1:12;
sensor_array=[27,22,15,28,23,16,29,24,17,30,25,18];
% sensor_array=setdiff(sensor_array,[35,38]);
% sensor_array(35)=[];
% sensor_array(37)=[];
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
%         case sensor_array(13)
%             node13(count(13),1)=start_time(elements);
%             node13(count(13),2)=end_time(elements);
%             count(13)=count(13)+1;
%         case sensor_array(14)
%             node14(count(14),1)=start_time(elements);
%             node14(count(14),2)=end_time(elements);
%             count(14)=count(14)+1;
%         case sensor_array(15)
%             node15(count(15),1)=start_time(elements);
%             node15(count(15),2)=end_time(elements);
%             count(15)=count(15)+1;
%         case sensor_array(16)
%             node16(count(16),1)=start_time(elements);
%             node16(count(16),2)=end_time(elements);
%             count(16)=count(16)+1;
%         case sensor_array(17)
%             node17(count(17),1)=start_time(elements);
%             node17(count(17),2)=end_time(elements);
%             count(17)=count(17)+1;
%         case sensor_array(18)
%             node18(count(18),1)=start_time(elements);
%             node18(count(18),2)=end_time(elements);
%             count(18)=count(18)+1;
%         case sensor_array(19)
%             node19(count(19),1)=start_time(elements);
%             node19(count(19),2)=end_time(elements);
%             count(19)=count(19)+1;
%         case sensor_array(20)
%             node20(count(20),1)=start_time(elements);
%             node20(count(20),2)=end_time(elements);
%             count(20)=count(20)+1;
%         case sensor_array(21)
%             node21(count(21),1)=start_time(elements);
%             node21(count(21),2)=end_time(elements);
%             count(21)=count(21)+1;
%         case sensor_array(22)
%             node22(count(22),1)=start_time(elements);
%             node22(count(22),2)=end_time(elements);
%             count(22)=count(22)+1;
%         case sensor_array(23)
%             node23(count(23),1)=start_time(elements);
%             node23(count(23),2)=end_time(elements);
%             count(23)=count(23)+1;
%         case sensor_array(24)
%             node24(count(24),1)=start_time(elements);
%             node24(count(24),2)=end_time(elements);
%             count(24)=count(24)+1;
%         case sensor_array(25)
%             node25(count(25),1)=start_time(elements);
%             node25(count(25),2)=end_time(elements);
%             count(25)=count(25)+1;
%         case sensor_array(26)
%             node26(count(26),1)=start_time(elements);
%             node26 (count(26),2)=end_time(elements);
%             count(26)=count(26)+1;
%         case sensor_array(27)
%             node27(count(27),1)=start_time(elements);
%             node27 (count(27),2)=end_time(elements);
%             count(27)=count(27)+1;
%         case sensor_array(28)
%             node28(count(28),1)=start_time(elements);
%             node28(count(28),2)=end_time(elements);
%             count(28)=count(28)+1;
%         case sensor_array(29)
%             node29(count(29),1)=start_time(elements);
%             node29(count(29),2)=end_time(elements);
%             count(29)=count(29)+1;
%         case sensor_array(30)
%             node30(count(30),1)=start_time(elements);
%             node30(count(30),2)=end_time(elements);
%             count(30)=count(30)+1;
%         case sensor_array(31)
%             node31(count(31),1)=start_time(elements);
%             node31(count(31),2)=end_time(elements);
%             count(31)=count(31)+1;
%         case sensor_array(32)
%             node32(count(32),1)=start_time(elements);
%             node32(count(32),2)=end_time(elements);
%             count(32)=count(32)+1;
%         case sensor_array(33)
%             node33(count(33),1)=start_time(elements);
%             node33(count(33),2)=end_time(elements);
%             count(33)=count(33)+1;
%         case sensor_array(34)
%             node34(count(34),1)=start_time(elements);
%             node34(count(34),2)=end_time(elements);
%             count(34)=count(34)+1;
%         case sensor_array(35)
%             node35(count(35),1)=start_time(elements);
%             node35(count(35),2)=end_time(elements);
%             count(35)=count(35)+1;
%         case sensor_array(36)
%             node36(count(36),1)=start_time(elements);
%             node36(count(36),2)=end_time(elements);
%             count(36)=count(36)+1;
%         case sensor_array(37)
%             node37(count(37),1)=start_time(elements);
%             node37(count(37),2)=end_time(elements);
%             count(37)=count(37)+1;
%         case sensor_array(38)
%             node38(count(38),1)=start_time(elements);
%             node38(count(38),2)=end_time(elements);
%             count(38)=count(38)+1;
%         case sensor_array(39)
%             node39(count(39),1)=start_time(elements);
%             node39(count(39),2)=end_time(elements);
%             count(39)=count(39)+1;
%         case sensor_array(40)
%             node40(count(40),1)=start_time(elements);
%             node40(count(40),2)=end_time(elements);
%             count(40)=count(40)+1;
%         case sensor_array(41)
%             node41(count(41),1)=start_time(elements);
%             node41(count(41),2)=end_time(elements);
%             count(41)=count(41)+1;
%         case sensor_array(42)
%             node42(count(42),1)=start_time(elements);
%             node42(count(42),2)=end_time(elements);
%             count(42)=count(42)+1;
%         case sensor_array(43)
%             node43(count(43),1)=start_time(elements);
%             node43(count(43),2)=end_time(elements);
%             count(43)=count(43)+1;
%         case sensor_array(44)
%             node44(count(44),1)=start_time(elements);
%             node44(count(44),2)=end_time(elements);
%             count(44)=count(44)+1;
    end
    
    
end

sampling_start=min([node1(1,1),node2(1,1),node3(1,1),node4(1,1),node5(1,1),node6(1,1),node7(1,1),node8(1,1),node9(1,1),node10(1,1),node11(1,1),node12(1,1)]);%,node13(1,1),node14(1,1),node15(1,1),node16(1,1),node17(1,1),node18(1,1),node19(1,1),node20(1,1),node21(1,1),node22(1,1),node23(1,1),node24(1,1),node25(1,1),node26(1,1),node27(1,1),node28(1,1),node29(1,1),node30(1,1),node31(1,1),node32(1,1),node33(1,1),node34(1,1),node35(1,1),node36(1,1),node37(1,1),node38(1,1),node39(1,1),node40(1,1),node41(1,1),node42(1,1),node43(1,1)]);
sampling_end=max([node1(end,2),node2(end,1),node3(end,1),node4(end,1),node5(end,1),node6(end,1),node7(end,1),node8(end,1),node9(end,1),node10(end,1),node11(end,1),node12(end,1)]);%,node13(end,1),node14(end,1),node15(end,1),node16(end,1),node17(end,1),node18(end,1),node19(end,1),node20(end,1),node21(end,1),node22(end,1),node23(end,1),node24(end,1),node25(end,1),node26(end,1),node27(end,1),node28(end,1),node29(end,1),node30(end,1),node31(end,1),node32(end,1),node33(end,1),node34(end,1),node35(end,1),node36(end,1),node29(end,1),node30(end,1),node31(end,1),node32(end,1),node33(end,1),node34(end,1),node35(end,1),node36(end,1),node37(end,1),node38(end,1),node39(end,1),node40(end,1),node41(end,1),node42(end,1),node43(end,1)]);
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
%     if (time>node13(count(13),1)&&time<node13(count(13),2))
%         pir_array(13,kimi)=1;
%     else
%         pir_array(13,kimi)=0;
%     end
%     if (time>node14(count(14),1)&&time<node14(count(14),2))
%         pir_array(14,kimi)=1;
%     else
%         pir_array(14,kimi)=0;
%     end
%     if (time>node15(count(15),1)&&time<node15(count(15),2))
%         pir_array(15,kimi)=1;
%     else
%         pir_array(15,kimi)=0;
%     end
%     if (time>node16(count(16),1)&&time<node16(count(16),2))
%         pir_array(16,kimi)=1;
%     else
%         pir_array(16,kimi)=0;
%     end
%     if (time>node17(count(17),1)&&time<node17(count(17),2))
%         pir_array(17,kimi)=1;
%     else
%         pir_array(17,kimi)=0;
%     end
%     if (time>node18(count(18),1)&&time<node18(count(18),2))
%         pir_array(18,kimi)=1;
%     else
%         pir_array(18,kimi)=0;
%     end
%     if (time>node19(count(19),1)&&time<node19(count(19),2))
%         pir_array(19,kimi)=1;
%     else
%         pir_array(19,kimi)=0;
%     end
%     if (time>node20(count(20),1)&&time<node20(count(20),2))
%         pir_array(20,kimi)=1;
%     else
%         pir_array(20,kimi)=0;
%     end
%     if (time>node21(count(21),1)&&time<node21(count(21),2))
%         pir_array(21,kimi)=1;
%     else
%         pir_array(21,kimi)=0;
%     end
%     if (time>node22(count(22),1)&&time<node22(count(22),2))
%         pir_array(22,kimi)=1;
%     else
%         pir_array(22,kimi)=0;
%     end
%     if (time>node23(count(23),1)&&time<node23(count(23),2))
%         pir_array(23,kimi)=1;
%     else
%         pir_array(23,kimi)=0;
%     end
%     if (time>node24(count(24),1)&&time<node24(count(24),2))
%         pir_array(24,kimi)=1;
%     else
%         pir_array(24,kimi)=0;
%     end
%     if (time>node25(count(25),1)&&time<node25(count(25),2))
%         pir_array(25,kimi)=1;
%     else
%         pir_array(25,kimi)=0;
%     end
%     if (time>node26(count(26),1)&&time<node26(count(26),2))
%         pir_array(26,kimi)=1;
%     else
%         pir_array(26,kimi)=0;
%     end
%     if (time>node27(count(27),1)&&time<node27(count(27),2))
%         pir_array(27,kimi)=1;
%     else
%         pir_array(27,kimi)=0;
%     end
%     if (time>node28(count(28),1)&&time<node28(count(28),2))
%         pir_array(28,kimi)=1;
%     else
%         pir_array(28,kimi)=0;
%     end
%     if (time>node29(count(29),1)&&time<node29(count(29),2))
%         pir_array(29,kimi)=1;
%     else
%         pir_array(29,kimi)=0;
%     end
%     if (time>node30(count(30),1)&&time<node30(count(30),2))
%         pir_array(30,kimi)=1;
%     else
%         pir_array(30,kimi)=0;
%     end
%     if (time>node31(count(31),1)&&time<node31(count(31),2))
%         pir_array(31,kimi)=1;
%     else
%         pir_array(31,kimi)=0;
%     end
%     if (time>node32(count(32),1)&&time<node32(count(32),2))
%         pir_array(32,kimi)=1;
%     else
%         pir_array(32,kimi)=0;
%     end
%     if (time>node33(count(33),1)&&time<node33(count(33),2))
%         pir_array(33,kimi)=1;
%     else
%         pir_array(33,kimi)=0;
%     end
%     if (time>node34(count(34),1)&&time<node34(count(34),2))
%         pir_array(34,kimi)=1;
%     else
%         pir_array(34,kimi)=0;
%     end
%     if (time>node35(count(35),1)&&time<node35(count(35),2))
%         pir_array(35,kimi)=1;
%     else
%         pir_array(35,kimi)=0;
%     end
%     if (time>node36(count(36),1)&&time<node36(count(36),2))
%         pir_array(36,kimi)=1;
%     else
%         pir_array(36,kimi)=0;
%     end
%     
%     if (time>node37(count(37),1)&&time<node37(count(37),2))
%         pir_array(37,kimi)=1;
%     else
%         pir_array(37,kimi)=0;
%     end
%     if (time>node38(count(38),1)&&time<node38(count(38),2))
%         pir_array(38,kimi)=1;
%     else
%         pir_array(38,kimi)=0;
%     end
%     if (time>node39(count(39),1)&&time<node39(count(39),2))
%         pir_array(39,kimi)=1;
%     else
%         pir_array(39,kimi)=0;
%     end
%     if (time>node40(count(40),1)&&time<node40(count(40),2))
%         pir_array(40,kimi)=1;
%     else
%         pir_array(40,kimi)=0;
%     end
%     if (time>node41(count(41),1)&&time<node41(count(41),2))
%         pir_array(41,kimi)=1;
%     else
%         pir_array(41,kimi)=0;
%     end
%     if (time>node42(count(42),1)&&time<node42(count(42),2))
%         pir_array(42,kimi)=1;
%     else
%         pir_array(42,kimi)=0;
%     end
%     if (time>node43(count(43),1)&&time<node43(count(43),2))
%         pir_array(43,kimi)=1;
%     else
%         pir_array(43,kimi)=0;
%     end
%     if (time>node44(count(44),1)&&time<node44(count(44),2))
%         pir_array(44,kimi)=1;
%     else
%         pir_array(44,kimi)=0;
%     end
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
%     if(time>node13(count(13),2))
%         if(count(13)<max_count(13))
%             count(13)=count(13)+1;
%         end
%     end
%     if(time>node14(count(14),2))
%         if(count(14)<max_count(14))
%             count(14)=count(14)+1;
%         end
%     end
%     if(time>node15(count(15),2))
%         if(count(15)<max_count(15))
%             count(15)=count(15)+1;
%         end
%     end
%     if(time>node16(count(16),2))
%         if(count(16)<max_count(16))
%             count(16)=count(16)+1;
%         end
%     end
%     if(time>node17(count(17),2))
%         if(count(17)<max_count(17))
%             count(17)=count(17)+1;
%         end
%     end
%     if(time>node18(count(18),2))
%         if(count(18)<max_count(18))
%             count(18)=count(18)+1;
%         end
%     end
%     if(time>node19(count(19),2))
%         if(count(19)<max_count(19))
%             count(19)=count(19)+1;
%         end
%     end
%     if(time>node20(count(20),2))
%         if(count(20)<max_count(20))
%             count(20)=count(20)+1;
%         end
%     end
%     if(time>node21(count(21),2))
%         if(count(21)<max_count(21))
%             count(21)=count(21)+1;
%         end
%     end
%     
%     if(time>node22(count(22),2))
%         if(count(22)<max_count(22))
%             count(22)=count(22)+1;
%         end
%     end
%     
%     
%     if(time>node23(count(23),2))
%         if(count(23)<max_count(23))
%             count(23)=count(23)+1;
%         end
%     end
%     if(time>node24(count(24),2))
%         if(count(24)<max_count(24))
%             count(24)=count(24)+1;
%         end
%     end
%     if(time>node25(count(25),2))
%         if(count(25)<max_count(25))
%             count(25)=count(25)+1;
%         end
%     end
%     if(time>node26(count(26),2))
%         if(count(26)<max_count(26))
%             count(26)=count(26)+1;
%         end
%     end
%     if(time>node27(count(27),2))
%         if(count(27)<max_count(27))
%             count(27)=count(27)+1;
%         end
%     end
%     if(time>node27(count(27),2))
%         if(count(27)<max_count(27))
%             count(27)=count(27)+1;
%         end
%     end
%     if(time>node28(count(28),2))
%         if(count(28)<max_count(28))
%             count(28)=count(28)+1;
%         end
%     end
%     if(time>node29(count(29),2))
%         if(count(29)<max_count(29))
%             count(29)=count(29)+1;
%         end
%     end
%     if(time>node30(count(30),2))
%         if(count(30)<max_count(30))
%             count(30)=count(30)+1;
%         end
%     end
%     if(time>node31(count(31),2))
%         if(count(31)<max_count(31))
%             count(31)=count(31)+1;
%         end
%     end
%     if(time>node32(count(32),2))
%         if(count(32)<max_count(32))
%             count(32)=count(32)+1;
%         end
%     end
%     if(time>node33(count(33),2))
%         if(count(33)<max_count(33))
%             count(33)=count(33)+1;
%         end
%     end
%     if(time>node34(count(34),2))
%         if(count(34)<max_count(34))
%             count(34)=count(34)+1;
%         end
%     end
%     if(time>node35(count(35),2))
%         if(count(35)<max_count(35))
%             count(35)=count(35)+1;
%         end
%     end
%     if(time>node36(count(36),2))
%         if(count(36)<max_count(36))
%             count(36)=count(36)+1;
%         end
%     end
%     if(time>node37(count(37),2))
%         if(count(37)<max_count(37))
%             count(37)=count(37)+1;
%         end
%     end
%     if(time>node38(count(38),2))
%         if(count(38)<max_count(38))
%             count(38)=count(38)+1;
%         end
%     end
%     if(time>node39(count(39),2))
%         if(count(39)<max_count(39))
%             count(39)=count(39)+1;
%         end
%     end
%     if(time>node40(count(40),2))
%         if(count(40)<max_count(40))
%             count(40)=count(40)+1;
%         end
%     end
%     if(time>node41(count(41),2))
%         if(count(41)<max_count(41))
%             count(41)=count(41)+1;
%         end
%     end
%     if(time>node42(count(42),2))
%         if(count(42)<max_count(42))
%             count(42)=count(42)+1;
%         end
%     end
%     if(time>node43(count(43),2))
%         if(count(43)<max_count(43))
%             count(43)=count(43)+1;
%         end
%     end
%     if(time>node44(count(44),2))
%         if(count(44)<max_count(44))
%             count(44)=count(44)+1;
%         end
%     end
    
    
    kimi = kimi+1;
end

% save('washington_1.mat','pir_array');
