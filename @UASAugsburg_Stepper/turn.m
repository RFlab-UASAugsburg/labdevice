% ======================================================================
%> @brief turn the motor by deg degrees
%>
%> @param obj Instance of UASAugsburg_Stepper class
%> @param deg Angle in degrees
% ======================================================================
function turn(obj,deg)
% References:
% 9-8 linksdrehung 10-11 rechtsdrehung
% Schrittmotor dreht bei Änderung des LSB von Low --> High

%% Motor Drehen
    rot_steps=deg/0.072;

    if (abs(rot_steps)/2)>=1
        n_rot_steps = floor(abs(rot_steps/2));
        if rot_steps > 0 %Ganzschrittdrehung rechts 0001->0000
            n='0';
            m='1';
             %       i=-2;
        elseif rot_steps < 0 % Ganzschrittdrehung links 0011->0010
            n='2';
            m='3';
            %        i=+2;
        end

    obj.write("SOUR:DIG:DATA:BYTE " + n +", (@101)");
    pause(0.2);
        for l=1:n_rot_steps
        %pause(0.5)
        obj.write("SOUR:DIG:DATA:BYTE "+m+", (@101)");
        pause(0.011)
        obj.write("SOUR:DIG:DATA:BYTE "+n+", (@101)");
        pause(0.011)
     
        end
        obj.write('*OPC?');
        obj.read();
    end

    if mod(rot_steps,2)==1

        if rot_steps > 0
            n='8';
            m='9';
        elseif rot_steps < 0
            n='10';
            m='11';
         end

        obj.write("SOUR:DIG:DATA:BYTE " + m + ", (@101);*WAI");
        obj.write("*OPC?");
        obj.read();
        obj.write("SOUR:DIG:DATA:BYTE " + n + ", (@101);*WAI");
        obj.write("*OPC?");
        obj.read();
    end
end