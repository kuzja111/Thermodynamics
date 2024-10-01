%  Pre-run script for BuildRefrigerator.mlx
% ---- Known Issues     -----
KnownIssuesID = ["physmod:common:simtypes:assert:Assertion","physmod:simscape:simtypes:assert:Assertion"];
% ---- Pre-run commands -----

sim = @(varargin) SimNoViewer(varargin);

function out = SimNoViewer(varargin)
mdl = varargin{1}{1};
p1 = get_param(mdl,"SimscapeLogOpenViewer");
set_param(mdl, 'SimscapeLogOpenViewer', 'off')
out = sim(mdl,varargin{2:end});
set_param(mdl,"SimscapeLogOpenViewer",p1)
end

% sscexplore = @(x) DontOpenExplorer(x);
% 
% function DontOpenExplorer(varargin)
% disp("Opening Simscape Results Explorer here...")
% end