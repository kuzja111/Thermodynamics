function ProjectStartup
% Set up check for version number
releaseInfo = matlabRelease;
str = "This is release " + releaseInfo.Release + ",";
if isMATLABReleaseOlderThan("R2022b")
    disp(str + " so it may not run this example which was built in R2022b.")
else
    disp(str + " and this was designed using R2022b.")
    disp("If you find errors, please report them to onlineteaching@mathworks.com")
end


% Offer navigation aids and feedback opportunities
ProjectStartupApp
end
