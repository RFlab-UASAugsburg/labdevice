%> @file ProLogix.m
%> @brief ProLogix GPIB-ETHERNET (GPIB-LAN) Controller
% ======================================================
%> @brief ProLogix GPIB-ETHERNET (GPIB-LAN) Controller
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> pr = ProLogix("eth",... % mode
%>              "192.168.73.42",... % IP Address
%>              "1234"); % Port
%> dev = labDevice(deviceName,"eth2gpib",pr,GPIBAddr)
%> dev.write("hello world");
%> @endcode
% ======================================================
classdef ProLogix < labDevice    
    properties

    end
    
    methods
        % ======================================================================
        %> @brief ProLogix constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode, always "eth"
        %> @param ip_addr [string] IP-Address of the device
        %> @param port [int] Port of the device
        %>
        %> @return Instance of the ZVM class.
        % ======================================================================
        function obj = ProLogix(mode, ip_addr, port)
            obj@labDevice(mfilename,mode,ip_addr,port);
            obj.prop.currentGPIBAddress = 0;
        end
        % ======================================================================
        %> @brief Delete ProLogix Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of ProLogix class
        % ======================================================================
        function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
        end
        % ======================================================================
        %> @brief Read data from ProLogix
        %>
        %>
        %> @param obj Instance of ProLogix class
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
        %> @param obj Instance of ProLogix class
        % ======================================================================
        function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
        end
        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of ProLogix class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
        function write(obj, txt)
            write@labDevice(obj,txt);
        end
        
        setGPIBAddress(obj,address);
    end
end

