% Plots strength-duration relationship for multiple pulse shapes.

close all
clear all

figure
hold all

% 1 ms duration monopolar cathodal pulse strength-distance relationship
% extracted from threshold map 
load('pulsewidth1.mat');

filename='filemat9pulsecomp.dat';
filename2='filemat9pulsecompb.dat';

%Plot 1 ms duration monopolar cathodal pulse
[pathstr, fname, ext] = fileparts(filename) ;
plot(1:1:120, flipud(pulsewidth1), ':k')

% Plot 0.2 ms duration monopolar cathodal pulse
importfile(filename, 1)
plot(abs(nonzeros(data(:,2)))-525, abs(nonzeros(data(:,3)))*1000, '--r')

% Plot 0.2 ms duration bipolar pulse
importfile(filename2, 1)
plot(abs(nonzeros(data(:,2)))-525, abs(nonzeros(data(:,3)))*1000, '-k')

