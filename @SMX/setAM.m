function setAM(obj,mode,varargin)
%SETAM control SMX amplitude modulation
%   mode: 'INT': use internal modulation, specify AF in Hz and modulation
%               index in %
%         'EXT': use external modulation
%         'OFF': disable AM modulation
switch upper(mode)
    case 'INT'
        af = varargin{1};
        index = varargin{2};
        obj.write("AF "+af+"HZ");
        obj.write("AF:ON");
        obj.write("AM:I");
        obj.write("AM "+index+"%");
    case 'EXT'
        obj.write("AM:E");
        obj.write("AF:OFF");
    case 'OFF'
        obj.write("AM:OFF");
end
end
