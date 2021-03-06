a=[pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
WINDOW=32;
OVERLAP=16;
column_index=1;
length=size(a);
count=1;
for i = 1:OVERLAP:length(2)
    
    if(i+WINDOW<length(2))
        
        calcEnergy(1,count)= sum(a(1,i:i+WINDOW));
        calcEnergy(2,count)= sum(a(2,i:i+WINDOW));
        calcEnergy(3,count)= sum(a(3,i:i+WINDOW));
        calcEnergy(4,count)= sum(a(4,i:i+WINDOW));
        calcEnergy(5,count)= sum(a(5,i:i+WINDOW));
        calcEnergy(6,count)= sum(a(6,i:i+WINDOW));
        calcEnergy(7,count)= sum(a(7,i:i+WINDOW));
        calcEnergy(8,count)= sum(a(8,i:i+WINDOW));
        count = count+1;
    end
    
end

energyLength=size(calcEnergy);
zone(1,:)= calcEnergy(1,:)+ calcEnergy(2,:);
zone(2,:)= calcEnergy(3,:)+ calcEnergy(4,:);
zone(3,:)= calcEnergy(5,:)+ calcEnergy(6,:);
zone(4,:)= calcEnergy(7,:)+ calcEnergy(8,:);
for i = 1:energyLength(2)
[value,index] = max(zone(:,i));
region(i) = index;
end
for i = 1:8
   
    temp(i,:) = abs(fft(calcEnergy(i,:),512));
    fftData(i,:)=temp(i,:)/temp(i,1);

    
end
x=256:509;
y=[1,8];

% imagesc(calcEnergy);
% clac
% colorbar();
plot(calcEnergy(2,:));
hold on;
plot(calcEnergy(3,:));
xlabel('timeX3.2s');ylabel('sum');
legend('2','3');

% stairs(region);
