%> @file SignalGenerator.m
%> @brief Abstract Interface Class for Signal Generators
% ======================================================
%> @brief This is an abstract class. It should be used as a common
%> interface for all devices of the subclass. The abstract class
%> assures the same method or property names over all devices of one
%> device type.
%>
%> Usage:
%
%> Initalise subclass
%> @code
%> classdef  RohdeUndSchwarz_SMX < labDevice & SignalGenerator
%> @endcode
% ======================================================
classdef  SignalGenerator
    properties
      % Add device type specific properties here
    end
   methods (Abstract)
       % ====================================================
       %> @brief Set output power level of signal generator
       %>
       %> @param obj Instance of class
       %> @param pow Power level [dBm]
       % =====================================================
      setPower(obj,pow)

       % ====================================================
       %> @brief Disable the output of signal generator
       %>
       %> @param obj Instance of class
       % =====================================================
      outputDisable(obj)
      
       % ====================================================
       %> @brief Set output frequency of signal generator
       %>
       %> @param obj Instance of class
       %> @param freq Frequency [Hz]
       % =====================================================
      setFreq(obj, freq)
       
   end
 
end