function [probabilities, distsa, amps]=INcalcprobs3D(ZI, filename, iter)
% Called by INPlotSimpleComplete.m

% Constructs a 3D slab of artificial cortex containing a single cell type.
% An electrode is then passed through the slice, and the number and
% location of neurons recruited by stimulation at each location are
% tabulated.  Additionally, videos of recruitment are generated.

cells=struct;

switch filename
    % Defines the number of neurons found within a 1 mm by 1 mm slab of 
    % cortex for each cell type.  The scale factor of 9 increases the slab 
    % to 3 mm by 3 mm.   
    
    case 'celltype1.dat'
        numcells2=0;
        numcells3=1327*9;
        numcells4=308*9;
        numcells5=930*9;
        numcells6=547*9;
        xcenter=500;
        ycenter=225;
    case 'celltype2.dat'
        numcells2=496*9;
        numcells3=1744*9;
        numcells4=235*9;
        numcells5=310*9;
        numcells6=0;
        xcenter=225;
        ycenter=250;
    case 'celltype3.dat'
        numcells2=364*9;
        numcells3=0;
        numcells4=0;
        numcells5=0;
        numcells6=0;
        xcenter=175;
        ycenter=850;
    case 'celltype4.dat'
        numcells2=364*9;
        numcells3=1857*9;
        numcells4=525*9;
        numcells5=103*9;
        numcells6=0;
        xcenter=200+25;
        ycenter=400+25;
    case 'celltype5.dat'
        numcells2=430*9;
        numcells3=114*9;
        numcells4=924*9;
        numcells5=103*9;
        numcells6=0;
        xcenter=275;
        ycenter=275;
    case 'celltype6.dat'
        numcells2=662*9;
        numcells3=38*9;
        numcells4=0;
        numcells5=0;
        numcells6=0;
        xcenter=675;
        ycenter=250;
    case 'celltype7.dat'
        numcells2=0;
        numcells3=38*9;
        numcells4=942*9;
        numcells5=0;
        numcells6=0;
        xcenter=175;
        ycenter=225;
    case 'celltype8.dat'
        numcells2=0;
        numcells3=0;
        numcells4=0;
        numcells5=0;
        numcells6=3190*9;
        xcenter=250;
        ycenter=200;
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
x=1250:50:1750;
y=0:50:1735;
z=1500;

% Moves electrode throughout the plane and identifies neurons activated by
% stimulation at each location.
for x1=1:1:length(x)
    for y1=1:1:length(y)
               
        % Sets electrode location within slice
        electrode.location(j,1)=x(x1);
        electrode.location(j,2)=y(y1);
        electrode.location(j,3)=z;
        electrode.amplitude(1,:)=amprange;
        
        %{
        % Plots location of cell bodies.
        figure
        hold on
        plot(cells.type1.location(:,1), cells.type1.location(:,2), 'r.')
        axis square
        axis([0 1000 0 1735])
        %}
        
        % Calculates location of electrode relative to cell body
        relposition(:,1)=-cells.type1.location(:,1)+electrode.location(j,1);
        relposition(:,2)=-cells.type1.location(:,2)+electrode.location(j,2);
        relposition(:,3)=-cells.type1.location(:,3)+electrode.location(j,3);
        relposition(:,4)=sqrt(relposition(:,1).^2+relposition(:,3).^2);
        
        
        % Identify instances where electrode is to the left of the cell
        % body and flips the relative position to take this into account.
        indexes=relposition(:,1)<0 ;
        relposition(indexes,4)=relposition(indexes,4)*-1;
        
        % Maps relative position of the electrode onto the stimulation
        % threshold map.
        lookup(:,2)=round((relposition(:,4)+xcenter)/25)+1;
        lookup(:,1)=round((relposition(:,2)+ycenter)/25)+1;
        
        % Looks up the stimulation threshold at the relative position of
        % the electrode to the cell bodies. If the cell is activated by 
        % stimulation at that location, stimthreshold is set to an
        % appropriate value.  Otherwise, stimthreshold is set to an    
        % amplitude greater than the simulation range.  Complete rotational
        % symmetry is assumed for these interneurons.
        indexes1=lookup(:,1) <=0 | lookup(:,2) <=0 | lookup(:,1) >=size(ZI,1) | lookup(:,2) >=size(ZI,2);
        stimthreshold(indexes1,1)=135;
        indexes2=~indexes1;
        indexes3=find(indexes2);
        for i=1:1:length(find(indexes2))
            stimthreshold(indexes3(i),1)=ZI(lookup(indexes3(i),1), lookup(indexes3(i),2));            
        end
        
        relposition(:,8)=stimthreshold(:,1);
        relposition(:,9)=sqrt(relposition(:,1).^2+relposition(:,2).^2+relposition(:,3).^2);
        
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
        if iter<=14
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

% In a spatial map, calculate how many cells will fire at each electrode 
% location and stimulation strength.
for n=2:1:size(names,1)
    imageamp=cells.type1.(char(names(n)));
    Z = imageamp;
    
    for k=1:1:35
        for j=0:1:cellstotal
            % Calculate the probability of firing
            % p(d, x)= numcellfires(x)/numlocations(d)
            probabilities.bylayer.(char(names(n)))(k,j+1)=length(find(cells.type1.(char(names(n)))(k,:)==j))/21;
        end
    end
  
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

% Calculate average number of cells activated at each stimulation
% strength
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

% Returns to INPlotSimpleComplete.m