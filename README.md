# colony-image-analysis
Combines the MxN grid of colony images and analyses the stitched images for radial colony growth and height growth.

## Dependencies working versions
Python 3.7.4, 3.8.5 (12/30/2020)  
opencv 4.5.0  
numpy 1.19.1, 1.19.4 (12/30/2020)  
matplotlib 3.3.2, 3.3.3 (12/30/2020)  
pandas 1.1.3, 1.1.5 (12/30/2020)  

## Raw Data:
The images were taken from a confocal microscope, of a growing E.coli (EQ59-Hwa Lab) colony over time and space. The scanning were defined in terms of the axis xyzt: where the stage moves in xy directions to make an MxN grid, the lens moves in the z-direction to focus at different depths of the colony, and the whole 3d grid of xyz image is taken at fixed time-intervals, making the t-axis.

## Files organization:
The images are stored in an external hard-drive (need to back-up occasionally). 

1. The base folder is located at
```python
base_folder = f"D:/Tolga/Colony\ Images/{datestr}/{fnamestr}/"
```

where `datestr` is for the date in the format `MMDDYYY` and `fnamestr` is the name of the .lif file. By default, the full name of this file is used in the consecutive tilescan/merged images.
2. The tilescan images are located at
```python
tilescan_folder = base_folder + "Tilescan/"
```

If the merging was done by the confocal software, the tilescan folder may not be present, and the merging operation is unnecessary. In the case of merging was done by the confocal software, the keyword `"Merging_{mix}"` is added a the end of the merged-image filename where `mix` is the merging index defined by the software.

3. The merged images are located at
```python
merged_folder = base_folder + "Merged"
```

4. The video files .avi are outputted on the base folder with the prefix as
```python
video_path = base_folder + f"{fnamestr}_t{tix}.avi"
```
where the variable `fnamestr` is the name of the .lif file as defined earlier, and `tix` is the timepoint identifier as defined by the software.

5. The detailed information of the 
## What the program can do [planning]
1. Combine 3x3 grid images using the xml information provided by the microscope in the folder Metadata
    - read xml data for each position
    - make the 3x3 grid, and define the array indices for combining all into a single image
    - write each combined tif image into a new file, corresponding to each colony t and z value.
2. 
_____
#### Notes:
- The codes are currently working, but will have more organization with every commit
- Will create a new branch for organizing
- Will organize the readme.md file accordingly.

#### Update code:
##### 12/04/2020
- Create files for a better organization
- MergeGrid file is missing the implementation. 