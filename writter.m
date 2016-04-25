fileID_local = fopen('Z:\01_TUD\00_Thesis\java_analysis\java-analysis\Tree2Grid\corr.txt','w');
power_consumption
for i = 1:8
    fprintf(fileID_local,'%1.2f,%1.2f,%1.2f,%1.2f,%1.2f,%1.2f,%1.2f,%1.2f\n',R(i,:));
end
fclose(fileID_local);
