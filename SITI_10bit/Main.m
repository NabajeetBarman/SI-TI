% Main matlabl script to call the SI TI calculation function, SITI_10bit 
% for 10-bit YUV, 4:2:0 chroma-subsampling videos.
% Calling this script will calculate the SI TI vals for all .yuv videos of a particular resolution in
% the same folder. However, the script could be modified to include videos for different resolutions. 

% The output results are stored in the SITIVals.csv file.
% Only the Luminance (Y) component is taken into account for SI TI calculation
% The .mat files are saved in the current directory which can be used
% later for per-frame SI TI calculations and other analysis.
 
% Author: Nabajeet Barman, Kingston University, London.
% Email:  n.barman@ieee.org; nabajeetbarman4@gmail.com

clear
close all
clc
fns = dir('*.yuv');
% Assuming a video of 4096x2160 resolution
video_height = 2160; 
video_width = 4096;

out_fid = fopen( 'SITIVals.csv', 'w' );
fprintf( out_fid, '%s, %s, %s\n', 'Sequence Name', 'SI', 'TI');

for i = 1:length(fns)
    fid = fopen(fns(i).name);
    %[SI, TI] = SITI_10bit(fns(i).name,video_height,video_width);
    fprintf( out_fid, '%s,%d, %d\n', fns(i).name, SI, TI);
    fclose(fid);
end