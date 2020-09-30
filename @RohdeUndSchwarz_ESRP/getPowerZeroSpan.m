% ======================================================================
%> @brief zero span power measurement
%>
%> currently only set up for point averaging, functionality could be extended
%>
%> @param obj Instance of RohdeUndSchwarz_ZVM class
%> @param freq center frequency in Hz (for example 5e8)
%> @param detector either "PPE" for peak, "MEAN" for mean, "RMS" for RMS, or "SDEV" for standard deviation measurement
%> @return power measured result in the currently set power Unit
% ======================================================================
function power = getPowerZeroSpan(obj, freq, detector)
    obj.setCenterFreq(freq);
    obj.setSpan(0);
    obj.setMeasBandwidth(300e3);
    obj.singleSweep();
    obj.write('SWE:TIME 200US');
    
    switch upper(detector)
        case "PPE"
            obj.write('CALC:MARK:FUNC:SUMM:PPE ON;*WAI');
            obj.write('INIT;*WAI');
            obj.write('CALC:MARK:FUNC:SUMM:PPE:RES?');
        case "MEAN"
            obj.write('CALC:MARK:FUNC:SUMM:MEAN ON;*WAI');
            obj.write('INIT;*WAI');
            obj.write('CALC:MARK:FUNC:SUMM:MEAN:RES?');
        case "RMS"
            obj.write('CALC:MARK:FUNC:SUMM:RMS ON;*WAI');
            obj.write('INIT;*WAI');
            obj.write('CALC:MARK:FUNC:SUMM:RMS:RES?');
        case "SDEV"
            obj.write('CALC:MARK:FUNC:SUMM:SDEV ON;*WAI');
            obj.write('INIT;*WAI');
            obj.write('CALC:MARK:FUNC:SUMM:SDEV:RES?');
        otherwise
            error("incorrect detector string");
    end
    power = obj.read;
    obj.continuousSweep();
end
