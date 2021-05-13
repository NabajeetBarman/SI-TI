% Main matlabl script to call the SI TI calculation function, SITI_8bit for 8-bit YUV, 4:2:0 chroma-subsampling videos.
% #################################### Input  ###########################
% Calling this script will calculate the SI TI vals for all .yuv videos of a particular resolution in
% the same folder. However, the script could be modified to include videos for different resolutions. 
% There is support for both Full Range YUV files as well as Limited Range YUV files (in 8-bit Limited Range YUV files, pixel values
% are in the range from 16-235).
%##################################### Output ############################
    % The output results are stored in the SITIVals.csv file.
    % Only the Luminance (Y) component is taken into account for SI TI calculation
    % The .mat files are saved in the current directory which can be used
    % later for per-frame SI TI calculations and other analysis.
%########################################################################
% Author: Nabajeet Barman, Kingston University, London.
% Email:  n.barman@ieee.org; nabajeetbarman4@gmail.com
%########################################################################

clear
close all
clc
fns = dir('*.yuv'); % assumes YUV videos to be present in the same directory as this script

% Assuming a video of 4096x2160 resolution
video_height = 2160; 
video_width = 4096;
% Full Range or Limited Range, default is Limited Range
Range = 1; % 0 --> Limited Range, 1 -- Full Range (default)
out_fid = fopen( 'SITIVals.csv', 'w' );
fprintf( out_fid, '%s, %s, %s\n', 'Sequence Name', 'SI', 'TI');

for i = 1:length(fns)
    fid = fopen(fns(i).name);
    [SI, TI] = SITI_8bit(fns(i).name,video_height,video_width, Range);
    fprintf( out_fid, '%s,%d, %d\n', fns(i).name, SI, TI);
    fclose(fid);
end