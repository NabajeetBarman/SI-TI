% SI TI calculation function for 10-bit YUV, 4:2:0 chroma-subsampling videos.
% Only the Luminance (Y) component is taken into account for SI TI calculation
% The .mat files are saved in the current directory which can be used
% later for per-frame SI TI calculations and other analysis.
% Author: Nabajeet Barman, Kingston University, London.
% Email:  n.barman@ieee.org; nabajeetbarman4@gmail.com

function [SI, TI] = SITI_10bit(sequence_name, R, C)

fp = fopen(sequence_name, 'r');
if fp == -1
    error(['Sequence ' sequence_name ' does not exist']);
end
byte4frame = 2*R*C*1.5;     %(for 4:2:0)
byte4chroma = 2*R*C*0.5;    %(for 4:2:0) 

%   Compute the number of video frames

    fseek(fp, 0, 'eof');
    F = ftell(fp)/(byte4frame);
    fseek(fp, 0, 'bof');

    %   Compute the Sobel window needed for SI computation
    h = fspecial('sobel');

%   Output vectors declaration
    SI_array = zeros(F, 1);
    TI_array = zeros(F, 1);
    fprintf('Frame to be processed %d\n', F)
    indicator = floor(F/10);

%   SI and TI processing loop
for f = 1:F
    if rem(f-1, indicator) == 0
        fprintf('.');
    end
    %   Read current frame
    Y = fread(fp, [C R], 'uint16');
    
    %   Skip chroma components
    fseek(fp, byte4chroma, 'cof');
    
    %   Spatial information
    hor_edge = imfilter(Y, h);
    vert_edge = imfilter(Y, h');    
    SI_array(f) = std(sqrt(hor_edge(:).^2 + vert_edge(:).^2));
    %   Temporal information
    if f > 1
        D = Y - Y_prev;
        TI_array(f) = std(D(:));
    end
    Y_prev = Y;
end

SI = max(SI_array);
TI = max(TI_array);
fname = sprintf('%s.mat', sequence_name);
save(fname);
fclose(fp);
fprintf('\n');