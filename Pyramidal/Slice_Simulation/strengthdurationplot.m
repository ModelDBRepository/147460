% Plots strength-duration relationship for a Layer II Broad pyramidal
% neuron.  Electrode is located at varying distances from an isolated
% axonal branch.

close all
clear all

filename='filemat9strdura.dat';
filename2='filemat9strdurb.dat';
filename3='filemat9strdurc.dat';
filename4='filemat9strdurd.dat';

figure
hold all

%Import strength-duration information generated in NEURON
importfile(filename2, 1)
plot(nonzeros(data(:,5)), nonzeros(abs(data(:,3))*1000), 'k')

importfile(filename3, 1)
plot(nonzeros(data(:,5)), nonzeros(abs(data(:,3))*1000), 'r')

importfile(filename4, 1)
plot(nonzeros(data(:,5)), nonzeros(abs(data(:,3))*1000), ':k')

% Mark chronaxie time for each 
plot(0.145, 62, 'ro')
plot(0.13, 28, 'ro')
plot(0.085, 10, 'ro')

legend('25 \mum', '50 \mum', '75 \mum')
title('Strength-Duration Relationship')
xlabel('Duration (ms)')
ylabel('Stimulation Amplitude (\muA)')
axis([0 2 0 120])






