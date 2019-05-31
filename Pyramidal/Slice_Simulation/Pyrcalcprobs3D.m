function [probabilities, distsa, amps]=Pyrcalcprobs3D(ZI, filename, iter)
% Called by PyrPlotSimpleComplete.m

% Constructs a 3D slab of artificial cortex containing a single cell type.
% An electrode is then passed through the slice, and the number and
% location of neurons recruited by stimulation at each location are
% tabulated.  Additionally, videos of recruitment are generated.
% This version should be used for cell types 11 and 15

cells=struct;

switch filename
    % Defines the number of neurons found within a 1 mm by 1 mm slab of
    % cortex for each cell type.  The scale factor of 9 increases the slab
    % to 3 mm by 3 mm.
    
    case 'filemat11.dat'
        numcells2=0;
        numcells3=8000*9;
        numcells4=0;
        numcells5=0;
        numcells6=0;
        xcenter=2700+25;
        ycenter= 1000+25;
    case 'filemat15.dat'
        numcells2=0;
        numcells3=0;
        numcells4=0;
        numcells5=0;
        numcells6=2500*9;
        xcenter=800+25;
        ycenter=325+25;
end

% Randomly distributes correct number of cells within the depths
% corresponding to each cortical layer.  Depths are measured relative to
% the bottom of Layer VI.
%   Layer I: 1526 - 1735 um
%   Layer II: 1401 - 1525 um
%   Layer III: 931 - 1400 um
%   Layer IV: 686 - 930 um
%   Layer V: 466 - 685 um
%   Layer VI: 0 - 465 um

depths=0:50:1735;

cellstotal=numcells2+numcells3+numcells4+numcells5+numcells6;
cellcount=1;
for i=1:1:numcells2
    x=randi([1,3000]);
    y=randi([1401,1525]);
    z=randi([1,3000]);
    cells.type1.location(cellcount,1)=x;
    cells.type1.location(cellcount,2)=y;
    cells.type1.location(cellcount,3)=z;
    cellcount=cellcount+1;
end

for i=1:1:numcells3
    x=randi([1,3000]);
    y=randi([931,1400]);
    z=randi([1,3000]);
    cells.type1.location(cellcount,1)=x;
    cells.type1.location(cellcount,2)=y;
    cells.type1.location(cellcount,3)=z;
    cellcount=cellcount+1;
end

for i=1:1:numcells4
    x=randi([1,3000]);
    y=randi([686,930]);
    z=randi([1,3000]);
    cells.type1.location(cellcount,1)=x;
    cells.type1.location(cellcount,2)=y;
    cells.type1.location(cellcount,3)=z;
    cellcount=cellcount+1;
end

for i=1:1:numcells5
    x=randi([1,3000]);
    y=randi([466,685]);
    z=randi([1,3000]);
    cells.type1.location(cellcount,1)=x;
    cells.type1.location(cellcount,2)=y;
    cells.type1.location(cellcount,3)=z;
    cellcount=cellcount+1;
end

for i=1:1:numcells6
    x=randi([1,3000]);
    y=randi([0,465]);
    z=randi([1,3000]);
    cells.type1.location(cellcount,1)=x;
    cells.type1.location(cellcount,2)=y;
    cells.type1.location(cellcount,3)=z;
    cellcount=cellcount+1;
end

electrode=struct;
amprange=-0.005:-0.010:-.125;
j=1;

% Defines plane to move electrode within
if strcmp(filename, 'filemat11.dat')
    % This plane is shifted because the cell bodies of this neuron type are
    % not found within area 3b.  An electrode within area 3b will only be
    % near the horizontal axonal branches rostral to the cell bodies.
    x=-500:50:0;
else
    x=1250:50:1750;
end
y=0:50:1735;
z=1500;

for x1=1:1:length(x)
    for y1=1:1:length(y)
        % Sets electrode location within slice
        electrode.location(j,1)=x(x1);
        electrode.location(j,2)=y(y1);
        electrode.location(j,3)=z;
        electrode.amplitude(1,:)=amprange;
        
        % Calculates location of electrode relative to cell body
        relposition(:,1)=-cells.type1.location(:,1)+electrode.location(j,1);% horizontal
        relposition(:,2)=-cells.type1.location(:,2)+electrode.location(j,2);%vertical
        relposition(:,3)=-cells.type1.location(:,3)+electrode.location(j,3);%width
        relposition(:,4)=sqrt(relposition(:,1).^2+relposition(:,3).^2);%horizontal radial dist
        
        if strcmp(filename, 'filemat11.dat')
            % Treats this neuron as though it is not symmetric since only
            % long horizontal axonal branches are found within area 3b.
            
            % Identify instances where electrode is to the left of the cell
            % body and flips the relative position to take this into
            % account.
            indexes=relposition(:,1)<0 ;
            relposition(indexes,4)=relposition(indexes,4)*-1;
            
            % Identifies the angle between the electrode and cell body
            ratioXY = relposition(:,3)./relposition(:,1);
            relposition(:,7) = abs(atand(ratioXY));
            
            % Maps relative position of the electrode onto the stimulation
            % threshold map.
            relposition(:,6)=(round((relposition(:,4)+xcenter)/25))+1;
            relposition(:,5)=(round((relposition(:,2)+ycenter)/25))+1;
            lookup(:,2)=relposition(:,6);
            lookup(:,1)=relposition(:,5);
            stimthreshold(1:1:length(ratioXY),1)=135;
            
            % If the cell body is within 5 degrees of the plane containing
            % the electrode, looks up the stimulation threshold at the
            % relative position of the electrode to the cell bodies.  If
            % the cell is activated by stimulation at that location,
            % stimthreshold is set to an appropriate value.  Otherwise,
            % stimthreshold is set to an amplitude greater than the
            % stimulation range.
            insiderange=find(lookup(:,1) >0 & lookup(:,2) >0 & lookup(:,1) <=size(ZI,1) & lookup(:,2) <=size(ZI,2) & relposition(:,7)<=5);
            for i=1:1:length(insiderange)
                stimthreshold(insiderange(i),1)=ZI(lookup(insiderange(i), 1), lookup(insiderange(i),2));
            end
        end
        
        if strcmp(filename, 'filemat15.dat')
            % Treats this neuron as if it were fully symmetric since the
            % axonal arbor forms a bowl shape.
            
            % Identify instances where electrode is to the left of the cell
            % body and flips the relative position to take this into account.
            indexes=relposition(:,1)<0 ;
            relposition(indexes,4)=relposition(indexes,4)*-1;
            
            % Maps relative position of the electrode onto the stimulation
            % threshold map.
            lookup(:,2)=round((relposition(:,4)+xcenter)/25)+1;
            lookup(:,1)=round((relposition(:,2)+ycenter)/25)+1;
            ratioXY = relposition(:,3)./relposition(:,1);
            stimthreshold(1:1:length(ratioXY),1)=135;
            
            
            % Looks up the stimulation threshold at the relative position of
            % the electrode to the cell bodies. If the cell is activated by
            % stimulation at that location, stimthreshold is set to an
            % appropriate value.  Otherwise, stimthreshold is set to an
            % amplitude greater than the simulation range.
            insiderange=find(lookup(:,1)>0 & lookup(:,2) >0 & lookup(:,1) <=size(ZI,1) & lookup(:,2)<=size(ZI,2));
            for i=1:1:length(insiderange)
                stimthreshold(insiderange(i),1)=ZI(lookup(insiderange(i),1), lookup(insiderange(i),2));
            end
        end
        
        relposition(:,5)=stimthreshold(:,1);
        relposition(:,9)=sqrt(relposition(:,1).^2+relposition(:,2).^2+relposition(:,3).^2); %total dist
        
        % Total distance from cell body to electrode
        stimthreshold(:,2)=relposition(:,9);
        % Horizontal distance from cell body to electrode
        stimthreshold(:,3)=relposition(:,4);
        % Vertical distance from cell body to electrode
        stimthreshold(:,4)=relposition(:,2);
        
        %Calculate the number of cells that are activated at each level of
        %stimulation
        cells.type1.fiveua(y1,x1)=length(find(stimthreshold(:,1)<=5));
        cells.type1.fifteenua(y1,x1)=length(find(stimthreshold(:,1)<=15));
        cells.type1.twentyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=25));
        cells.type1.thirtyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=35));
        cells.type1.fortyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=45));
        cells.type1.fiftyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=55));
        cells.type1.sixtyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=65));
        cells.type1.seventyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=75));
        cells.type1.eightyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=85));
        cells.type1.ninetyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=95));
        cells.type1.onehundredfiveua(y1,x1)=length(find(stimthreshold(:,1)<=105));
        cells.type1.onehundredfifteenua(y1,x1)=length(find(stimthreshold(:,1)<=115));
        cells.type1.onehundredtwentyfiveua(y1,x1)=length(find(stimthreshold(:,1)<=125));
        
        
        %Calculate the number of cells activated for each stimulation
        %strength and electrode position
        electrode.activations(j, 1)=cells.type1.fiveua(y1, x1);
        electrode.activations(j, 2)=cells.type1.fifteenua(y1, x1);
        electrode.activations(j, 3)=cells.type1.twentyfiveua(y1, x1);
        electrode.activations(j, 4)=cells.type1.thirtyfiveua(y1, x1);
        electrode.activations(j, 5)=cells.type1.fortyfiveua(y1, x1);
        electrode.activations(j, 6)=cells.type1.fiftyfiveua(y1, x1);
        electrode.activations(j, 7)=cells.type1.sixtyfiveua(y1, x1);
        electrode.activations(j, 8)=cells.type1.seventyfiveua(y1, x1);
        electrode.activations(j, 9)=cells.type1.eightyfiveua(y1, x1);
        electrode.activations(j, 10)=cells.type1.ninetyfiveua(y1, x1);
        electrode.activations(j, 11)=cells.type1.onehundredfiveua(y1, x1);
        electrode.activations(j, 12)=cells.type1.onehundredfifteenua(y1, x1);
        electrode.activations(j, 13)=cells.type1.onehundredtwentyfiveua(y1, x1);
        
        % Generates videos that show the location of neurons recruited by
        % stimulation
        if iter <=14
            distsa=stimthreshold;
            amps=struct;
        end

        if x1==6 && y1==33 && iter==15
            [amps, distsa]=plotcellsliceactivation(1, stimthreshold, cells, electrode, j, filename, amps, distsa);
        elseif x1==6 && y1==30 && iter==15
            [amps, distsa]=plotcellsliceactivation(2, stimthreshold, cells, electrode, j, filename, amps, distsa);
        elseif x1==6 && y1==24 && iter==15
            [amps, distsa]=plotcellsliceactivation(3, stimthreshold, cells, electrode, j, filename, amps, distsa);
        elseif x1==6 && y1==17 && iter==15
            [amps, distsa]=plotcellsliceactivation(4, stimthreshold, cells, electrode, j, filename, amps, distsa);
        elseif x1==6 && y1==12 && iter==15
            [amps, distsa]=plotcellsliceactivation(5, stimthreshold, cells, electrode, j, filename, amps, distsa);
        elseif x1==6 && y1==5 && iter==15
            distsa=stimthreshold;
            amps=struct;
            [amps, distsa]=plotcellsliceactivation(6, stimthreshold, cells, electrode, j, filename, amps, distsa);
        end
        j=j+1;
    end 
end

names=fieldnames(cells.type1);
probabilities=struct;

% In a spatial map, calculate how many cells will fire at each stimulation
% strength and electrode location
for n=2:1:size(names,1)
    imageamp=cells.type1.(char(names(n)));
    Z = imageamp;
      
    depths2=depths';
    for layer=1:1:6
        % Averages recruitment of all depths within a single cortical layer
        if layer==1
            index=find(depths2>=1550);
            probabilities.layer1.(char(names(n)))=Z(index,:);
        elseif layer==2
            index=find(depths2>=1400 & depths2<=1500);
            probabilities.layer2.(char(names(n)))=Z(index,:);
        elseif layer==3
            index=find(depths2>=950 & depths2<=1350);
            probabilities.layer3.(char(names(n)))=Z(index,:);
        elseif layer==4
            index=find(depths2>=700 & depths2<=900);
            probabilities.layer4.(char(names(n)))=Z(index,:);
        elseif layer==5
            index=find(depths2>=500 & depths2<=650);
            probabilities.layer5.(char(names(n)))=Z(index,:);
        else
            index=find(depths2>=0 & depths2<=450);
            probabilities.layer6.(char(names(n)))=Z(index,:);
        end
    end
end

% Calculate average number of cells activated at each stimulation strength
for m=1:1:35
    indtoave=find(electrode.location(:,2)==(m-1)*50);
    for x=1:1:13
        electrode.actbydepth(m, x)=mean(electrode.activations(indtoave, x));
    end
end

% Calculate average number of cells activated at each depth
for n=2:1:size(names,1)
    for d=1:1:35
        probabilities.avenum(d, n-1)=mean(cells.type1.(char(names(n)))(d, :));
    end
end

probabilities.average=electrode.actbydepth;

% Returns to PyrPlotSimpleComplete.m