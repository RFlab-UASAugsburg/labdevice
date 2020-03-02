function startupLabDeviceDrivers()
    disp('Run Initialization for LabDeviceDrivers... ')
    projectRootDir = fileparts(mfilename('fullpath'));

    addpath(fullfile(projectRootDir, 'cfg'))
    addpath(fullfile(projectRootDir, 'functions'))
    addpath(fullfile(projectRootDir, 'deviceTypes'))
    addpath(fullfile(projectRootDir, 'interfaceConverters'))
    
    javaaddpath(fullfile(projectRootDir,'functions/+customEthOverJava/java'));
    
    disp('done!')

end