%  Pre-run script for Model_Fridge.mlx
% ---- Known Issues     -----
KnownIssuesID = "physmod:common:simtypes:assert:Assertion";
% ---- Pre-run commands -----

CollectData = @() NewCollectData();

function varargout = NewCollectData()
load(fullfile(currentProject().RootFolder,"SoftwareTests","PreFiles","CyclePointsForTest.mat"),"x","y");
varargout = {x,y};
end