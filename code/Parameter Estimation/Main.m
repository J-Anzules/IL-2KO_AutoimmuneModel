%-------------------------------------------------------------------------------------------------------%
%                                       Environment set up
% Grabbing file location
scriptFull = matlab.desktop.editor.getActiveFilename;
% Grabbing parts of the location
scriptDir = fileparts(scriptFull);
%Moving to file location
cd(scriptDir)

addpath('../core_LHS/')

runs = 600;
for i = 1:runs
    ModelandCellGrowth
end

