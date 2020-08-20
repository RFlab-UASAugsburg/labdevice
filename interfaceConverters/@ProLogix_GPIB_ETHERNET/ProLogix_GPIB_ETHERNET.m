%> @file ProLogix_GPIB_ETHERNET.m
%> @brief ProLogix_GPIB_ETHERNET GPIB-ETHERNET (GPIB-LAN) Controller
% ======================================================
%> @brief ProLogix_GPIB_ETHERNET GPIB-ETHERNET (GPIB-LAN) Controller
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> pr = ProLogix_GPIB_ETHERNET("eth",... % mode
%>              "192.168.73.42",... % IP Address
%>              "1234"); % Port
%> dev = labDevice(deviceName,"eth2gpib",pr,GPIBAddr)
%> dev.write("hello world");
%> @endcode
% ======================================================
classdef ProLogix_GPIB_ETHERNET < labDevice    
    properties

    end
    
    methods
        % ======================================================================
        %> @brief ProLogix_GPIB_ETHERNET constructor
        %>
        %> The constructor 
        %>
        %> @param mode Communication mode, always "eth"
        %> @param ip_addr [string] IP-Address of the device
        %> @param port [int] Port of the device
        %>
        %> @return Instance of the RohdeUndSchwarz_ZVM class.
        % ======================================================================
        function obj = ProLogix_GPIB_ETHERNET(mode, ip_addr, port)
            obj@labDevice(mfilename,mode,ip_addr,port);
            obj.prop.currentGPIBAddress = 0;
        end
        % ======================================================================
        %> @brief Delete ProLogix_GPIB_ETHERNET Object
        %>
        %> The destructor 
        %>
        %> @param obj Instance of ProLogix_GPIB_ETHERNET class
        % ======================================================================
        function delete(obj)
           delete@labDevice(obj);
           % add device specific destructor from here on
        end
        % ======================================================================
        %> @brief Read data from ProLogix_GPIB_ETHERNET
        %>
        %>
        %> @param obj Instance of ProLogix_GPIB_ETHERNET class
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
        %> @param obj Instance of ProLogix_GPIB_ETHERNET class
        % ======================================================================
        function flush(obj)
           flush@labDevice(obj);
           % add device flush destructor from here on
        end
        % ======================================================================
        %> @brief Write SCPI/skippy commands to labdevice
        %>
        %>
        %> @param obj Instance of ProLogix_GPIB_ETHERNET class
        %> @param txt String with SCPI/skippy commands for labdevice
        % ======================================================================
        function write(obj, txt)
            write@labDevice(obj,txt);
        end
        
        setGPIBAddress(obj,address);
    end
end

