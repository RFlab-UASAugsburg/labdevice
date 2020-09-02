% ====================================================
%> @brief set the channel acquisition arithmetics
%>
%> @param obj Instance of class
%>
%> @param arith one of these arithmetic strings:
%>  Disabled:  'OFF' acquisition according to the AcquisitionType
%>  Envelope:  'ENV'
%>  Averaging: 'AVER'
% =====================================================

function setAcquisitionArithmetic(obj,arith)
    ariths = {'OFF','ENV','AVER'};
    arith = upper(arith);
        if any(strcmp(ariths,arith))
            write(obj,"CHAN:ARIT "+arith);
        else
            error("types can only be" + string(join(ariths)));
        end
end