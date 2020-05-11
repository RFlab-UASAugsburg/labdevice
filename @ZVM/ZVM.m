%> @file ZVM.m
%> @brief Rhode und Schwarz ZVM Vector Signal Analyzer
% ======================================================
%> @brief Rohde und Schwarz ZVM Vector Signal Analyzer
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> zvm = ZVM("gpib",... % mode
%>              6); % GPIB address
%> zvm.singleSweep();
%> trace = zvm.getTraceCmplx(1,zvm.getSweepPoints);
%> @endcode
% ======================================================
classdef  ZVM < labDevice & VectorNetworkAnalyser
                                                
    properties
      % Add device specific properties here
    end
   methods
        % ======================================================================
        %> @brief ZVM constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode e.g. "gpib" for gpib
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the ZVM class.
        % ======================================================================
       function obj = ZVM(mode, varargin)
           obj@labDevice(mfilename,mode, varargin);
           % add device specific constructor from here on
       end
        % ======================================================================
        %> @brief Delete ZVM Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of ZVM class
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
        %> @param obj Instance of ZVM class
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
        %> @param obj Instance of ZVM class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
       end
        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of ZVM class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
           % add device write destructor from here on
       end
       
   end
 
end