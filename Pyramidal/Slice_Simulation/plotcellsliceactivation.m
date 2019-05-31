function [amps, stimthreshold4]=plotcellsliceactivation(i, stimthreshold2, cells, electrode, j, filename, amps, stimthreshold4)
% Called by PyrSymcalcprobs3D.m or Pyrcalcprobs3D.m

% Generates videos of the location of the cell bodies activated by
% stimulation.  Also calculates the distribution of total, horizontal, and
% vertical distances separating the electrode and the cell bodies of
% neurons activated by stimulation.

stimthreshold=stimthreshold2(:,1);
amps.amp05(1:length(find(stimthreshold<=5)),i)=find(stimthreshold<=5);
amps.amp15(1:length(find(stimthreshold<=15)),i)=find(stimthreshold<=15);
amps.amp25(1:length(find(stimthreshold<=25)),i)=find(stimthreshold<=25);
amps.amp35(1:length(find(stimthreshold<=35)),i)=find(stimthreshold<=35);
amps.amp45(1:length(find(stimthreshold<=45)),i)=find(stimthreshold<=45);
amps.amp55(1:length(find(stimthreshold<=55)),i)=find(stimthreshold<=55);
amps.amp65(1:length(find(stimthreshold<=65)),i)=find(stimthreshold<=65);
amps.amp75(1:length(find(stimthreshold<=75)),i)=find(stimthreshold<=75);
amps.amp85(1:length(find(stimthreshold<=85)),i)=find(stimthreshold<=85);
amps.amp95(1:length(find(stimthreshold<=95)),i)=find(stimthreshold<=95);
amps.amp105(1:length(find(stimthreshold<=105)),i)=find(stimthreshold<=105);
amps.amp115(1:length(find(stimthreshold<=115)),i)=find(stimthreshold<=115);
amps.amp125(1:length(find(stimthreshold<=125)),i)=find(stimthreshold<=125);
amps.j(:,i)=j;
stimthreshold4(:,i)=stimthreshold2(:,2);
stimthreshold4(:,i+6)=stimthreshold2(:,3);
stimthreshold4(:,i+12)=stimthreshold2(:,4);

if i==1
    amps2=struct;
    names=fieldnames(amps);
    n=1;
    for k=1:1:6
        hf=figure;
        rect = get(hf,'Position');
        rect(1:2) = [0 0];
        hold all
        % Plots locations of cells
        plot3(cells.type1.location(:,1), cells.type1.location(:,3), cells.type1.location(:,2), '.', 'MarkerSize', 4, 'Color', [135/255, 135/255, 135/255])
        % Adds yellow line representing electrode location
        if strcmp(filename, 'filemat9.dat')
            line([2250 2250],  [2500 2500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
        elseif strcmp(filename, 'filemat11.dat')
            line([-250 -250],  [1500 1500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
        else
            line([1500 1500],  [1500 1500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
        end
        % Line indicating stimulation amplitude
        line([1000 1400], [1500 1500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
        line([0 3000], [0 0], [465 465], 'Color', 'k')
        line([1 3000], [0 0], [685 685], 'Color', 'k')
        line([1 3000], [0 0], [930 930], 'Color', 'k')
        line([1 3000], [0 0], [1400 1400], 'Color', 'k')
        line([1 3000], [0 0], [1525 1525], 'Color', 'k')
        line([1 3000], [0 0], [1735 1735], 'Color', 'k')
        
        str1='0 \muA';
        text(600,0, 1910,str1)
        view([0.01, -0.1, 0.01])
        axis([0 3000 0 3000 0 2000])
        axis equal
        set(gca, 'ZTick', [233, 576, 808, 1166, 1463, 1631])
        set(gca, 'ZTickLabel', {'Layer VI', 'Layer V', 'Layer IV', 'Layer III', 'Layer II', 'Layer I'})
        set(gca, 'XTick', [0, 500, 1000, 1500, 2000, 2500, 3000])
        set(gca, 'XTickLabel', {'-1500', '-1000', '-500', '0', '500', '1000', '1500'})
        xlabel('\mum relative to electrode')
        set(gcf,'Color','w')
        box on
        axis([0 3000 0 3000 0 2000])
        F(n) = getframe(hf, rect);
        n=n+1;
        
        for m=1:1:(size(names, 1)-1)
            hf=figure;
            rect = get(hf,'Position');
            rect(1:2) = [0 0];
            hold all
            % Plots locations of all cell bodies as black dots
            plot3(cells.type1.location(:,1), cells.type1.location(:,3), cells.type1.location(:,2), '.', 'MarkerSize', 4, 'Color', [135/255, 135/255, 135/255])
            if isempty(find(amps.(char(names(m,:)))(:,k)))==0
                % Plots locations of cell bodies activated by stimulation
                % as red dots.
                plot3(cells.type1.location(nonzeros(amps.(char(names(m,:)))(:,k)),1), cells.type1.location(nonzeros(amps.(char(names(m,:)))(:,k)),3), cells.type1.location(nonzeros(amps.(char(names(m,:)))(:,k)),2), 'ro', 'MarkerFaceColor', 'r', 'MarkerFaceColor', 'r', 'MarkerSize', 4);
            end
            % Plots location of electrode as yellow line
            if strcmp(filename, 'filemat9.dat')
                line([2250 2250],  [2500 2500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
            elseif strcmp(filename, 'filemat11.dat')
                line([-250 -250],  [1500 1500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
            else
                line([1500 1500],  [1500 1500], [electrode.location(amps.j(:,k),2), 1860], 'LineWidth',3, 'Color', 'y')
            end % Delineates the boundaries of each cortical layer
            line([0 3000], [0 0], [465 465], 'Color', 'k')
            line([1 3000], [0 0], [685 685], 'Color', 'k')
            line([1 3000], [0 0], [930 930], 'Color', 'k')
            line([1 3000], [0 0], [1400 1400], 'Color', 'k')
            line([1 3000], [0 0], [1525 1525], 'Color', 'k')
            line([1 3000], [0 0], [1735 1735], 'Color', 'k')
            
            %Plots indication of stimulus strength.
            if m==1
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1895 1895], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1895 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1895 1900], 'LineWidth', 2, 'Color', 'k')
                str1='5 \muA';
            elseif m==2
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1885 1885], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1885 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1885 1900], 'LineWidth', 2, 'Color', 'k')
                str1='15 \muA';
            elseif m==3
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1875 1875], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1875 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1875 1900], 'LineWidth', 2, 'Color', 'k')
                str1='25 \muA';
            elseif m==4
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1865 1865], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1865 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1865 1900], 'LineWidth', 2, 'Color', 'k')
                str1='35 \muA';
            elseif m==5
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1855 1855], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1855 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1855 1900], 'LineWidth', 2, 'Color', 'k')
                str1='45 \muA';
            elseif m==6
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1845 1845], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1845 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1845 1900], 'LineWidth', 2, 'Color', 'k')
                str1='55 \muA';
            elseif m==7
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1835 1835], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1835 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1835 1900], 'LineWidth', 2, 'Color', 'k')
                str1='65 \muA';
            elseif m==8
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1825 1825], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1825 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1825 1900], 'LineWidth', 2, 'Color', 'k')
                str1='75 \muA';
            elseif m==9
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1815 1815], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1815 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1815 1900], 'LineWidth', 2, 'Color', 'k')
                str1='85 \muA';
            elseif m==10
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1805 1805], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1805 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1805 1900], 'LineWidth', 2, 'Color', 'k')
                str1='95 \muA';
            elseif m==11
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1795 1795], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1795 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1795 1900], 'LineWidth', 2, 'Color', 'k')
                str1='105 \muA';
            elseif m==12
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1785 1785], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1785 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1785 1900], 'LineWidth', 2, 'Color', 'k')
                str1='115 \muA';
            elseif m==13
                line([1000 1100], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1300], [500 500], [1775 1775], 'LineWidth', 2, 'Color', 'k')
                line([1300 1400], [500 500], [1900 1900], 'LineWidth', 2, 'Color', 'k')
                line([1100 1100], [500 500], [1775 1900], 'LineWidth', 2, 'Color', 'k')
                line([1300 1300], [500 500], [1775 1900], 'LineWidth', 2, 'Color', 'k')
                str1='125 \muA';
                
                % Calculates total, horizontal, and vertical distances
                % separating the electrode and cell bodies of neurons
                % activated by stimulation.
                dists(1:length(nonzeros(amps.(char(names(m,:)))(:,k))),k)=stimthreshold4(nonzeros(amps.(char(names(m,:)))(:,k)),k);
                dists(1:length(nonzeros(amps.(char(names(m,:)))(:,k))),k+6)=stimthreshold4(nonzeros(amps.(char(names(m,:)))(:,k)),k+6);
                dists(1:length(nonzeros(amps.(char(names(m,:)))(:,k))),k+12)=stimthreshold4(nonzeros(amps.(char(names(m,:)))(:,k)),k+12);
            end
            
            text(600,0, 1910,str1)
            view([0.01, -0.1, 0.01])
            axis([0 3000 0 3000 0 2000])
            axis equal
            set(gca, 'ZTick', [233, 576, 808, 1166, 1463, 1631])
            set(gca, 'ZTickLabel', {'Layer VI', 'Layer V', 'Layer IV', 'Layer III', 'Layer II', 'Layer I'})
            set(gca, 'XTick', [0, 500, 1000, 1500, 2000, 2500, 3000])
            set(gca, 'XTickLabel', {'-1500', '-1000', '-500', '0', '500', '1000', '1500'})
            xlabel('\mum relative to electrode')
            set(gcf,'Color','w')
            box on
            axis([0 3000 0 3000 0 2000])
            % Saves frame
            F(n) = getframe(hf, rect);
            n=n+1;
        end
        close all
    end
    
    % Saves slab activation videos
    [pathstr, fname, ext] = fileparts(filename) ;
    moviename = strcat('SliceView', fname);
    F2=cat(2, F, F);
    movie2avi(F2, moviename,'compression', 'none', 'quality', 100, 'fps', 2);
    
    % Calculates distribution of total distance from cell body of activated
    % neuron to electrode tip.
    histbins=1:25:3000;
    [n1]=hist(nonzeros(abs(dists(:,1))), histbins);
    [n2]=hist(nonzeros(abs(dists(:,2))), histbins);
    [n3]=hist(nonzeros(abs(dists(:,3))), histbins);
    [n4]=hist(nonzeros(abs(dists(:,4))), histbins);
    [n5]=hist(nonzeros(abs(dists(:,5))), histbins);
    [n6]=hist(nonzeros(abs(dists(:,6))), histbins);
    figure
    plot(histbins, n1, histbins, n2, histbins, n3, histbins, n4, histbins, n5, histbins, n6)
    legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6')
    
    % Calculates distribution of horizontal distance from cell body of activated
    % neuron to electrode tip.
    [n7]=hist(nonzeros(abs(dists(:,7))), histbins);
    [n8]=hist(nonzeros(abs(dists(:,8))), histbins);
    [n9]=hist(nonzeros(abs(dists(:,9))), histbins);
    [n10]=hist(nonzeros(abs(dists(:,10))), histbins);
    [n11]=hist(nonzeros(abs(dists(:,11))), histbins);
    [n12]=hist(nonzeros(abs(dists(:,12))), histbins);
    figure
    plot(histbins, n1, histbins, n2, histbins, n3, histbins, n4, histbins, n5, histbins, n6)
    legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6')
    
    % Calculates distribution of vertical distance from cell body of activated
    % neuron to electrode tip.
    [n13]=hist(nonzeros(abs(dists(:,13))), histbins);
    [n14]=hist(nonzeros(abs(dists(:,14))), histbins);
    [n15]=hist(nonzeros(abs(dists(:,15))), histbins);
    [n16]=hist(nonzeros(abs(dists(:,16))), histbins);
    [n17]=hist(nonzeros(abs(dists(:,17))), histbins);
    [n18]=hist(nonzeros(abs(dists(:,18))), histbins);
    figure
    plot(histbins, n1, histbins, n2, histbins, n3, histbins, n4, histbins, n5, histbins, n6)
    legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6')
    clear stimthreshold3
    stimthreshold4=[n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16; n17; n18]';
end

% Returns to PyrSymcalcprobs3D.m or Pyrcalcprobs3D.m