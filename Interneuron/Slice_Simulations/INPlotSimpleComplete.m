clear all
close all

for j={'celltype1.dat', 'celltype2.dat', 'celltype3.dat', 'celltype4.dat', 'celltype5.dat', 'celltype6.dat', 'celltype7.dat', 'celltype8.dat'};
    filename=j{1};
    
    %Imports electrode position and stimulation amplitude when AP occured
    importfile(filename,1);
    %Plots stimulation threshold in relation to cell model
    imgData = getImgData(data);
    %Plots cell model overtop of threshold map
    INPlotLines(filename);
    
    %Initializes structures for slice simulation
    clearvars -except filename filenameSym imgData imgDataSym j
    layerind=struct;
    sumprobsind=struct;
    sumnumsind=struct;
    numruns=15;
    
    for z=1:1:numruns
        %Generates slice containing one cell type and determines the
        %number and location of cells activated by an electrode moving
        %throughout the slice
        [probabilities, distsa, amps2]=INcalcprobs3D(imgData, filename, z);
            
        %If it is the first slice, set up the variable, otherwise add to it.
        if z == 1
            sumnums=probabilities.avenum;
        else
            sumnums = sumnums + probabilities.avenum;
        end
    end
    
    %Find average number of cells recruited at each stim level
    avenums=sumnums./numruns;
    
    % Saves workspace for later processing by cortical layer
    [pathstr, fname, ext] = fileparts(filename);
    filename3=strcat(fname, 'avenum');
    save(filename3)
    1;
    
    fprintf('done\n\n');
    clear
    close all
end

% Initiates processing by cortical layer
INnumsdepth