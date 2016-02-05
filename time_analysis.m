clear;
tick = 0.001;
% nameOfDir = 'data';
% listing=dir(nameOfDir);
% matFile = strcat(nameOfDir,'\',listing(3).name);
% load(matFile);
load('test.mat');

length = size(dataArray);
% min([dataArrat()])
count_1 =1;count_2 =1;count_3 =1;count_4 =1;count_5 =1;count_6 =1;count_7 =1;count_8 =1;

for i = 1:length(2)
    
    element = dataArray(:,i);
    time = combineBytesToDecimal(element,13,14,15,16)*tick;
%         time = combineBytesToDecimal(element,15,16,17,18)*tick;
    pir =  DecimalTo32bits(element,9,10,11,12);
    if(element(6)==1)
        %         node_1(:,count_1)=element;
        transTime_1(count_1,:) = time;
        if(count_1==1)
            pir_1 = pir;
        else
            pir_1 = cat(32,pir_1,pir);
        end
        count_1 = count_1+1;
        
    elseif(element(6)==2)
        %         node_2(:,count_2)=element;
        transTime_2(count_2,:) = time;
        if(count_2==1)
            pir_2 = pir;
        else
            pir_2 = cat(32,pir_2,pir);
        end
        count_2 = count_2+1;
    elseif(element(6)==3)
        %         node_3(:,count_3)=element;
        transTime_3(count_3,:) = time;
        if(count_3==1)
            pir_3 = pir;
        else
            pir_3 = cat(32,pir_3,pir);
        end
        count_3 = count_3+1;
    elseif(element(6)==4 )
        %         node_4(:,count_4)=element;
        transTime_4(count_4,:) = time;
        if(count_4==1)
            pir_4 = pir;
        else
            pir_4 = cat(32,pir_4,pir);
        end
        count_4 = count_4+1;
    elseif(element(6)==5 )
        %         node_5(:,count_5)=element;
        transTime_5(count_5,:) = time;
        if(count_5==1)
            pir_5 = pir;
        else
            pir_5 = cat(32,pir_5,pir);
        end
        count_5 = count_5+1;
    elseif(element(6)==6 )
        %         node_6(:,count_6)=element;
        transTime_6(count_6,:) = time;
        if(count_6==1)
            pir_6 = pir;
        else
            pir_6 = cat(32,pir_6,pir);
        end
        count_6 = count_6+1;
    elseif(element(6)==7 )
        %         node_7(:,count_7)=element;
        transTime_7(count_7,:) = time;
        if(count_7==1)
            pir_7 = pir;
        else
            pir_7 = cat(32,pir_7,pir);
        end
        count_7 = count_7+1;
    elseif(element(6)==8 )
        %         node_8(:,count_8)=element;
        transTime_8(count_8,:) = time;
        if(count_8==1)
            pir_8 = pir;
        else
            pir_8 = cat(32,pir_8,pir);
        end
        count_8 = count_8+1;
    end
end
maxCount = max([count_1 count_2 count_3 count_4 count_5 count_6 count_7 count_8]);

if(count_1<maxCount)
    transTime_1(count_1:maxCount-1) =  GenerateArray(maxCount,count_1,transTime_1(count_1-1),time);
end
if(count_2<maxCount)
    transTime_2(count_2:maxCount-1) =  GenerateArray(maxCount,count_2,transTime_2(count_2-1),time);
end
if(count_3<maxCount)
    transTime_3(count_3:maxCount-1) =  GenerateArray(maxCount,count_3,transTime_3(count_3-1),time);
end

if(count_4<maxCount)
    transTime_4(count_4:maxCount-1) =  GenerateArray(maxCount,count_4,transTime_4(count_4-1),time);
end
if(count_5<maxCount)
    transTime_5(count_5:maxCount-1) =  GenerateArray(maxCount,count_5,transTime_5(count_5-1),time);
end
if(count_6<maxCount)
    transTime_6(count_6:maxCount-1) =  GenerateArray(maxCount,count_6,transTime_6(count_6-1),time);
end
if(count_7<maxCount)
    transTime_7(count_7:maxCount-1) =  GenerateArray(maxCount,count_7,transTime_7(count_7-1),time);
end
if(count_8<maxCount)
    transTime_8(count_8:maxCount-1) =  GenerateArray(maxCount,count_8,transTime_8(count_8-1),time);
end


% 
% 
% transTime_2(count_2+1:maxCount) =  zeros(1,maxCount-count_2);
% transTime_3(count_3+1:maxCount) =  zeros(1,maxCount-count_3);
% transTime_4(count_4+1:maxCount) =  zeros(1,maxCount-count_4);
% transTime_5(count_5+1:maxCount) =  zeros(1,maxCount-count_5);
% transTime_6(count_6+1:maxCount) =  zeros(1,maxCount-count_6);
% transTime_7(count_7+1:maxCount) =  zeros(1,maxCount-count_7);
% transTime_8(count_8+1:maxCount) =  zeros(1,maxCount-count_8);

minCount = min([count_1 count_2 count_3 count_4 count_5 count_6 count_7 count_8]);
time_1=TimeArrayGenerator(transTime_1,maxCount);
time_2=TimeArrayGenerator(transTime_2,maxCount);
time_3=TimeArrayGenerator(transTime_3,maxCount);
time_4=TimeArrayGenerator(transTime_4,maxCount);
time_5=TimeArrayGenerator(transTime_5,maxCount);
time_6=TimeArrayGenerator(transTime_6,maxCount);
time_7=TimeArrayGenerator(transTime_7,maxCount);
time_8=TimeArrayGenerator(transTime_8,maxCount);

% pir_1(count_1+1:maxCount) =  zeros(1,maxCount-count_1);
% pir_2(count_2+1:maxCount) =  zeros(1,maxCount-count_2);
% pir_3(count_3+1:maxCount) =  zeros(1,maxCount-count_3);
% pir_4(count_4+1:maxCount) =  zeros(1,maxCount-count_4);
% pir_5(count_5+1:maxCount) =  zeros(1,maxCount-count_5);
% pir_6(count_6+1:maxCount) =  zeros(1,maxCount-count_6);
% pir_7(count_7+1:maxCount) =  zeros(1,maxCount-count_7);
% pir_8(count_8+1:maxCount) =  zeros(1,maxCount-count_8);


tempPirA = pir_1(:);
tempPirB = pir_2(:);
tempPirC = pir_3(:);
tempPirD = pir_4(:);
tempPirE = pir_5(:);
tempPirF = pir_6(:);
tempPirG = pir_7(:);
tempPirH = pir_8(:);


tempPirA((count_1-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_1)*32)*(-1);
tempPirB((count_2-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_2)*32)*(-1);
tempPirC((count_3-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_3)*32)*(-1);
tempPirD((count_4-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_4)*32)*(-1);
tempPirE((count_5-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_5)*32)*(-1);
tempPirF((count_6-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_6)*32)*(-1);
tempPirG((count_7-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_7)*32)*(-1);
tempPirH((count_8-1)*32+1:(maxCount-1)*32) =  ones(1,(maxCount-count_8)*32)*(-1);

pirA= transpose(tempPirA);
pirB= transpose(tempPirB);
pirC= transpose(tempPirC);
pirD= transpose(tempPirD);
pirE= transpose(tempPirE);
pirF= transpose(tempPirF);
pirG= transpose(tempPirG);
pirH= transpose(tempPirH);


