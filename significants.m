function [dt] = significants(number)
%SIGNIFICANTS determines how small dt needs to be in order to be as precise
%as possible while not being too precise.(measure more than needed)

dt_test = strsplit(num2str(number),'.'); %https://nl.mathworks.com/matlabcentral/answers/347325-find-the-precision-of-a-value
if size(dt_test,2)==1 %https://nl.mathworks.com/matlabcentral/answers/16383-how-do-i-check-for-empty-cells-within-a-list
    dt = 0.1;            %small step in order to prevent slope at beginning 
    %-> see schuinehelling.eps and schuinehellinggefixt.eps
else
    dt=1*10^(-1*numel(dt_test{2}));
end
end

