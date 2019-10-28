function defaultProperties = searchDefaultDeviceProperties(deviceName)
%
% Search for a default addresses of device. All default device settings
% should be stored in a json file in this folder.
%
%
%
% Parameters:
%   deviceName [string]
%
%
% Return values:
%   defaultProperties [struct]
%
% See also: defaultDeviceProperties.json
%

fname = 'defaultDeviceProperties.json';
val = jsondecode(fileread(fname)); %read json file

if isfield(val.devices,deviceName) % Check if default property exists
    defaultProperties=val.devices.(deviceName);
else
    defaultProperties=NaN; % if not return NaN
end
