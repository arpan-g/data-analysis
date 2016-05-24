function[radius] = computePIRRadius(height,angle)
%height in meters
%angle in degree
theta=degtorad(angle);
radius=tan(theta)*height;
end