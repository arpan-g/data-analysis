%% This script converts raw data obtained from the sensors to an array of pir output.
% raw packet contains pir data, start time, end time of sampling for the
% pir values. The mac id field helps in identifying the sensor node to
% which the data belongs to. The packet also contains packet number which
% helps in identifying duplicate packets and also to detect missing
% packets.
% clear all;
MAC_ID =2;
LAST_BYTE_TIME=14;
PACKET_COUNT = 6;
UINT8_MAX_NUM = 256;
% load()
load('06_07_0_ppl.mat');
% load('11_03_no_sync_node_1.mat');
% load('01_04_3_ppl_data_2.mat');
recPAckets=ones(1,8);
[rows,column] = size(dataArray);
count=ones(1,8);
packet_count = ones(1,8);
overflow_flag  =zeros(1,8);
prev_time = zeros(1,8);
prev_start_time = zeros(1,8);
actual_packet_number = zeros(1,8);
packet_lost_pir = ones(1,32)*-1;
%initialize prev_packet_number to -1;
prev_packet_number = ones(1,8)*-1;
pir=zeros(8,8);
lost_packets= zeros(1,8);
% since the last byte of the start time is same as that of the end time it
% previos_14 is used to overcome anomalies that occur due to which when
% there is a transition of the value.
previou_14=zeros(1,8);
% generate pir,starttime and end time arrays
for i = 1:column
    
    element = dataArray(:,i);
    mac_id = element(MAC_ID);
    packet_number = element(PACKET_COUNT);
    time = combineBytesToDecimal(element,11,12,13,14);
    startTime= combineBytesToDecimal2(element,3,4,5,14,previou_14(mac_id));
    previou_14(mac_id) = element(LAST_BYTE_TIME);
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
                start_time_list(mac_id,count(mac_id)) = start_time_array(time_index);
                endTime(mac_id,count(mac_id)) = end_time_array(time_index);
                time_index = time_index+1;
                count(mac_id) = count(mac_id)+1;
                lost_packets(mac_id)=lost_packets(mac_id)+1;
            end
        end
        start_time_list(mac_id,count(mac_id))=startTime;
        endTime(mac_id,count(mac_id)) = time;
        count(mac_id) = count(mac_id)+1;
        prev_packet_number(mac_id)= packet_number;
        prev_time(mac_id) = time;
        prev_start_time(mac_id) = startTime;
    end
end

timeArrayLength=size(start_time_list);
for i = 1:8
   switch i
        case 1
            time_1 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 2
            time_2 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 3
            time_3 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 4
            time_4 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 5
            time_5 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 6
            time_6 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 7
            time_7 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
        case 8
            time_8 =transpose(TimeArrayGenerator2(start_time_list(i,:),endTime(i,:),count(i)-1));
    end
   
    
end
% clearvars -except time_* pir_array lost_packets
