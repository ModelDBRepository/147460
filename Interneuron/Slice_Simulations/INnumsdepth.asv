close all
clear all

% Called by INPlotSimpleComplete.m (or run independently)

% Generates summary plots that indicate the contribution of each cell type
% to the total recruitment, the number of cells recruited by
% stimulation in each cortical layer (total and for individual cell types),
% and histograms detailing the location of the cell bodies of activated
% neurons relative to the electrode.

% Load the data corresponding to average recruitment by electrode depth and
% distance histograms for each cell type.
load('celltype1avenum.mat')
avenumstype1=avenums;
distsa1=distsa;
load('celltype2avenum.mat')
avenumstype2=avenums;
distsa2=distsa;
load('celltype3avenum.mat')
avenumstype3=avenums;
distsa3=distsa;
load('celltype4avenum.mat')
avenumstype4=avenums;
distsa4=distsa;
load('celltype5avenum.mat')
avenumstype5=avenums;
distsa5=distsa;
load('celltype6avenum.mat')
avenumstype6=avenums;
distsa6=distsa;
load('celltype7avenum.mat')
avenumstype7=avenums;
distsa7=distsa;
load('celltype8avenum.mat')
avenumstype8=avenums;
distsa8=distsa;

depths2=[0:50:1735]';
layers=struct;
for layer=1:1:6
    %averages all depths within a single cortical layer
    if layer==1
        index=find(depths2>=1550);
    elseif layer==2
        index=find(depths2>=1400 & depths2<=1500);
    elseif layer==3
        index=find(depths2>=950 & depths2<=1350);
    elseif layer==4
        index=find(depths2>=700 & depths2<=900);
    elseif layer==5
        index=find(depths2>=500 & depths2<=650);
    else
        index=find(depths2>=0 & depths2<=450);
    end
    layername=strcat('layer', num2str(layer));
    
    %Calculates mean number of cells activated for each cortical layer
    layers.(layername)(1,:)=mean(avenumstype1(index,:));
    layers.(layername)(2,:)=mean(avenumstype2(index,:));
    layers.(layername)(3,:)=mean(avenumstype3(index,:));
    layers.(layername)(4,:)=mean(avenumstype4(index,:));
    layers.(layername)(5,:)=mean(avenumstype5(index,:));
    layers.(layername)(6,:)=mean(avenumstype6(index,:));
    layers.(layername)(7,:)=mean(avenumstype7(index,:));
    layers.(layername)(8,:)=mean(avenumstype8(index,:));
    layers.(layername)(9,:)=sum(layers.(layername)(1:8,:));
end

stimamp=struct;
%for each stimulation strength
for i=1:1:13
    stimname=strcat('amp', num2str(i));
    %for each layer
    for layer=1:1:6
        %Calculate number of cells activated for each stim amp, organized
        %by layer
        layername=strcat('layer', num2str(layer));
        stimamp.(stimname)(:,layer)=layers.(layername)(:,i);
        stimnamepct=strcat(stimname, 'pct');
        stimamp.(stimnamepct)(:,layer)=stimamp.(stimname)(1:8, layer)./stimamp.(stimname)(9,layer);
    end
end

%Plot number of cells activated by stimulation at 125 uA grouped by
%cortical layer
figure
bar(stimamp.amp13pct', 'grouped')
legend('Large Multipolar', 'Slender Multipolar', 'Bitufted', 'Small Round', 'Small Granular', 'Round with Dendritic Tuft', 'Spiny with Recurrent Axon', 'Modified Pyramidal')
xlabel('Layer')
ylabel('Cells Activated')
title('Stimulation 125 \muA')

% Plot line graph recruitment curves for each cell type
for j=1:1:9
    figure
    hold all
    plot(layers.layer1(j,:), '-ko', 'LineWidth',1,'MarkerSize',5)
    plot(layers.layer2(j,:), '-ro',  'LineWidth',1,'MarkerSize',5)
    plot(layers.layer3(j,:), '-bo', 'LineWidth',1,'MarkerSize',5)
    plot(layers.layer4(j,:), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
    plot(layers.layer5(j,:), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
    plot(layers.layer6(j,:), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
    
    legend('Layer I', 'Layer II', 'Layer III', 'Layer IV', 'Layer V', 'Layer VI')
    set(gca, 'XTick', 2:2:13)
    set(gca, 'XTickLabel', {'15', '35', '55', '75', '95', '115'})
    xlabel('Stimulation (\muA)')
    ylabel('Number of cells')
    switch j
        case 1
            title('Large Multipolar')
        case 2
            title('Slender Multipolar')
        case 3
            title('Bitufted')
        case 4
            title('Small Round')
        case 5
            title('Small Granular')
        case 6
            title('Round with Dendritic Tuft')
        case 7
            title('Spiny with Recurrent Axon')
        case 8
            title('Modified Pyramidal')
        case 9
            title('Total Recruitment by Cortical Layer')
    end
end

% Plot total separation histogram for all cell types combined
histbins=1:25:3000;
diststotal=distsa1+distsa2+distsa3+distsa4+distsa5+distsa6+distsa7+distsa8;
figure
hold all
plot(histbins,diststotal(:,1), '-ko', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,2), '-ro', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,3), '-bo', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,4), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
plot(histbins,diststotal(:,5), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
plot(histbins,diststotal(:,6), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
title('Histogram of total distance of activated cell from electrode tip')
xlabel('Distance from soma to electrode (\mum)')
ylabel('# cells activated')
h=legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6');
set(h, 'Location', 'NorthEastOutside')

% Plot horizontal separation histogram for all cell types combined
figure
hold all
plot(histbins,diststotal(:,7), '-ko', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,8), '-ro', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,9), '-bo', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,10), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
plot(histbins,diststotal(:,11), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
plot(histbins,diststotal(:,12), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
title('Histogram of radial distance of activated cell from electrode tip')
xlabel('Horizontal distance from soma to electrode (\mum)')
ylabel('# cells activated')
h=legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6');
set(h, 'Location', 'NorthEastOutside')

% Plot vertical separation histogram for all cell types combined
figure
hold all
plot(histbins,diststotal(:,13), '-ko', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,14), '-ro', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,15), '-bo', 'LineWidth',1,'MarkerSize',5)
plot(histbins,diststotal(:,16), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
plot(histbins,diststotal(:,17), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
plot(histbins,diststotal(:,18), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
title('Histogram of vertical distance of activated cell from electrode tip')
xlabel('Vertical distance from soma to electrode (\mum)')
ylabel('# cells activated')
h=legend('Layer 1', 'Layer 2', 'Layer 3', 'Layer 4', 'Layer 5', 'Layer 6');
set(h, 'Location', 'NorthEastOutside')

% Plot total, horizontal, and vertical separation histograms for each cell 
% type individually.
for j=1:1:8
    switch j
        case 1
            distchoose=distsa1;
        case 2
            distchoose=distsa2;
        case 3
            distchoose=distsa3;
        case 4
            distchoose=distsa4;
        case 5
            distchoose=distsa5;
        case 6
            distchoose=distsa6;
        case 7
            distchoose=distsa7;
        case 8
            distchoose=distsa8;
    end
    for i=7:6:18
        figure
        hold all
        plot(histbins, distchoose(:,i),'-ko', 'LineWidth',1,'MarkerSize',5)
        plot(histbins, distchoose(:,i+1), '-ro',  'LineWidth',1,'MarkerSize',5)
        plot(histbins, distchoose(:,i+2), '-bo', 'LineWidth',1,'MarkerSize',5)
        plot(histbins, distchoose(:,i+3), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
        plot(histbins, distchoose(:,i+4), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
        plot(histbins, distchoose(:,i+5), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
        if i==1
            switch j
                case 1
                    title('Total Distance Histogram - Large Multipolar')
                case 2
                    title('Total Distance Histogram - Slender Multipolar')
                case 3
                    title('Total Distance Histogram - Bitufted')
                case 4
                    title('Total Distance Histogram - Small Round')
                case 5
                    title('Total Distance Histogram - Small Granular')
                case 6
                    title('Total Distance Histogram - Round with Dendritic Tuft')
                case 7
                    title('Total Distance Histogram - Spiny with Recurrent Axon')
                case 8
                    title('Total Distance Histogram - Modified Pyramidal')
            end
            xlabel('Distance from soma to electrode')
            ylabel('# cells activated')
            xlim([0 800])
        elseif i==7
            switch j
                case 1
                    title('Radial Distance Histogram - Large Multipolar')
                case 2
                    title('Radial Distance Histogram - Slender Multipolar')
                case 3
                    title('Radial Distance Histogram - Bitufted')
                case 4
                    title('Radial Distance Histogram - Small Round')
                case 5
                    title('Radial Distance Histogram - Small Granular')
                case 6
                    title('Radial Distance Histogram - Round with Dendritic Tuft')
                case 7
                    title('Radial Distance Histogram - Spiny with Recurrent Axon')
                case 8
                    title('Radial Distance Histogram - Modified Pyramidal')
            end
            xlabel('Horizontal distance from soma to electrode')
            ylabel('# cells activated')
            xlim([0 800])   
        elseif i==13
            switch j
                case 1
                    title('Vertical Distance Histogram - Large Multipolar')
                case 2
                    title('Vertical Distance Histogram - Slender Multipolar')
                case 3
                    title('Vertical Distance Histogram - Bitufted')
                case 4
                    title('Vertical Distance Histogram - Small Round')
                case 5
                    title('Vertical Distance Histogram - Small Granular')
                case 6
                    title('Vertical Distance Histogram - Round with Dendritic Tuft')
                case 7
                    title('Vertical Distance Histogram - Spiny with Recurrent Axon')
                case 8
                    title('Vertical Distance Histogram - Modified Pyramidal')
            end
            xlabel('Vertical distance from soma to electrode')
            ylabel('# cells activated')
            xlim([0 800])
        end
    end
end

