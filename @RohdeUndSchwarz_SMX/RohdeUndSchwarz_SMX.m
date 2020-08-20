%> @file RohdeUndSchwarz_SMX.m
%> @brief Rhode und Schwarz RohdeUndSchwarz_SMX Signal Generator
% ======================================================
%> @brief Rohde und Schwarz Signal generator with AM, FM and pulse
%> modulation.
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> sigGen = RohdeUndSchwarz_SMX("gpib",... % mode
%>              6); % GPIB address
%> sigGen.setFreq(1e7);
%> @endcode
% ======================================================
classdef  RohdeUndSchwarz_SMX < labDevice & SignalGenerator
    properties
      % Add device specific properties here
    end
   methods 
        % ======================================================================
        %> @brief RohdeUndSchwarz_SMX constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode e.g. "eth" for ethernet
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the RohdeUndSchwarz_SMX class.
        % ======================================================================
       function obj = RohdeUndSchwarz_SMX(mode, varargin)
           obj@labDevice(mfilename, mode, varargin);
           % add device specific constructor from here on
       end
        % ======================================================================
        %> @brief Delete RohdeUndSchwarz_SMX Object
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
        %> @param obj Instance of RohdeUndSchwarz_SMX class
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
        %> @param obj Instance of RohdeUndSchwarz_SMX class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
       end
        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of RohdeUndSchwarz_SMX class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
           % add device write destructor from here on
       end
       
   end
 
end