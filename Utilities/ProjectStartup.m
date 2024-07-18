function ProjectStartup
% Set up check for version number
proj = currentProject;

% Set up check for version number
releaseInfo = matlabRelease;
str = "This is release " + releaseInfo.Release + ",";
if isMATLABReleaseOlderThan("R2022b")
        disp(str + " so it may not run this example which was built in R2022b.")
    elseif isMATLABReleaseOlderThan("R2023a")
        addpath(fullfile(proj.RootFolder,"Models","Models22b"))
    else
        % Fix path to run R2023a files
        addpath(fullfile(proj.RootFolder,"Models","Models23a"))
    disp(str + " and this was designed using R2022b.")
    disp("If you find errors, please report them to onlineteaching@mathworks.com")
    addpath(fullfile(proj.RootFolder,"Models","Models23a"))
end

% Address changes in the MATLAB language and capabilities
MoveFilesAround("R2023b","MainMenu.mlx",proj)
MoveFilesAround("R2023b","README.mlx",proj)
MoveFilesAround("R2024a","BuildRefrigerator.mlx",proj,OldStr="23b",NewStr="24a")


% Offer navigation aids and feedback opportunities
ProjectStartupApp
end

function MoveFilesAround(ReleaseString,FileString,proj,opts)
arguments
    ReleaseString (1,1) string {mustBeRelease}
    FileString (1,1) string {mustLookLikeFile}
    proj 
    opts.OldStr (1,1) string = "Old"
    opts.NewStr (1,1) string = "New"
    opts.Flag (1,1) string {mustBeMember(opts.Flag,["Open" "Close"])} = "Open"
end

if ~contains(ReleaseString,"R")
    ReleaseString = "R"+ReleaseString;
end
[FileLoc,FileName,FileExt] = fileparts(which(FileString));

if isMATLABReleaseOlderThan(ReleaseString)
    FileStringOld = FileName+opts.OldStr+FileExt;
    FileStringNew = FileName+opts.NewStr+FileExt;
    FileString = string(FileName)+FileExt;
    try
        if opts.Flag == "Open"
            if exist(fullfile(proj.RootFolder,"Utilities","OldVersions",FileStringOld),"file")
                movefile(fullfile(FileLoc,FileString), fullfile("Utilities","OldVersions",FileStringNew))
                movefile(fullfile("Utilities","OldVersions",FileStringOld),fullfile(FileLoc,FileString))
            end
        else
            if exist(fullfile(proj.RootFolder,"Utilities","OldVersions",FileStringNew),"file")
                movefile(fullfile(FileLoc,FileString), fullfile("Utilities","OldVersions",FileStringOld))
                movefile(fullfile("Utilities","OldVersions",FileStringNew),fullfile(FileLoc,FileString))
            end
        end
    catch
        disp("Failed to move " + FileString + ".")
    end
end
end

function mustBeRelease(str)
if ~contains(str,"R")
    str = "R"+str;
end
pattern = "R"+digitsPattern(4)+("a"|"b");
assert(matches(str,pattern),"ReleaseString must be a valid MATLAB release.")
end

function mustLookLikeFile(str)
[~,f,e] = fileparts(str);
assert(~isempty(f))
assert(e==".mlx"|e==".m"|e==".slx")
end