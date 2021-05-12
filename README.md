# SI-TI
Spatial Information (SI)  and Temporal Information (TI) calculation of YUV videos using MATLAB

Two set of scripts are being provided here. One for 8-bit YUV videos and one for 10-bit YUV videos. Both folders consists of two scripts.

`Main.m` MATLAB script to call the SI TI calculation function, `SITI_8bit`/`SITI_10bit`, for 8-bit/10-bit YUV, 4:2:0 chroma-subsampling videos SI and TI calculation, respectively. Calling this script will calculate the SI TI vals for all .yuv videos of a particular resolution in the same folder. However, the `Main.m` script could be modified to include videos for different resolutions. 

`SITI_8bit`/`SITI_10bit` function which calculates the SI and TI values. It can be easily modified for supporting other chroma sub-sampling, other bit-depths, and/or calculating the average SI/TI vals.

## Output: 

The output results are stored in a `SITIVals.csv` file. Additionally, the .mat files containing all calculation details including per-frame SI and TI vals are saved in the current directory which can be used later for other related analysis (such as mean/median SI TI calculation).

# Theoretical Background

Spatial Information (SI) and Temporal Information (TI) as defined in [ITU-T Recommendation P.910 ("Subjective video quality assessment methods for multimedia applications")](https://www.itu.int/rec/T-REC-P.910-200804-I/en) are widely used metrics as an approximate indicator of scene complexity and are commonly used for test sequence selection for quality assessment related tasks.

## Spatial Information (SI)

![image](https://user-images.githubusercontent.com/48479111/117988295-2fb49580-b333-11eb-8df3-5c4502fb1acb.png)
       
                                Source: ITU-T Recommendation P.910

## Temporal Information (TI)

![image](https://user-images.githubusercontent.com/48479111/117988986-d7ca5e80-b333-11eb-9d3f-772d46ee66a2.png)

                                Source: ITU-T Recommendation P.910

As per ITU-T Recommendation P.910 ("Subjective video quality assessment methods for multimedia applications") only the Luminance (Y) component is taken into account for SI TI calculation.

## Related Github Repository

There is a Python based implementation for SI TI calculation available on Github [here](https://github.com/slhck/siti). The MATLAB implementation provided here gives the same results (upto 2 decimal places) as the Python implementation for YUV420 videos in Full Range mode.

# Citation

If you find this file useful and use it in your work, please provide a link to this Github page in your publication and cite our below mentioned paper:

`N. Barman, N. Khan and M. G. Martini, "Analysis of Spatial and Temporal Information Variation for 10-Bit and 8-Bit Video Sequences," 2019 IEEE 24th International Workshop on Computer Aided Modeling and Design of Communication Links and Networks (CAMAD), 2019, pp. 1-6, doi: 10.1109/CAMAD.2019.8858486.`

# Contact

Nabajeet Barman, Kingston University, London, UK (n.barman@kingston.ac.uk, n.barman@ieee.org)
