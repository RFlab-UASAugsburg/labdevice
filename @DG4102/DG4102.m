%> @file DG4102.m
%> @brief Rigol Function/Arbitrary Waveform Generator 
% ======================================================
%> 
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> dg4102 = DG4102("eth",... % mode
%>                   "1.1.1.1",... % IP address
%>                   1234); %port
%> dg4102.reset();
%> @endcode
% ======================================================

classdef  DG4102 < labDevice
    properties
      % Add device specific properties here
    end
   methods 
        % ======================================================================
        %> @brief DG4102 constructor
        %>
        %>
        %> @param mode Communication mode e.g. "eth" for ethernet
        %> @param varargin Variable input arguments depending on connection mode
        %>
        %> @return Instance of the DG4102 class.
        % ======================================================================
       function obj = DG4102(mode, varargin)
           obj@labDevice(mfilename, mode, varargin);
       end
        % ======================================================================
        %> @brief Delete DG4102 Object
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
        %> @param obj Instance of DG4102 class
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
        %> @param obj Instance of DG4102 class
        % ======================================================================
       function flush(obj)
           flush@labDevice(obj);
       end

        % ======================================================================
        %> @brief Write SCPI commands to labdevice
        %>
        %>
        %> @param obj Instance of DG4102 class
        %> @param txt String with SCPI commands for labdevice
        % ======================================================================
       function write(obj, txt)
           write@labDevice(obj, txt);
       end
       
   end
 
end