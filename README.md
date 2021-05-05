# SI-TI
Spatial Information (SI)  and Temporal Information (TI) calculation of YUV videos using MATLAB

Two set of scripts are being provided here. One for 8-bit YUV videos and one for 10-bit YUV videos. Both folders consists of two scripts.

`Main.m` MATLAB script to call the SI TI calculation function, `SITI_8bit`/`SITI_10bit`, for 8-bit/10-bit YUV, 4:2:0 chroma-subsampling videos SI and TI calculation, respectively. Calling this script will calculate the SI TI vals for all .yuv videos of a particular resolution in the same folder. However, the `Main.m` script could be modified to include videos for different resolutions. 

`SITI_8bit`/`SITI_10bit` function which calculates the SI and TI values. It can be easily modified for supporting other chroma sub-sampling, other bit-depths, and/or calculating the average SI/TI vals.

## Note: 

As per ITU-T Recommendation P.910 ("Subjective video quality assessment methods for multimedia applications") only the Luminance (Y) component is taken into account for SI TI calculation.

## Output: 

The output results are stored in a `SITIVals.csv` file. Additionally, the .mat files containing all calculation details including per-frame SI and TI vals are saved in the current directory which can be used later for other related analysis (such as mean/median SI TI calculation).

## Related Github Repository

There is a Python based implementation for SI TI calculation available on Github [here](https://github.com/slhck/siti).

# Contact

Nabajeet Barman, Kingston University, London, UK (n.barman@kingston.ac.uk, n.barman@ieee.org)
