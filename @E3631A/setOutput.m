function setOutput(obj, output)
%SE Select the output to be programmed
%   subsequent calls to functions without specifying an output will now use
%   the one given here.
%   output: string or char array, one of these:
%   P6V:    6V rail
%   P25V:   25V rail
%   N25V:   -25V rail
obj.write("INST " + output);
end

