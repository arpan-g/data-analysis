clear;
load('data.mat');
% load('data_slots.mat');
freq = 10.6;
length = size(dataArray);
% min([dataArrat()])
count1=1;
count2=1;
count3=1;
count4=1;
count5=1;
count6=1;

 for i = 1:length(2)
    element = dataArray(:,i);
    if(element(4)==1)
        node1(:,count1)=element;
        transTime1(count1,:) = (bi2de(de2bi(node1(11,count1),16)+de2bi(bitsll(node1(12,count1),8),16))/freq)*ones(1,32);
        if(count1==1)
        tempPir1=de2bi(node1(7,count1),32)+de2bi(bitsll(node1(8,count1),8),32)+de2bi(bitsll(node1(9,count1),16),32)+de2bi(bitsll(node1(10,count1),24),32);
        pir1 = fliplr(tempPir1);
        else
        tempPir1=de2bi(node1(7,count1),32)+de2bi(bitsll(node1(8,count1),8),32)+de2bi(bitsll(node1(9,count1),16),32)+de2bi(bitsll(node1(10,count1),24),32);
        flipPir1 = fliplr(tempPir1);   
        pir1 = cat(32,pir1,flipPir1);
        end
        count1 = count1+1;
        
    elseif(element(4)== 2)
        node2(:,count2)=element;
              
        transTime2(count2,:) = (bi2de(de2bi(node2(11,count2),16)+de2bi(bitsll(node2(12,count2),8),16))/freq)*ones(1,32);
         if(count2==1)
            tempPir2 = de2bi(node2(7,count2),32)+de2bi(bitsll(node2(8,count2),8),32)+de2bi(bitsll(node2(9,count2),16),32)+de2bi(bitsll(node2(10,count2),24),32);
            pir2 = fliplr(tempPir2);
         else
             tempPir2 = de2bi(node2(7,count2),32)+de2bi(bitsll(node2(8,count2),8),32)+de2bi(bitsll(node2(9,count2),16),32)+de2bi(bitsll(node2(10,count2),24),32);
             flipPir2=fliplr(tempPir2);
            pir2 = cat(32,pir2,flipPir2);
         end
        count2 = count2+1;
    elseif(element(4)== 3)
        node3(:,count3)=element;
        transTime3(count3,:) = (bi2de(de2bi(node3(11,count3),16)+de2bi(bitsll(node3(12,count3),8),16))/freq)*ones(1,32);
        if(count3==1)
            pir3=de2bi(node3(7,count3),32)+de2bi(bitsll(node3(8,count3),8),32)+de2bi(bitsll(node3(9,count3),16),32)+de2bi(bitsll(node3(10,count3),24),32);
        else
        pir3 = cat(32,pir3,de2bi(node3(7,count3),32)+de2bi(bitsll(node3(8,count3),8),32)+de2bi(bitsll(node3(9,count3),16),32)+de2bi(bitsll(node3(10,count3),24),32));
        end
        count3=count3+1;
    
     elseif(element(4)== 4)
        node4(:,count4)=element;
        transTime4(count4,:) = (bi2de(de2bi(node4(11,count4),16)+de2bi(bitsll(node4(12,count4),8),16))/freq)*ones(1,32);
        if(count4==1)
            pir4=de2bi(node4(7,count4),32)+de2bi(bitsll(node4(8,count4),8),32)+de2bi(bitsll(node4(9,count4),16),32)+de2bi(bitsll(node4(10,count4),24),32);
        else
        pir4 = cat(32,pir4,de2bi(node4(7,count4),32)+de2bi(bitsll(node4(8,count4),8),32)+de2bi(bitsll(node4(9,count4),16),32)+de2bi(bitsll(node4(10,count4),24),32));
        end
        count4=count4+1;
         elseif(element(4)== 5)
        node5(:,count5)=element;
        transTime5(count5,:) = (bi2de(de2bi(node5(11,count5),16)+de2bi(bitsll(node5(12,count5),8),16))/freq)*ones(1,32);
        if(count5==1)
            pir5=de2bi(node5(7,count5),32)+de2bi(bitsll(node5(8,count5),8),32)+de2bi(bitsll(node5(9,count5),16),32)+de2bi(bitsll(node5(10,count5),24),32);
        else
        pir5 = cat(32,pir5,de2bi(node5(7,count5),32)+de2bi(bitsll(node5(8,count5),8),32)+de2bi(bitsll(node5(9,count5),16),32)+de2bi(bitsll(node5(10,count5),24),32));
        end
        count5=count5+1;
         elseif(element(4)== 6)
        node6(:,count6)=element;
        transTime6(count6,:) = (bi2de(de2bi(node6(11,count6),16)+de2bi(bitsll(node6(12,count6),8),16))/freq)*ones(1,32);
        if(count6==1)
            pir6=de2bi(node6(7,count6),32)+de2bi(bitsll(node6(8,count6),8),32)+de2bi(bitsll(node6(9,count6),16),32)+de2bi(bitsll(node6(10,count6),24),32);
        else
        pir6 = cat(32,pir6,de2bi(node6(7,count6),32)+de2bi(bitsll(node6(8,count6),8),32)+de2bi(bitsll(node6(9,count6),16),32)+de2bi(bitsll(node6(10,count6),24),32));
        end
        count6=count6+1;
 end
    end
 
 
 numElements = min([count1,count2,count3,count4,count5,count6]);
 
 tempTime1 = transpose(transTime1);
 tempTime2 = transpose(transTime2);
 tempTime3 = transpose(transTime3);
 tempTime4 = transpose(transTime4);
 tempTime5 = transpose(transTime5);
 tempTime6 = transpose(transTime6);
 
 
 time1 = tempTime1(:);
 time2 = tempTime2(:);
 time3 = tempTime3(:);
 time4 = tempTime4(:);
 time5 = tempTime5(:);
 time6 = tempTime6(:);
 
 maxElements=(numElements-1)*32;
 
 timeA = time1(1:maxElements);
 timeB = time2(1:maxElements);
 timeC = time3(1:maxElements);
 timeD = time4(1:maxElements);
 timeE = time5(1:maxElements);
 timeF = time6(1:maxElements);
 
 tempPirA = pir1(:);
 tempPirB = pir2(:);
 tempPirC = pir3(:);
 tempPirD = pir4(:);
 tempPirE = pir5(:);
 tempPirF = pir6(:);
 
 pirA = tempPirA(1:(numElements-1)*32);
 pirB = tempPirB(1:(numElements-1)*32);
 pirC = tempPirC(1:(numElements-1)*32);
 pirD = tempPirD(1:(numElements-1)*32);
 pirE = tempPirE(1:(numElements-1)*32);
 pirF = tempPirF(1:(numElements-1)*32);
 
 data = [pirA,pirB,pirC,pirD,pirE,pirF,timeA,timeB,timeC,timeD,timeE,timeF]; 
 
