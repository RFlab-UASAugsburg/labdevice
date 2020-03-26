% ======================================================================
%> @brief read data from the adapter
%>
%> @param obj Instance of labDevice class
%> @return ret read data as a single character array
% ======================================================================
function ret = read(obj)
	obj.prop.adapter.write("++read eoi");
	pause(0.01);
	ret = obj.prop.adapter.read();
end