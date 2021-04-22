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

5. The detailed information about the tiff images and the grid information is listed in the XML file in the folder
```python
metadata_path = base_folder + f"Metadata/{fname}_Properties.xml"
```
The details of the metadata file will be documented, but in short, the `ElementTree` is obtained from the imported module
```python
import xml.etree.ElementTree as ET
```
The number of images, timepoints, the position of each image and its dimensions can easily be extracted using the corresponding keys.

6. (Not yet implemented) data from each image will be coarse-grained by a binning procedure: chosen a small grid of PxP pixels, the number of pixels that reaches to a threshold value will be counted, so that the final information can be saved in a sparse (M/P x N/P) array.

7. (Not yet implemented) From the final data, the edge of the colony will be extracted, and growth in both radial and height will be analyzed.

## Install
The program is tested on Windows, but since the dependencies are all from python libraries, the program should work in any platform supporting python 3.7+.

(More instructions will be added as necessary)

## Run
1. (merge_tilescan.py): Merge the tilescan cimages to form a large tiff image for each z and t axis.

2. (make_movie.py): For each timepoint, make a movie of a lower quality 512x512 with 4fps that scans through each xy-cross-section.

3. (collect_data_movie.py): For each movie, extract data and save to a .csv file.

4. (analyze_data.py): Construct the 3d structure of the colony and visualize for each time. Extract some colony-spatial properties, such as height and radius growth rate.


#### Notes:
- Currently, the Run 1 and 2 are done. Will have the newest organization in the full_project branch.