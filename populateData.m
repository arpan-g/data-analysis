function [ node ] = populateData( light,temp,audio,voltage,time,packet_number,rssi )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        node(1)=light;
        node(2)=temp;
        node(3)=audio;
        node(4)=time;
        node(5)=packet_number;
        node(6)=voltage;
        node(7)=rssi;
end

