function peakSearch (obj, margin, method, no, noPeak)
%
% At the moment, all peakSearch commands are in this function.
% Should it be seperated?
%
%
%
% Parameters:
%   obj.prop:     labDevice Handle with properties
%                - mode
%                - address
%                - port
%                - prop.comm(unication)Handle (interface specific)
%
%   margin:     span [dC]
%                 Range: -200 dB to 200 dB
%
%   method:     method [String]
%                 'SUBR' (Divides the scan range into smaller subranges and looks for a particular number of peaks in each subrange.)
%                 'PEAK' (Looks for a particular number of peaks over the complete scan range. [1 to 500])
%
%   no:         number [int]
%                 1 - 50  (subranges)
%                 1 - 500 (peaks)
%
%   noPeak:     number of peaks per subrange [int]
%               in case of searching without subranges, this parameter
%
% Return values:
%   /
%
% See also:
%

if (no ~= 0)
    write(obj, ['CALC:PSE:IMM']); % initiates a peak search and creates a peak list

    write(obj, ['CALC:PSE:MARG ', num2str(margin), ' dB']); % margin / span

    switch method
        case 'SUBR'
            write(obj, ['CALC:PSE:METH SUBR']);                         % select subranges
            write(obj, ['CALC:PSE:SUBR ', num2str(no)]);                % number of subranges
            if (noPeak ~= 0)
                write(obj, ['CALC:PSE:SUBR:PCO ', num2str(noPeak)]);    % number of peaks per subrange
            end
        case 'PEAK'
            write(obj, ['CALC:PSE:PEAK']);                              % peak search without subranges
            write(obj, ['CALC:PSE:SUBR ', num2str(no)]);                % number of peaks
    end
else
    error('Input parameter not correct!');
end
end