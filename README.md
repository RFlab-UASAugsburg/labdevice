# LabDevice Driver Framework 

[![View Control (GPIB) instruments over ethernet on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://de.mathworks.com/matlabcentral/fileexchange/91745-control-gpib-instruments-over-ethernet) 

A open source framewok handling interactions with typical laboratory devices.
The framework consists of a communication layer and a device layer.
A bottom layer for communication that can handle GPIB, Ethernet, and GPIB-over-Ethernet communication 
is the base of the framework. On top typical SCPI (Standard Commands for Programmable Instruments) commands 
are implemented to free the user from searching through endless user manuals.
This framework can be used as stand-alone or can yield the basis for all Matlab measurement applications.

### Supported Communication Interfaces

   * `mode= "eth";`
   * `mode= "gpib";`
   * `mode= "eth2gpib"; (See: Using Interface Converter)`

### Example

**Use with Ethernet**

    mode="eth"; % Using ethernet interface for communication
    adress="192.168.1.20"; % IP address of device
    emiTestReceiver=ESPR(mode, adress);
    emiTestReceiver.setStartFreq(1e3);


**Use with GPIB**

    sigGen = SMX("gpib",... % mode
             6); % GPIB address
    sigGen.setFreq(1e7);


### Using Interface Converter

    mode= "eth2gpib"; 

Interface converters require an initialisation of the interface converter 
object first, before initialising the device class.

    % Initialising interface converter object
    interfaceConverter = ProLogix('eth',... % communication mode of converter
                                  '192.168.75.42',... % IP address of converter
                                  1234); % Port of converter
    % Pass interface converter to device constructor.
    sigGen = SMX("eth2gpib",... % communication mode 
                 interfaceConverter,... % Interface converter object
                 6); % GPIB address of device
    sigGen.setFreq(1e7);


### Repository Structure

`@labDevice`: Superclass for all lab Devices

`cfg`: Configs: Eg. default device properties

`deviceTypes`: Abstract Interface Classes for the different device types. The classes should be used to define common
interfaces for all devices of one specific type. The abstract class
assures the same method or property names over all devices of one 
device type eg. vector network analyser.

`interfaceConverters`: Contains all interface converter objects eg. eth2gpib.

`functions`: Contains all low level functionality like opening and closing connection to device.
Namespaces (contianing + in front of foldername) seperate *open* and *close* functions of the interfaces (e.g. eth or gpib). 

### Adding labdevicedrivers as a submodule

To integrate the labdevice framework in an existing repo as a submodule:

    git submodule add git@github.com:RFlab-UASAugsburg/labdevice.git

**Keep in mind:** git pull on the main repository does not update the submodule.
After git pull you need to execute 

    git submodule update --init --remote labdevicedrivers

to update the submodule after running git pull.

### Documentation
You can find matlabDoxygen Documentation in doc/html.
Until now doxygen must be run offline. 
Run 

    doxygen Doxyfile

in the folder doc/doxymatlab/.
We use doxymatlab: Copyright (c) 2009, Fabrice All rights reserved.
http://www.mathworks.com/matlabcentral/fileexchange/25925-using-doxygen-with-matlab/

### Contribute
See our [Development Guidelines](./doc/developmentGuidelines.md)
