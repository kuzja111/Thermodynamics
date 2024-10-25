function [x,y] = CollectData()
% axes('position',[0 0 1 1]);
imshow("ThermEntropy.png");
% str = ["Select sensor values around the diagram by clicking and then double-click ", ...
%     "to finish data collection. Close the figure window to return to the script."];
% annotation("textbox",[.05 .9 .1 .1],"String",str,"FitBoxToText","on")
ax = gca;
roi = drawpolygon(ax);
x = roi.Position(:,1);
y = roi.Position(:,2);
close(gcf)
end