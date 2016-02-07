    count=ones(1,8);
for i = 1:length(2)

    element = dataArray(:,i);
	mac_id = element(MAC_ID);
	switch mac_id
    case 1
        count(mac_id)=count(mac_id)+1;
    case 2
       count(mac_id)=count(mac_id)+1;
    case 3
        count(mac_id)=count(mac_id)+1;
    case 4
	count(mac_id)=count(mac_id)+1;
	 case 5
	count(mac_id)=count(mac_id)+1;
	 case 6
	count(mac_id)=count(mac_id)+1;
	 case 7
	count(mac_id)=count(mac_id)+1;
	 case 8
	count(mac_id)=count(mac_id)+1;
end
end