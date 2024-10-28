%  Post-run script for Model_Fridge.mlx
% ---- Post-run commands -----
 
clearvars -except testCase

% Discard the change to 'SimscapeLogOpenViewer'
close_system('ModelFridgeEvapCompCond',0)