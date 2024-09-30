%  Pre-run script for Model_Fridge.mlx
% ---- Known Issues     -----
KnownIssuesID = ["physmod:common:simtypes:assert:Assertion","MATLAB:nonExistentField","MATLAB:MException:MultipleErrors"];
% ---- Pre-run commands -----

CollectData = @() NewCollectData();
sscexplore = @() DontOpenExplorer();

function varargout = NewCollectData()
load(fullfile(currentProject().RootFolder,"SoftwareTests","PreFiles","CyclePointsForTest.mat"),"x","y");
varargout = {x,y};
end

function DontOpenExplorer()
disp("Opening Simscape Results Explorer here...")
end