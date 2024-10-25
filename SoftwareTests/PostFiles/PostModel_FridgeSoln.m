%  Post-run script for Model_FridgeSoln.mlx
% ---- Post-run commands -----
 
clearvars -except testCase

% Discard the change to 'SimscapeLogOpenViewer'
close_system('ModelFridgeEvapCompCondSoln',0)