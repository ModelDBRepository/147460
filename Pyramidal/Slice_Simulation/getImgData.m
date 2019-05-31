function [imgData]=getImgData(data)

numtrials=find(data(:,1),1, 'last');
xcoord=round(data(1:numtrials,1));
ycoord=round(data(1:numtrials,2));

%rounds values to closest 25 to fix offsets and 1.3^10 notation from neuron
xcoord=round(xcoord/25)*25;
ycoord=round(ycoord/25)*25;
amp=data(1:numtrials,3);
clear data

min(xcoord)
min(ycoord)

%I used a small offset in Neuron because I was getting division by zero
%errors, this gets rid of that for analysis purposes
xrange=min(xcoord):25:max(xcoord);
yrange=min(ycoord):25:max(ycoord);

%creates amplitude array filled with all zeroes
amplitude = zeros(length(yrange), length(xrange));
amplitude2 = zeros(length(yrange)+2, length(xrange)+2);

%for every AP that is recorded it puts the current that was required
%at each X Y into the array amplitude
for i=1:1:length(xcoord)
    amplitude(find(yrange == ycoord(i)), find(xrange == xcoord(i))) = amp(i);
    1;
end

amplitude2(2:size(amplitude,1)+1, 2:size(amplitude,2)+1)=amplitude;


%replaces any zeroes with filler (-.135)
amplitude2(amplitude2 == 0) = -.135;



%Turns the stimulation amplitude into a positive whole number so it can be
%used as a colormap index
imageamp=amplitude2*-1000;

%Interpolates from a 25 um grid to a 1um grid
[X, Y] = meshgrid(1:1:size(imageamp,2), 1:1:size(imageamp,1));
imgData = imageamp;
[XI,YI] = meshgrid(1:0.04:size(imageamp,2), 1:0.04:size(imageamp,1));
ZI = interp2(X,Y,imgData,XI,YI);

%Plots original data
figure
hold on
image(imgData)
axis image
set(gca,'XTickLabel','')
set(gca, 'YTickLabel', '')
M=colormap(jet(135));
Mflip=flipud(M);
for i=126:1:135
    Mflip(i,:)=[0,0,0];
end
colormap(Mflip);
h=colorbar;
set(h, 'ytick', (0:10:135)) % Assign positions of ticks
labels = char('5','15','25','35','45','55','65','75', '85', '95', '105','115', '125', '>125'); %
set(h, 'yticklabel', labels) % Assign tick labels.
set(get(h,'ylabel'),'String', 'Stimulation Amplitude (\muA)');


%Plots interpolated data with colorbar corresponding to stimulation
%amplitude that resulted in AP generation
figure
hold on
image(ZI)
axis image
set(gca,'XTickLabel','')
set(gca, 'YTickLabel', '')
M=colormap(jet(135));
Mflip=flipud(M);
for i=126:1:135
    Mflip(i,:)=[0,0,0];
end
colormap(Mflip);
h=colorbar;
set(h, 'ytick', (0:10:135)) % Assign positions of ticks
labels = char('5','15','25','35','45','55','65','75', '85', '95', '105','115', '125', '>125'); %
set(h, 'yticklabel', labels) % Assign tick labels.
set(get(h,'ylabel'),'String', 'Stimulation Amplitude (\muA)');
