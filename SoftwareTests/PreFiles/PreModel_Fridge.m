%  Pre-run script for Model_Fridge.mlx
% ---- Known Issues     -----
KnownIssuesID = ["physmod:common:simtypes:assert:Assertion","MATLAB:nonExistentField","MATLAB:MException:MultipleErrors"];
% ---- Pre-run commands -----
evalin('base','evaporatorParams')
evalin('base','condenserParams')
evalin('base','compressorParams')
evalin('base','valveParams')
assignin('base','p0','1018.4')

open_system('ModelFridgeEvapCompCond')
set_param('ModelFridgeEvapCompCond','SimscapeLogOpenViewer', 'off')
CollectData = @() NewCollectData();
sscexplore = @() DontOpenExplorer();

function varargout = NewCollectData()
load(fullfile(currentProject().RootFolder,"SoftwareTests","PreFiles","CyclePointsForTest.mat"),"x","y");
varargout = {x,y};
end

function DontOpenExplorer()
disp("Opening Simscape Results Explorer here...")
end