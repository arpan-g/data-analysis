clear;
tick = 0.001;
MAC_ID =4;
PACKET_COUNT = 6;
UINT8_MAX_NUM = 256;
% nameOfDir = 'data';
% listing=dir(nameOfDir);
% matFile = strcat(nameOfDir,'\',listing(3).name);
% load(matFile);
load('data\from_8_to_1_X6_straight.mat');
recPAckets=ones(1,8);
length = size(dataArray);
% min([dataArrat()])
count=ones(1,8);
packet_count = ones(1,8);
overflow_flag  =zeros(1,8);
prev_time = zeros(1,8);
actual_packet_number = zeros(1,8);
packet_lost_pir = ones(1,32)*-1;
prev_packet_number = ones(1,8)*-1;
pac_2 = 0;
%initialize prev_packet_number to -1
pir_3=0;
for i = 1:length(2)
    
    element = dataArray(:,i);
    mac_id = element(MAC_ID);
    packet_number = element(PACKET_COUNT);
    time = combineBytesToDecimal(element,11,12,13,14)*tick;
    %         time = combineBytesToDecimal(element,15,16,17,18)*tick;
    pir =  DecimalTo32bits(element,7,8,9,10);
    if(mac_id==1)
        node_1(:, recPAckets(mac_id))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_1 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_1 = cat(32,pir_1,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_1(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
           
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_1 = cat(32,pir_1,packet_lost_pir);
                transTime_1(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_1(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
        
    elseif(mac_id==2)
       
%         node_2(:,twoCount)=element;
         recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_2 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_2 = cat(32,pir_2,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_2(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
             
            
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_2 = cat(32,pir_2,packet_lost_pir);
                transTime_2(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                
                count(mac_id) = count(mac_id)+1;
                 
            end
        end
        
        transTime_2(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==3)
        %         node_3(:,count(3))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_3 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_3 = cat(32,pir_3,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_3(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_3 = cat(32,pir_3,packet_lost_pir);
                transTime_3(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_3(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==4 )
        %         node_4(:,count(4))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_4 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_4 = cat(32,pir_4,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_4(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_4 = cat(32,pir_4,packet_lost_pir);
                transTime_4(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_4(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==5 )
        %         node_5(:,count(5))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_5 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_5 = cat(32,pir_5,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_5(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_5 = cat(32,pir_5,packet_lost_pir);
                transTime_5(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_5(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==6 )
                node_6(:,recPAckets(mac_id))=element;
                recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_6 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_6 = cat(32,pir_6,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_6(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_6 = cat(32,pir_6,packet_lost_pir);
                transTime_6(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_6(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==7 )
        %         node_7(:,count(7))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_7 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_7 = cat(32,pir_7,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_7(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_7 = cat(32,pir_7,packet_lost_pir);
                transTime_7(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_7(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    elseif(mac_id==8 )
        %         node_8(:,count(8))=element;
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_8 = pir;
            packet_count(mac_id) = packet_number;
        else
            pir_8 = cat(32,pir_8,pir);
        end
        if(prev_packet_number(mac_id)>packet_number)
             overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        transTime_8(count(mac_id),:) = time;
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            time_array = prev_time(mac_id):time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                pir_8 = cat(32,pir_8,packet_lost_pir);
                transTime_8(count(mac_id),:) = time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
            end
        end
        transTime_8(count(mac_id),:) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
    end
end
maxCount = max([count(1) count(2) count(3) count(4) count(5) count(6) count(7) count(8)])

if(count(1)<maxCount)
    transTime_1(count(1):maxCount-1) =  GenerateArray(maxCount,count(1),transTime_1(count(1)-1),time);
end
if(count(2)<maxCount)
    transTime_2(count(2):maxCount-1) =  GenerateArray(maxCount,count(2),transTime_2(count(2)-1),time);
end
if(count(3)<maxCount)
    transTime_3(count(3):maxCount-1) =  GenerateArray(maxCount,count(3),transTime_3(count(3)-1),time);
end

if(count(4)<maxCount)
    transTime_4(count(4):maxCount-1) =  GenerateArray(maxCount,count(4),transTime_4(count(4)-1),time);
end
if(count(5)<maxCount)
    transTime_5(count(5):maxCount-1) =  GenerateArray(maxCount,count(5),transTime_5(count(5)-1),time);
end
if(count(6)<maxCount)
    transTime_6(count(6):maxCount-1) =  GenerateArray(maxCount,count(6),transTime_6(count(6)-1),time);
end
if(count(7)<maxCount)
    transTime_7(count(7):maxCount-1) =  GenerateArray(maxCount,count(7),transTime_7(count(7)-1),time);
end
if(count(8)<maxCount)
    transTime_8(count(8):maxCount-1) =  GenerateArray(maxCount,count(8),transTime_8(count(8)-1),time);
end




minCount = min([count(1) count(2) count(3) count(4) count(5) count(6) count(7) count(8)]);
time_1=TimeArrayGenerator(transTime_1,maxCount);
time_2=TimeArrayGenerator(transTime_2,maxCount);
time_3=TimeArrayGenerator(transTime_3,maxCount);
time_4=TimeArrayGenerator(transTime_4,maxCount);
time_5=TimeArrayGenerator(transTime_5,maxCount);
time_6=TimeArrayGenerator(transTime_6,maxCount);
time_7=TimeArrayGenerator(transTime_7,maxCount);
time_8=TimeArrayGenerator(transTime_8,maxCount);

% pir_1(count(1)+1:maxCount) =  zeros(1,maxCount-count(1));
% pir_2(count(2)+1:maxCount) =  zeros(1,maxCount-count(2));
% pir_3(count(3)+1:maxCount) =  zeros(1,maxCount-count(3));
% pir_4(count(4)+1:maxCount) =  zeros(1,maxCount-count(4));
% pir_5(count(5)+1:maxCount) =  zeros(1,maxCount-count(5));
% pir_6(count(6)+1:maxCount) =  zeros(1,maxCount-count(6));
% pir_7(count(7)+1:maxCount) =  zeros(1,maxCount-count(7));
% pir_8(count(8)+1:maxCount) =  zeros(1,maxCount-count(8));


tempPirA = pir_1(:);
tempPirB = pir_2(:);
tempPirC = pir_3(:);
tempPirD = pir_4(:);
tempPirE = pir_5(:);
tempPirF = pir_6(:);
tempPirG = pir_7(:);
tempPirH = pir_8(:);


tempPirA((count(1)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(1))*32)*(-1);
tempPirB((count(2)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(2))*32)*(-1);
tempPirC((count(3)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(3))*32)*(-1);
tempPirD((count(4)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(4))*32)*(-1);
tempPirE((count(5)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(5))*32)*(-1);
tempPirF((count(6)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(6))*32)*(-1);
tempPirG((count(7)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(7))*32)*(-1);
tempPirH((count(8)-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count(8))*32)*(-1);

pirA= transpose(tempPirA(1:(minCount-1)*32));
pirB= transpose(tempPirB(1:(minCount-1)*32));
pirC= transpose(tempPirC(1:(minCount-1)*32));
pirD= transpose(tempPirD(1:(minCount-1)*32));
pirE= transpose(tempPirE(1:(minCount-1)*32));
pirF= transpose(tempPirF(1:(minCount-1)*32));
pirG= transpose(tempPirG(1:(minCount-1)*32));
pirH= transpose(tempPirH(1:(minCount-1)*32));

