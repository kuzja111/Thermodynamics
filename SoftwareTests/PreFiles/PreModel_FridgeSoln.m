%  Pre-run script for Model_Fridge.mlx
% ---- Known Issues     -----
KnownIssuesID = "";
% ---- Pre-run commands -----
evalin('base','evaporatorParams')
evalin('base','condenserParams')
evalin('base','compressorParams')
evalin('base','valveParams')
assignin('base','p0','1018.4')

% Liquid and vapor densities at 40 degC
rho_l = 1034;    % [kg/m^3]
rho_v = 57.75;   % [kg/m^3]

% Target density
rho_ref = 200;   % [kg/m^3]

% Set up and solve for x0 for the target density
fun = @(x)rho_ref-1/(x/rho_v + (1-x)/rho_l);
x0 = fzero(fun, 0.5);

assignin('base','x0',x0)

open_system('ModelFridgeEvapCompCondSoln')
set_param('ModelFridgeEvapCompCondSoln','SimscapeLogOpenViewer', 'off')

CollectData = @() NewCollectData();
sscexplore = @() DontOpenExplorer();
% sim = @(x,varargin) SimNoViewer(x,varargin);
% 
% function out = SimNoViewer(mdl,varargin)
% p1 = get_param(mdl,"SimscapeLogOpenViewer");
% set_param(mdl, 'SimscapeLogOpenViewer', 'off')
% out = sim(mdl,varargin{:});
% set_param(mdl,"SimscapeLogOpenViewer",p1)
% end

function varargout = NewCollectData()
load(fullfile(currentProject().RootFolder,"SoftwareTests","PreFiles","CyclePointsForTest.mat"),"x","y");
varargout = {x,y};
end

function DontOpenExplorer()
disp("Opening Simscape Results Explorer here...")
end