function startupLabDeviceDrivers()
    disp('Run Initialization for LabDeviceDrivers... ')
    projectRootDir = fileparts(mfilename('fullpath'));

    addpath(fullfile(projectRootDir, 'cfg'))
    addpath(fullfile(projectRootDir, 'functions'))

end