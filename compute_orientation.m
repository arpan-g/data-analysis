function[normalized_cordinates,orientation] =compute_orientation(coordinates)
%[x,y]
min_x = min(coordinates(:,1));
max_x = max(coordinates(:,1));
min_y = min(coordinates(:,2));
max_y = max(coordinates(:,2));

diff_x = max_x-min_x;
diff_y = max_y-min_y;

if(diff_x>diff_y)
    orientation = 0;
else
    orientation = 1;
end

normalized_cordinates(:,1)=coordinates(:,1)-min_x;
normalized_cordinates(:,2)=coordinates(:,2)-min_y;


end