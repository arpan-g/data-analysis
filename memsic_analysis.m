
<<<<<<< HEAD
file = 'long_tests\memsic_data\17_03.report';
=======

file = 'long_tests\memsic_data\17_03.report';


>>>>>>> 227dc789a244dcfb44ab8e6ee452f7edbc30e584
[c1 c2 c3 c4 c5 c6 c7 c8 c9]= textread(file, '%f %u %u %u %u %u %u %u %u', 'commentstyle', 'shell');
% data = [c2 c3 c4 c5];
% mac_id packet_num time light temp audio sync
receivedPackets=ones(1,8);
length = size(c1);
count=ones(1,8);
dummy_node = ones(1,4);
packets=zeros(1,8);
node1=zeros(6,10);
node2=zeros(6,10);
node3=zeros(6,10);
node4=zeros(6,10);
node5=zeros(6,10);
node6=zeros(6,10);
node7=zeros(6,10);
node8=zeros(6,10);
counter = 1;
for i = 1:length(1)
    mac_id = c2(i);
    packet_number = c3(i);
    
    time = c4(i);
    light = c5(i);
    temp = c6(i);
    audio = c7(i);
    voltage = c8(i);
    if(packets(mac_id)~=packet_number)
        
       receivedPackets(mac_id)=receivedPackets(mac_id)+1;
        switch mac_id
            case 1
                diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node1(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
                counter=counter+1;
               
                else
                    
                    while(diff>=1)
                    node1(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
                 
            case 2
              diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node2(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node2(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
            case 3
                  diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node3(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node3(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
                
            case 4
                   diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node4(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node4(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
            case 5
                 diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node5(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node5(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
            case 6
                 diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node6(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node6(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
            case 7
    diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node7(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node7(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
            case 8
                   diff=packet_number-packets(mac_id);
                if(count(mac_id)==1)
                node8(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number);
                count(mac_id)=count(mac_id)+1;
               counter=counter+1;
                else
                    
                    while(diff>=1)
                    node8(:,count(mac_id))= populateData(light,temp,audio,voltage,time,packet_number-diff+1);
                    diff=diff-1;
                    counter=counter+1;
                    count(mac_id)=count(mac_id)+1;
                    end
                end
        end
         packets(mac_id)=packet_number;
  
    end
end