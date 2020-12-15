# colony-image-analysis
Combines the 3x3 grid of colony images and analyses the stitched images for radial growth and height growth.

## Dependencies working versions
Python 3.7.4  
opencv 4.5.0  
numpy 1.19.1  
matplotlib 3.3.2  
pandas 1.1.3

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