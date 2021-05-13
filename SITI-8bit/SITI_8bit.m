% SI TI calculation function for 8-bit YUV, 4:2:0 chroma-subsampling videos.
% Only the Luminance (Y) component is taken into account for SI TI calculation
% The .mat files are saved in the current directory which can be used
% later for per-frame SI TI calculations and other analysis.
% Author: Nabajeet Barman, Kingston University, London.
% Email:  n.barman@ieee.org; nabajeetbarman4@gmail.com

function [SI, TI] = SITI_8bit(sequence_name, R, C, Range)
err_status = 0;
if Range == 0
    disp('You have mentioned YUV file to be Limited Range')
    disp("Frame pixel values will be converted to Full Range before SI TI calculation")
elseif Range == 1
     disp('You have mentioned YUV file to be Full Range')
end
fp = fopen(sequence_name, 'r');
if fp == -1
    error(['Sequence ' sequence_name ' does not exist']);
end
byte4frame = R*C*1.5;     %(for 4:2:0)
byte4chroma = R*C*0.5;    %(for 4:2:0) 

%   Compute the number of video frames

    fseek(fp, 0, 'eof');
    F = ftell(fp)/(byte4frame);
    fseek(fp, 0, 'bof');

    %   Compute the Sobel window needed for SI computation
    h = fspecial('sobel');

%   Output vectors declaration
    SI_array = zeros(F, 1);
    TI_array = zeros(F, 1);
    fprintf('Frames to be processed %d\n', F)
    indicator = floor(F/10);

%   SI and TI processing loop
for f = 1:F
    if rem(f-1, indicator) == 0
        fprintf('.');
    end
    %   Read current frame
    Y = fread(fp, [C R], 'uint8');

    %   Skip chroma components
    fseek(fp, byte4chroma, 'cof');

    % Limited Range - Normalize
    if Range == 0
        if min(Y(:))<  16 || max(Y(:)) > 235
            err_status = 1;
        end
        Y = round((Y-16) /((235 -16)/255));
    elseif Range == 1
        if min(Y(:))> 15 || max(Y(:)) < 236
            err_status = 2;
        end    
    end   
    %   Spatial information
    hor_edge = imfilter(Y, h);
    vert_edge = imfilter(Y, h'); 
    % Discard the first and last rows and columns to avoid unwanted edge effects - for details see ITU-T Rec P.910, Page 20
    hor_edge_dis = hor_edge(2:end-1,2:end-1);
    vert_edge_dis = vert_edge(2:end-1,2:end-1);
    SI_array(f) = std(sqrt(hor_edge_dis(:).^2 + vert_edge_dis(:).^2));% 
    %   Temporal information
    if f > 1
        D = Y - Y_prev;
        D_dis = D(2:end-1,2:end-1);
        TI_array(f) = std(D_dis(:));
    end
    Y_prev = Y;
end
SI = max(SI_array);
TI = max(TI_array);
fname = sprintf('%s.mat', sequence_name);
save(fname);
fclose(fp);
fprintf('\n');

if err_status == 1
   disp('You mentioned YUV file to be Limited Range')
   disp("However your input appears to be of Full Range")
   disp("Consider running the Main script in FR mode instead of LR for correct results")
   disp("#######################################################")
elseif err_status == 2
   disp('You mentioned YUV file to be Full Range')
   disp("However your input appears to be of Limited Range")
   disp("Consider running the Main script in LR mode instead of FR mode for correct results")
   disp("#######################################################")
end

