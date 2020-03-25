%> @file Stepper.m
%> @brief UASA Antenna test chamber stepper
% ======================================================
%> @brief Data acquisition unit with some custom hardware added to create a precice rotatable table
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> stepper = SStepper("gpib",... % mode
%>              6); % GPIB address
%> stepper.nullpos(); %point the antenna in a certain direction
%> stepper.turn(360); %turn the table by 360 degrees
%> @endcode
% ======================================================
classdef  Stepper < labDevice
    properties
      % Add device specific properties here
    end
   methods 
        % ======================================================================
        %> @brief Stepper constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode e.g. "gpib" for gpib
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the Stepper class.
        % ======================================================================
       function obj = Stepper(mode, varargin)
           obj@labDevice(mfilename,mode, varargin);
           % add device specific constructor from here on
       end
        % ======================================================================
        %> @brief Delete Stepper Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of class
        % ======================================================================
       function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
       end
       
       % All functions that are inheritanced methods of the superclass
       % labDevice need to be initalised here once more.
        % ======================================================================
        %> @brief Read data from labdevice
        %>
        %>
        %> @param obj Instance of Stepper class
        %>
        %> @return ret Data read from device
        % ======================================================================
       function ret = read(obj)
           ret = read@labDevice(obj);
           % add device specific read from here on
       end
        % ======================================================================
        %> @brief Flush labdevice
        %>
        %>
        %> @param obj Instance of Stepper class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
       end
        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of Stepper class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
           % add device write destructor from here on
       end
       
   end
 
end