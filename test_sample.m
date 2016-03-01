
clear sample;
figure1 = figure;
maxTime(1)=max(time_1);
maxTime(2)=max(time_2);
maxTime(3)=max(time_3);
maxTime(4)=max(time_4);
maxTime(5)=max(time_5);
maxTime(6)=max(time_6);
maxTime(7)=max(time_7);
maxTime(8)=max(time_8);

minTime(1)=min(time_1);
minTime(2)=min(time_2);
minTime(3)=min(time_3);
minTime(4)=min(time_4);
minTime(5)=min(time_5);
minTime(6)=min(time_6);
minTime(7)=min(time_7);
minTime(8)=min(time_8);

MAXLIMIT = min(maxTime);
start_time=max(minTime);
sample_pir=zeros(16,1);
len_1=size(time_1);
len_2=size(pir_array);
limit=min(len_1(2),len_2(2));
% sample=zeros(16,148448);
sample(1,:)= pir_array(1,1:limit);
sample(2,:)= time_1;
% sample(3,:)= pir_array(2,1:limit);
% sample(4,:)= time_2;
index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-sample(2,index);
    if(abs(diff(count))<100)
        sample_pir(1,count)=sample(1,index);
        sample_pir(2,count) = time;
        index = index+1;
        time=time+100;    
        count=count+1;
        x=x+1;       
     else
        sample_pir(2,count) = time;
        y=y+1;
        if count==1
            sample_pir(1,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(1,count)=sample_pir(1,count-1);
            time = time+100;
            count=count+1;
            
        else
            sample_pir(1,count)=sample_pir(1,count-1);
            index = index+1;
        end
    end
    
end
len_1=size(time_2);
% len_2=size(pir_array);
clear sample;
limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(2,1:limit);
% sample(1,:)= pirB;
% sample(2,:)= time_2;
index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_2(1,index);
    if(abs(diff(count))<100)
        sample_pir(3,count)=sample(1,index);
        sample_pir(4,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(4,count) = time;
        y=y+1;
        if count==1
            sample_pir(3,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(3,count)=sample_pir(1,count-1);
            sample_pir(4,count)=time;
            time = time+100;
            count=count+1;
            
        else
            sample_pir(3,count)=sample_pir(3,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=5;
ARRAY_SLOT_TIME=6;
len_1=size(time_3);
% len_2=size(pir_array);
limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(3,1:limit);
% sample(1,:)= pirC;
% sample(2,:)= time_2;
index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_3(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=7;
ARRAY_SLOT_TIME=8;
PIR_NODE=4;
len_1=size(time_4);

limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(PIR_NODE,1:limit);
% sample(1,:)= pirD;

index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_4(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=9;
ARRAY_SLOT_TIME=10;
PIR_NODE=5;
len_1=size(time_5);

limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(PIR_NODE,1:limit);
% sample(1,:)= pirE;

index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_5(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=11;
ARRAY_SLOT_TIME=12;
PIR_NODE=6;
len_1=size(time_6);

limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(PIR_NODE,1:limit);
% sample(1,:)= pirF;

index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_6(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=13;
ARRAY_SLOT_TIME=14;
PIR_NODE=7;
len_1=size(time_7);

limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(PIR_NODE,1:limit);
% sample(1,:)= pirG;

index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_7(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
clear sample;
ARRAY_SLOT_PIR=15;
ARRAY_SLOT_TIME=16;
PIR_NODE=8;
len_1=size(time_8);

limit=min(len_1(2),len_2(2));
sample(1,:)= pir_array(PIR_NODE,1:limit);
% sample(1,:)= pirH;

index=1;
count=1;
time = start_time;
x=1;
y=1;
while(time<MAXLIMIT && index<limit)
    diff(count)=time-time_8(1,index);
    if(abs(diff(count))<100)
        sample_pir(ARRAY_SLOT_PIR,count)=sample(1,index);
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        index = index+1;
        count=count+1;
        time=time+100;       
        x=x+1;       
     else
        sample_pir(ARRAY_SLOT_TIME,count) = time;
        y=y+1;
        if count==1
            sample_pir(ARRAY_SLOT_PIR,count)=0;
            index = index+1;
        elseif(diff(count)<0)
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
			
            time = time+100;
            count=count+1;
            
        else
            sample_pir(ARRAY_SLOT_PIR,count)=sample_pir(ARRAY_SLOT_PIR,count-1);
            index = index+1;
        end
    end
   
end
% x=[sample_pir(2,:);sample_pir(4,:);sample_pir(6,:);sample_pir(8,:);sample_pir(10,:);sample_pir(12,:);sample_pir(14,:);sample_pir(16,:)];
% y = [1,8];
newPirArray=[sample_pir(1,:);sample_pir(3,:);sample_pir(5,:);sample_pir(7,:);sample_pir(9,:);sample_pir(11,:);sample_pir(13,:);sample_pir(15,:)];
imagesc(newPirArray);
xlabel('time(x0.1s)');
ylabel('nodeId');
colorbar();
% saveas(figure1,'29_02/pir_output.png')
