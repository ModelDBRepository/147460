clear all
close all

for j={'filemat9.dat', 'filemat10.dat', 'filemat11.dat', 'filemat12.dat', 'filemat13.dat', 'filemat14.dat', 'filemat15.dat'}
filename=j{1};

% Selects appropriate symmetric model files
switch filename
    case 'filemat9.dat'
        filenameSym = 'filemat9 - Sym.dat';
    case 'filemat10.dat'
        filenameSym = 'filemat10 - Sym.dat';
    case 'filemat12.dat'
        filenameSym = 'filemat12 - Sym.dat';
    case 'filemat13.dat'
        filenameSym = 'filemat13 - Sym.dat';
    case 'filemat14.dat'
        filenameSym = 'filemat14 - Sym.dat';
end
    %Imports electrode position and stimulation amplitude when AP occured
    importfile(filename,1);
    %Plots stimulation threshold in relation to cell model
    imgData = getImgData(data);
    %Plots cell model overtop of threshold map
    PyrPlotLines(filename);
    %Generates threshold maps for symmetric models if they exist for that
    %cell type
    if(exist('filenameSym', 'var'))
        importfile(filenameSym,1);
        imgDataSym = getImgData(data);
        PyrPlotLines(filenameSym);
    end
    
    %Initializes structures for slice simulation
    clearvars -except filename filenameSym imgData imgDataSym
    layerind=struct;
    sumprobsind=struct;
    sumnumsind=struct; 
    numruns=15;
    
    for z=1:1:numruns
        %Generates slice containing one cell type and determines the
        %number and location of cells activated by an electrode moving
        %throughout the slice.  Pyrcalcprobs3D.m is called for cells that do
        %not have a corresponding symmetric model (cell types 11 and 15).
        %PyrSymcalcprobs3D.m is called in all other cases.
        
        switch filename
            case 'filemat9.dat'
                [probabilities, distsa, amps]=PyrSymcalcprobs3D(imgData, imgDataSym, filename, filenameSym, z);
            case 'filemat10.dat'
                [probabilities, distsa, amps]=PyrSymcalcprobs3D(imgData, imgDataSym, filename, filenameSym, z);
            case 'filemat11.dat'
                [probabilities, distsa, amps]=Pyrcalcprobs3D(imgData, filename, z);
            case 'filemat12.dat'
                [probabilities, distsa, amps]=PyrSymcalcprobs3D(imgData, imgDataSym, filename, filenameSym, z);
            case 'filemat13.dat'
                [probabilities, distsa, amps]=PyrSymcalcprobs3D(imgData, imgDataSym, filename, filenameSym, z);
            case 'filemat14.dat'
                [probabilities, distsa, amps]=PyrSymcalcprobs3D(imgData, imgDataSym, filename, filenameSym, z);
            case 'filemat15.dat'
                [probabilities, distsa, amps]=Pyrcalcprobs3D(imgData, filename, z);
            end

        %If it is the first slice, set up the variable, otherwise add to it
        if z == 1
            sumnums=probabilities.avenum;
        else
            sumnums = sumnums + probabilities.avenum;
        end
    end
    
    %Find average number of cells at each stim level
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
Pyrnumsdepth