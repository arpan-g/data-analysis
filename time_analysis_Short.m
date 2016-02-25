clear;
tick = 0.001;
MAC_ID =2;
PACKET_COUNT = 6;
UINT8_MAX_NUM = 256;
load('23_02.mat');
recPAckets=ones(1,8);
length = size(dataArray);
count=ones(1,8);
packet_count = ones(1,8);
overflow_flag  =zeros(1,8);
prev_time = zeros(1,8);
prev_start_time = zeros(1,8);
actual_packet_number = zeros(1,8);
packet_lost_pir = ones(1,32)*0;
prev_packet_number = ones(1,8)*-1;%initialize prev_packet_number to -1
pac_2 = 0;
pir=zeros(8,8);
lost_packets= zeros(1,8);
% generate pir,starttime and end time arrays
for i = 1:length(2)
    
    element = dataArray(:,i);
    mac_id = element(MAC_ID);
    packet_number = element(PACKET_COUNT);
    time = combineBytesToDecimal(element,11,12,13,14);
    startTime= combineBytesToDecimal(element,3,4,5,14);
    %     time = combineBytesToDecimal(element,15,16,17,18)*tick;
    pir =  DecimalTo32bits(element,7,8,9,10);
    if(prev_packet_number(mac_id)~=packet_number)
        recPAckets(mac_id)=recPAckets(mac_id)+1;
        if(count(mac_id)==1)
            pir_array(mac_id,1:32) = pir;
            packet_count(mac_id) = packet_number;
        else
            
             pir_array(mac_id,(count(mac_id)-1)*32+1:count(mac_id)*32) = pir;
        end
        if(prev_packet_number(mac_id)>packet_number)
            overflow_flag(mac_id) =actual_packet_number(mac_id)+1;
        end
        actual_packet_number(mac_id) = overflow_flag(mac_id) + packet_number -(packet_count(mac_id)*(overflow_flag(mac_id)==0));
        
        if(actual_packet_number(mac_id)>count(mac_id))
            %packet_lost
            packets_lost=actual_packet_number(mac_id)-count(mac_id);
            start_time_diff = (startTime - prev_start_time(mac_id))/(packets_lost+1);
            end_time_diff = (time-prev_time(mac_id))/(packets_lost+1);
            start_time_array = prev_start_time(mac_id):start_time_diff:startTime;
            end_time_array = prev_time(mac_id):end_time_diff:time;
            time_index = 2;
            while(count((mac_id))<actual_packet_number(mac_id))
                
                pir_array(mac_id,(count(mac_id)-1)*32+1:count(mac_id)*32) = pir;
                start_time(mac_id,count(mac_id)) = start_time_array(time_index);
                endTime(mac_id,count(mac_id)) = end_time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
                lost_packets(mac_id)=lost_packets(mac_id)+1;
            end
        end
        start_time(mac_id,count(mac_id))=startTime;
        endTime(mac_id,count(mac_id)) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
        prev_start_time(mac_id) = startTime;
    end
end
% %create sample every 100ms

timeArrayLength=size(start_time);

for j = 1:timeArrayLength(2)
    minDiff = min(endTime(:,j));
    maxDiff = max(endTime(:,j));
    difference(j)=maxDiff-minDiff;
    if((maxDiff-minDiff)<3500)
        start_index = j;
        break;
    end
end