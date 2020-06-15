%> @file RTM3000.m
%> @brief Rhode und Schwarz Digital Oscilloscope 
% ======================================================
%> 
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> rtm3000 = RTM3000("eth",... % mode
%>                   "1.1.1.1",... % IP address
%>                   1234); %port
%> rtm3000.reset();
%> @endcode
% ======================================================

classdef  RTM3000 < labDevice
    properties
      % Add device specific properties here
    end
   methods 
        % ======================================================================
        %> @brief RTM3000 constructor
        %>
        %>
        %> @param mode Communication mode e.g. "eth" for ethernet
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the RTM3000 class.
        % ======================================================================
       function obj = RTM3000(mode, varargin)
           obj@labDevice(mfilename, mode, varargin);
       end
        % ======================================================================
        %> @brief Delete RTM3000 Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of class
        % ======================================================================
       function delete(obj)
           delete@labDevice(obj);
       end
        % ======================================================================
        %> @brief Read data from labdevice
        %>
        %>
        %> @param obj Instance of RTM3000 class
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
        %> @param obj Instance of RTM3000 class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
       end

        % ======================================================================
        %> @brief Write SCPI commands to labdevice
        %>
        %>
        %> @param obj Instance of RTM3000 class
        %> @param txt String with SCPI commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
       end
       
   end
 
end