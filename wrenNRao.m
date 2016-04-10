load('Z:\01_TUD\00_Thesis\data-analysis\long_tests\pir_data\pir_17_03.mat');
for i = 1:8
    for j = 1:8
        R(i,j)=similar_data(newPirArray(i,:),newPirArray(j,:),1);
    end
end
for i=1:8
    norm(i)=R(i,i);
end

        for i = 1:8
            for j= 1:8
                R(i,j)=R(i,j)/norm(i);
            end
        end