% ====================================================
%> @brief Defines the equation for the selected math waveform
%>
%> @param obj Instance of class
%>
%> @param waveform_nr selected math waveform (e.g. MATH1 <- 1)
%>
%> @param varargin source channel(s) for the math operation
%> Syntax: Channels: "CH1"
%>         Operations: "ADD"
%>         Constant value(for low/high pass): 1E6 
%>
%> @param operation desired math operation to be calculated
%>  possible operations: 
%>  Operation       Operation string    Comment
%>  Addition        ADD                 Two source input channels are needed
%>  Subtraction     SUB                 Two source input channels are needed         
%>  Multiplication  MUL                 Two source input channels are needed
%>  Division        DIV                 Two source input channels are needed
%>  Square          SQR
%>  Square Root     SQRT
%>  Absolute value  ABS
%>  Reciprocal      REC
%>  Inverse         INV
%>  Com. logarithm  LOG                 Basis 10 
%>  Nat. logarithm  LN                  Basis e 
%>  Derivative      DERI
%>  Integral        INT
%>  IIR low pass    IIRL                Source waveform and constant cut-off freq. value are needed
%>  IIR high pass   IIRH                Source waveform and constant cut-off freq. value are needed
%>  FFT             FFTMAG              FFT function of the source waveform  
%> 
% =====================================================

function defineMathChannelOperation(obj, waveform_nr, operation, varargin)
    operation = upper(operation);
    possibleOperations = {'ADD','SUB','MUL','DIV','SQR','SQRT','ABS','REC','INV','LOG','LN','DERI','INT','IIRL','IIRH','FFTMAG',};
    if any(strcmp(possibleOperations,operation))
        if nargin > 5
            error("too many input arguments");
        elseif nargin > 4
            switch operation
                case "ADD"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "ADD('+varargin{1}+","+varargin{2}+')"');
                case "SUB"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "SUB('+varargin{1}+","+varargin{2}+')"');
                case "MULT"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "MULT('+varargin{1}+","+varargin{2}+')"');
                case "DIV"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "DIV('+varargin{1}+","+varargin{2}+')"');
                case "IIRL"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "IIRL('+varargin{1}+","+varargin{2}+')"');
                case "IIRH"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "IIRH('+varargin{1}+","+varargin{2}+')"');
            end
        elseif nargin > 3
            switch operation
                case "SQR"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "SQR('+varargin{1}+')"');
                case "SQRT"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "SQRT('+varargin{1}+')"');
                case "ABS"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "ABS('+varargin{1}+')"');
                case "REC"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "REC('+varargin{1}+')"');
                case "INV"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "INV('+varargin{1}+')"');
                case "LOG"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "LOG('+varargin{1}+')"');
                case "LN"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "LN('+varargin{1}+')"');
                case "DERI"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "DERI('+varargin{1}+')"');
                case "INT"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "INT('+varargin{1}+')"');
                case "FFT"
                    write(obj,"CALC:MATH"+waveform_nr+':EXPR:DEF "FFTMAG('+varargin{1}+')"');
            end
        else
            error("not enough input arguments");
        end

    else
       error("math operations can only be" + string(join(possibleOperations))); 
    end
end
    





