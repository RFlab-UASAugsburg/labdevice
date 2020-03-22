%> @file VectorNetworkAnalyser.m
%> @brief Abstract Interface Class for Vector Network Analyzers
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
%> classdef  ZVM < labDevice & VectorNetworkAnalyser
%> @endcode
% ======================================================
classdef  VectorNetworkAnalyser
    properties
      % Add device type specific properties here
    end
   methods (Abstract)
       % ====================================================
       %> @brief Set output power level of VNA
       %>
       %> @param obj Instance of class
       %> @param pow Power level [dBm]
       %> 
       %> @return obj Instance of class
       % =====================================================
      setSourcePower(obj,pow)

       % ====================================================
       %> @brief Set start frequency of vna sweep
       %>
       %> @param obj Instance of class
       %> @param freq Frequency [Hz]
       %> 
       %> @return obj Instance of class
       % =====================================================
      setStartFreq(obj, freq)
          
       % ====================================================
       %> @brief Set stop frequency of vna sweep
       %>
       %> @param obj Instance of class
       %> @param freq Frequency [Hz]
       %> 
       %> @return obj Instance of class
       % =====================================================
      setStopFreq(obj, freq)
      
      % ====================================================
       %> @brief get the measured complex values
       %>
       %> @param obj Instance of class
       %> 
       %> @return n x 1 complex column vector
       % =====================================================
      trace = getTraceCmplx(obj)
      
      % ====================================================
       %> @brief get the number of measurement points
       %>
       %> @param obj Instance of class
       %> 
       %> @return int number of points
       % =====================================================
      sweepPoints = getSweepPoints(obj)
      
       % ====================================================
       %> @brief set the number of measurement points
       %>
       %> @param obj Instance of class
       %> @param sweepPoints int
       %> 
       %> @return obj Instance of class
       % =====================================================
      setSweepPoints(obj,sweepPoints)
      
      % ====================================================
       %> @brief set the measurement Parameter
       %>
       %> @param obj Instance of class
       %> @param param Measurement Parameter string, e.g. "S11" or "Z21"
       %> 
       %> @return obj Instance of class
       % =====================================================
      setMeasParameter(obj,param)
      
      % ====================================================
       %> @brief set device to single sweep mode
       %>
       %> @param obj Instance of class
       %> 
       %> @return obj Instance of class
       % =====================================================
      singleSweep(obj)
      
      % ====================================================
       %> @brief set device to continuous sweep mode
       %>
       %> @param obj Instance of class
       %> 
       %> @return obj Instance of class
       % =====================================================
      continuousSweep(obj)
      
      % ====================================================
       %> @brief initiate/trigger a measurement/sweep
       %>
       %> @param obj Instance of class
       %> 
       %> @return obj Instance of class
       % =====================================================
      doSweep(obj)
   end
 
end