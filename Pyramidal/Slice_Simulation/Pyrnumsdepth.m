close all
clear 

% Called by PyrPlotSimpleComplete.m (or run independently)

% Generates summary plots that indicate the contribution of each cell type
% to the total recruitment, the number of cells recruited by
% stimulation in each cortical layer (total and for individual cell types),
% and histograms detailing the location of the cell bodies of activated
% neurons relative to the electrode.

% Load the data corresponding to average recruitment by electrode depth and
% distance histograms for each cell type.
load('filemat9avenum.mat')
avenumstype9=avenums;
distsa9=distsa;
load('filemat10avenum.mat')
avenumstype10=avenums;
distsa10=distsa;
load('filemat11avenum.mat')
avenumstype11=avenums;
distsa11=distsa;
load('filemat12avenum.mat')
avenumstype12=avenums;
distsa12=distsa;
load('filemat13avenum.mat')
avenumstype13=avenums;
distsa13=distsa;
load('filemat14avenum.mat')
avenumstype14=avenums;
distsa14=distsa;
load('filemat15avenum.mat')
avenumstype15=avenums;
distsa15=distsa;

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
    layers.(layername)(1,:)=mean(avenumstype9(index,:));
    layers.(layername)(2,:)=mean(avenumstype10(index,:));
    layers.(layername)(3,:)=mean(avenumstype11(index,:));
    layers.(layername)(4,:)=mean(avenumstype12(index,:));
    layers.(layername)(5,:)=mean(avenumstype13(index,:));
    layers.(layername)(6,:)=mean(avenumstype14(index,:));
    layers.(layername)(7,:)=mean(avenumstype15(index,:));
    layers.(layername)(8,:)=sum(layers.(layername)(1:7,:));
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
        stimamp.(stimnamepct)(:,layer)=stimamp.(stimname)(1:7, layer)./stimamp.(stimname)(8,layer);
    end
end

%Plot number of cells activated by stimulation at 125 uA grouped by
%cortical layer
figure
bar(stimamp.amp13pct', 'grouped')
xlabel('Layer')
ylabel('Percentage of activated cells')
title('Activation by layer with 125 \muA stimulation')
set(gca, 'XTickLabel', {'I', 'II', 'III', 'IV', 'V', 'VI'})
h=legend('Layer II Broad', 'Layer III Intermediate', 'Layer III Broad External', 'Layer IV Intermediate', 'Layer IV Narrow', 'Layer V Intermediate', 'Layer VI Narrow', 'Type 16');
set(h, 'Location', 'NorthEastOutside')

%Plot line graph recruitment curves for each cell type
for j=1:1:8
    figure
    hold all
    plot(layers.layer1(j,:), '-ko', 'LineWidth',1,'MarkerSize',5)
    plot(layers.layer2(j,:), '-ro',  'LineWidth',1,'MarkerSize',5)
    plot(layers.layer3(j,:), '-bo', 'LineWidth',1,'MarkerSize',5)
    plot(layers.layer4(j,:), '-ko', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'k')
    plot(layers.layer5(j,:), '-ro', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'r')
    plot(layers.layer6(j,:), '-bo', 'LineWidth',1,'MarkerSize',4, 'MarkerFaceColor', 'b')
        
    set(gca, 'XTick', 2:2:13)
    set(gca, 'XTickLabel', {'15', '35', '55', '75', '95', '115'})
    xlabel('Stimulation (\muA)')
    ylabel('Number of cells')
    set(gca, 'YTickLabel', num2str(get(gca,'YTick')','%d'))
    switch j
        case 1
            title('Layer II Broad')
        case 2
            title('Layer III Intermediate')
        case 3
            title('Layer III Broad External')
        case 4
            title('Layer IV Intermediate')
        case 5
            title('Layer IV Narrow')
        case 6
            title('Layer V Intermediate')
        case 7
            title('Layer VI Narrow')
        case 8
            title('Total Recruitment by Cortical Layer')
    end
end

% Plot total separation histogram for all cell types combined
histbins=1:25:3000;
diststotal=distsa9+distsa10+distsa11+distsa12+distsa13+distsa14+distsa15;
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
for j=1:1:7
    switch j
        case 1
            distchoose=distsa9;
        case 2
            distchoose=distsa10;
        case 3
            distchoose=distsa11;
        case 4
            distchoose=distsa12;
        case 5
            distchoose=distsa13;
        case 6
            distchoose=distsa14;
        case 7
            distchoose=distsa15;
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
                    title('Total Distance Histogram - Layer II Broad')
                case 2
                    title('Total Distance Histogram - Layer III Intermediate')
                case 3
                    title('Total Distance Histogram - Layer III Broad External')
                case 4
                    title('Total Distance Histogram - Layer IV Intermediate')
                case 5
                    title('Total Distance Histogram - Layer IV Narrow')
                case 6
                    title('Total Distance Histogram - Layer V Intermediate')
                case 7
                    title('Total Distance Histogram - Layer VI Narrow')
            end
            xlabel('Distance from soma to electrode')
            ylabel('# cells activated')
            xlim([0 3000])
        elseif i==7
            switch j
                case 1
                    title('Radial Distance Histogram - Layer II Broad')
                case 2
                    title('Radial Distance Histogram - Layer III Intermediate')
                case 3
                    title('Radial Distance Histogram - Layer III Broad External')
                case 4
                    title('Radial Distance Histogram - Layer IV Intermediate')
                case 5
                    title('Radial Distance Histogram - Layer IV Narrow')
                case 6
                    title('Radial Distance Histogram - Layer V Intermediate')
                case 7
                    title('Radial Distance Histogram - Layer VI Narrow')
            end
            xlabel('Horizontal distance from soma to electrode (\mum)')
            ylabel('# cells activated')
            xlim([0 2500])  
        elseif i==13
            switch j
                case 1
                    title('Vertical Distance Histogram - Layer II Broad')
                case 2
                    title('Vertical Distance Histogram - Layer III Intermediate')
                case 3
                    title('Vertical Distance Histogram - Layer III Broad External')
                case 4
                    title('Vertical Distance Histogram - Layer IV Intermediate')
                case 5
                    title('Vertical Distance Histogram - Layer IV Narrow')
                case 6
                    title('Vertical Distance Histogram - Layer V Intermediate')
                case 7
                    title('Vertical Distance Histogram - Layer VI Narrow')
            end
            xlabel('Vertical distance from soma to electrode (\mum)')
            ylabel('# cells activated')
            xlim([0 1500])
        end
    end
end
