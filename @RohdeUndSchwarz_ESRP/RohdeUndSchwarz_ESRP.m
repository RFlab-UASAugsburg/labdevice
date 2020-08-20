%> @file RohdeUndSchwarz_ESRP.m
%> @brief Rhode und Schwarz RohdeUndSchwarz_ESRP EMI Test Receiver
% ======================================================
%> @brief Rhode und Schwarz RohdeUndSchwarz_ESRP EMI Test Receiver with 
%>        Time-Domain and Frequency-Domain measurement capabilities
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> esrp = RohdeUndSchwarz_ESRP("eth",... % mode
%>                   "1.1.1.1",... % IP address
%>                   1234); %port
%> esrp.reset();
%> @endcode
% ======================================================

classdef  RohdeUndSchwarz_ESRP < labDevice
    properties
      % Add device specific properties here
    end
   methods 
        % ======================================================================
        %> @brief RohdeUndSchwarz_ESRP constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode e.g. "eth" for ethernet
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the RohdeUndSchwarz_ESRP class.
        % ======================================================================
       function obj = RohdeUndSchwarz_ESRP(mode, varargin)
           obj@labDevice(mfilename, mode, varargin);
       end
        % ======================================================================
        %> @brief Delete RohdeUndSchwarz_ESRP Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of class
        % ======================================================================
       function delete(obj)
           delete@labDevice(obj);
       end
       % All functions that are inheritanced methods of the superclass
       % labDevice need to be initalised here once more.

        % ======================================================================
        %> @brief Read data from labdevice
        %>
        %>
        %> @param obj Instance of RohdeUndSchwarz_ESRP class
        %>
        %> @return ret Data read from device
        % ======================================================================
       function ret = read(obj)
           ret = read@labDevice(obj);
       end

        % ======================================================================
        %> @brief Flush labdevice
        %>
        %>
        %> @param obj Instance of RohdeUndSchwarz_SMX class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
       end

        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of RohdeUndSchwarz_ESRP class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
       end
       
   end
 
end