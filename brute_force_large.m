p1=1:10;
p2=11:20;
p3=21:30;
p4=[31,32,33];
p5=34:43;
R = power_consumption('txt_files\ai_lab\ai_lab_44_4_11_ori.mat');

mP1=perms(p1);
mP2=perms(p2);
mP3=perms(p3);
mP4=perms(p4);
mP5=perms(p5);

lenMP1=numel(mP1);
lenMP2=numel(mP2);
lenMP3=numel(mP3);
lenMP4=numel(mP4);
lenMP5=numel(mP5);
sum_k=0;
count=1;
max=0;
for i = 1:lenMP1
    c1=mP1(i,:);
    for j = 1:lenMP2
        c2=mP2(j,:);
        for k = 1:lenMP3
            c3=mP3(k,:);
            for l = 1:lenMP4
                c4=mP4(l,:);
                for m = 1:lenMP5
                    c5=mP5(m,:);
                    a=[c1,c2,c3,c4,c5];
                    sum_k= R(a(1),a(2))+R(a(1),a(7))+R(a(1),a(8))+R(a(2),a(3))+R(a(2),a(8))+R(a(3),a(9))...
                        +R(a(4),a(5))+R(a(4),a(10))+R(a(4),a(11))+R(a(4),a(12))+R(a(5),a(6))...
                        +R(a(5),a(11))+R(a(5),a(12))+R(a(5),a(13))+R(a(6),a(12))+R(a(6),a(13))...
                        +R(a(7),a(8))+R(a(8),a(9))+R(a(8),a(14))+R(a(9),a(15))+R(a(10),a(11))...
                        +R(a(10),a(16))+R(a(11),a(12))+R(a(11),a(16))+R(a(11),a(17))+R(a(11),a(18))...
                        +R(a(12),a(13))+R(a(12),a(17))+R(a(12),a(18))+R(a(13),a(18))+R(a(14),a(15))...
                        +R(a(14),a(21))+R(a(14),a(22))+R(a(15),a(16))+R(a(15),a(21))+R(a(15),a(22))...
                        +R(a(15),a(23))+R(a(16),a(17))+R(a(16),a(22))+R(a(16),a(23))+R(a(16),a(24))...
                        +R(a(17),a(18))+R(a(17),a(23))+R(a(17),a(24))+R(a(17),a(25))+R(a(18),a(24))...
                        +R(a(18),a(25))+R(a(19),a(20))+R(a(19),a(21))+R(a(20),a(21))+R(a(21),a(22))...
                        +R(a(21),a(27))+R(a(22),a(23))+R(a(22),a(27))+R(a(22),a(28))+R(a(23),a(24))...
                        +R(a(23),a(27))+R(a(23),a(28))+R(a(23),a(29))+R(a(24),a(25))+R(a(24),a(28))...
                        +R(a(24),a(29))+R(a(24),a(30))+R(a(25),a(26))+R(a(25),a(29))+R(a(25),a(30))...
                        +R(a(27),a(28))+R(a(27),a(33))+R(a(28),a(29))+R(a(29),a(30))+R(a(30),a(31))...
                        +R(a(30),a(32))+R(a(31),a(32))+R(a(32),a(37))+R(a(33),a(34))+R(a(33),a(35))...
                        +R(a(33),a(36))+R(a(34),a(35))+R(a(34),a(36))+R(a(35),a(36))+R(a(37),a(39))...
                        +R(a(37),a(40))+R(a(38),a(39))+R(a(38),a(41))+R(a(38),a(42))+R(a(39),a(40))...
                        +R(a(39),a(41))+R(a(39),a(42))+R(a(39),a(43))+R(a(40),a(42))+R(a(40),a(43))...
                        +R(a(41),a(42))+R(a(42),a(43));
                    if(max<sum_k)
                        count=1;
                        arrangement=zeros(1,n);
                        arrangement(count,:)=a;
                        count=count+1;
                        max=sum_k;
                        
                    elseif(abs(max-sum_k)<0.000001)
                        arrangement(count,:)=a;
                        count=count+1;
                    end
                    
                    
                    
                end
            end
        end
    end
end

for i = 1:lenMP5
    c1=mP5(i,:);
    for j = 1:lenMP4
        c2=mP4(j,:);
        for k = 1:lenMP3
            c3=mP3(k,:);
            for l = 1:lenMP2
                c4=mP2(l,:);
                for m = 1:lenMP1
                    c5=mP1(m,:);
                    a=[c1,c2,c3,c4,c5];
                    sum_k= R(a(1),a(2))+R(a(1),a(7))+R(a(1),a(8))+R(a(2),a(3))+R(a(2),a(8))+R(a(3),a(9))...
                        +R(a(4),a(5))+R(a(4),a(10))+R(a(4),a(11))+R(a(4),a(12))+R(a(5),a(6))...
                        +R(a(5),a(11))+R(a(5),a(12))+R(a(5),a(13))+R(a(6),a(12))+R(a(6),a(13))...
                        +R(a(7),a(8))+R(a(8),a(9))+R(a(8),a(14))+R(a(9),a(15))+R(a(10),a(11))...
                        +R(a(10),a(16))+R(a(11),a(12))+R(a(11),a(16))+R(a(11),a(17))+R(a(11),a(18))...
                        +R(a(12),a(13))+R(a(12),a(17))+R(a(12),a(18))+R(a(13),a(18))+R(a(14),a(15))...
                        +R(a(14),a(21))+R(a(14),a(22))+R(a(15),a(16))+R(a(15),a(21))+R(a(15),a(22))...
                        +R(a(15),a(23))+R(a(16),a(17))+R(a(16),a(22))+R(a(16),a(23))+R(a(16),a(24))...
                        +R(a(17),a(18))+R(a(17),a(23))+R(a(17),a(24))+R(a(17),a(25))+R(a(18),a(24))...
                        +R(a(18),a(25))+R(a(19),a(20))+R(a(19),a(21))+R(a(20),a(21))+R(a(21),a(22))...
                        +R(a(21),a(27))+R(a(22),a(23))+R(a(22),a(27))+R(a(22),a(28))+R(a(23),a(24))...
                        +R(a(23),a(27))+R(a(23),a(28))+R(a(23),a(29))+R(a(24),a(25))+R(a(24),a(28))...
                        +R(a(24),a(29))+R(a(24),a(30))+R(a(25),a(26))+R(a(25),a(29))+R(a(25),a(30))...
                        +R(a(27),a(28))+R(a(27),a(33))+R(a(28),a(29))+R(a(29),a(30))+R(a(30),a(31))...
                        +R(a(30),a(32))+R(a(31),a(32))+R(a(32),a(37))+R(a(33),a(34))+R(a(33),a(35))...
                        +R(a(33),a(36))+R(a(34),a(35))+R(a(34),a(36))+R(a(35),a(36))+R(a(37),a(39))...
                        +R(a(37),a(40))+R(a(38),a(39))+R(a(38),a(41))+R(a(38),a(42))+R(a(39),a(40))...
                        +R(a(39),a(41))+R(a(39),a(42))+R(a(39),a(43))+R(a(40),a(42))+R(a(40),a(43))...
                        +R(a(41),a(42))+R(a(42),a(43));
                    if(max<sum_k)
                        count=1;
                        arrangement=zeros(1,n);
                        arrangement(count,:)=a;
                        count=count+1;
                        max=sum_k;
                        
                    elseif(abs(max-sum_k)<0.000001)
                        arrangement(count,:)=a;
                        count=count+1;
                    end
                    
                    
                end
            end
        end
    end
end
