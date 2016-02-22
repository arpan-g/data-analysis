a=[pirA ;pirB; pirC; pirD;pirE; pirF; pirG;pirH];
WINDOW=64;
OVERLAP=32;
column_index=1;
length=size(a);
count=1;
for i = 1:32:length(2)
    
    if(i+64<length(2))
        
        calcEnergy(1,count)= sum(a(1,i:i+64));
        calcEnergy(2,count)= sum(a(2,i:i+64));
        calcEnergy(3,count)= sum(a(3,i:i+64));
        calcEnergy(4,count)= sum(a(4,i:i+64));
        calcEnergy(5,count)= sum(a(5,i:i+64));
        calcEnergy(6,count)= sum(a(6,i:i+64));
        calcEnergy(7,count)= sum(a(7,i:i+64));
        calcEnergy(8,count)= sum(a(8,i:i+64));
        count = count+1;
    end
    
end

energyLength=size(calcEnergy);
for i = 1:8
   
    temp(i,:) = abs(fft(calcEnergy(i,:),512));
    fftData(i,:)=temp(i,:)/temp(i,1);

    
end
x=256:509;
y=[1,8];
% imagesc(x,y,fftData)
% colorbar();

% step(indexMatrix);
