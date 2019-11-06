function defaultProperties = getDefaultDeviceProperties(deviceName)
%getDefaultDeviceProperties Get the Default Lab Device specific properties
%                           for construction of object.
% Search for a default addresses of device. All default device settings
% should be stored in a json file in this folder. Always write device 
% names in the json file as lowercase.
%
%
% Parameters:
%   deviceName [string]
%
%
% Return values:
%   defaultProperties [struct]
%
% See also: defaultDeviceProperties.json (Always write device names as
% lowercase.)
%

fname = 'defaultDeviceProperties.json';
val = jsondecode(fileread(fname)); %read json file

if isfield(val.devices,deviceName) % Check if default property exists
    defaultProperties=val.devices.(deviceName);
elseif isfield(val.devices,lower(deviceName)) % Check if default property exists (All lower case characters)
    defaultProperties=val.devices.(lower(deviceName));
elseif isfield(val.devices,upper(deviceName)) % Check if default property exists (All upper case characters)
    defaultProperties=val.devices.(upper(deviceName));
else
    defaultProperties=NaN; % if not return NaN
end
