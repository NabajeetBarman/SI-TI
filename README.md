# SI-TI
Spatial Information (SI)  and Temporal Information (TI) calculation of YUV videos using MATLAB

Two set of scripts are being provided here. One for 8-bit YUV videos and one for 10-bit YUV videos. Both folders consists of two scripts.

`Main.m` MATLAB script to call the SI TI calculation function, `SITI_8bit`/`SITI_10bit`, for 8-bit/10-bit YUV, 4:2:0 chroma-subsampling videos SI and TI calculation, respectively. Calling this script will calculate the SI TI vals for all .yuv videos of a particular resolution in the same folder. However, the `Main.m` script could be modified to include videos for different resolutions. 

`SITI_8bit`/`SITI_10bit` function which calculates the SI and TI values. It can be easily modified for supporting other chroma sub-sampling, other bit-depths, and/or calculating the average SI/TI vals.

## Note: 

As per ITU-T Recommendation P.910 ("Subjective video quality assessment methods for multimedia applications") only the Luminance (Y) component is taken into account for SI TI calculation.

## Output: 

The output results are stored in a `SITIVals.csv` file. Additionally, the .mat files containing all calculation details including per-frame SI and TI vals are saved in the current directory which can be used later for other related analysis (such as mean/media SI TI calculation).

## Related Github Repository

There is a Python based implementation for SI TI calculation available on Github [here](https://github.com/slhck/siti).

# Contact

Nabajeet Barman, Kingston University, London, UK (n.barman@kingston.ac.uk, n.barman@ieee.org)

# License
Copyright (c) Nabajeet Barman, Kingston University, London, United Kingdom

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
