"""
From a list of xml files, calculates and arranges an empty array that will hold the pixels of the part of the images.

"""
# Dependencies
import xml.etree.ElementTree as ET
import numpy as np
import glob
import cv2
import sys

import colony_iomethods as cm

from matplotlib import pyplot as plt

# Folder for the files
folder = "D:/Tolga/Colony Images/12112020/3dTimeScan_17h_init_long/"
xml_fname = "MetaData/EQ59_Single_Colony_TilesScan.lif_3dTimeScan_17h_init_long_Properties.xml"

xml_path = folder + xml_fname
tree = ET.parse(xml_path)    # xml tree of the current stage position
root = tree.getroot()           # root of the xml tree

image = root[0]

# Image dimension description
dim_desc = cm.collectImageDim(image)
# TileScan description
tile_desc = cm.collectTileScan(image)

# Copy all .tif file into a list
fname_list = glob.glob(folder+"TileScan/*.tif")
# For each file, collect string identifierse for t,s and z
tstr_st, sstr_st, zstr_st = set(),set(),set()
tstr_ix = 11     # timepoint identifier index
sstr_ix = 12     # stagepos identifier index
zstr_ix = 13    # z-scan identifier index

print("Did you check the tstr_ix, sstr_ix and zstr_ix??")
print("tstr = %s " % (fname_list[0].split("_")[tstr_ix]))
print("sstr = %s " % (fname_list[0].split("_")[sstr_ix]))
print("zstr = %s " % (fname_list[0].split("_")[zstr_ix]))

for fname in fname_list:
    fname_splt = fname.split("_")
    if tstr_ix is not None:
        tstr_st.add(fname_splt[tstr_ix])
    if sstr_ix is not None:
        sstr_st.add(fname_splt[sstr_ix])
    if zstr_ix is not None:
        zstr_st.add(fname_splt[zstr_ix])
    
# Sort the string identifiers and save as an array
tstr_ar = np.sort(list(tstr_st))
sstr_ar = np.sort(list(sstr_st))
zstr_ar = np.sort(list(zstr_st))

# Let's test merging a single timepoint for each z sections
#tstr_ar = [None]

fname_test = fname_list[0]
img_test = cv2.imread(fname_test, cv2.IMREAD_GRAYSCALE)
height, width = img_test.shape

# For a set zstr
# zstr_ar["z150"]
# For a set tstr
# tstr_ar["t19"]

for tix in range(len(tstr_ar)):
    tstr = tstr_ar[tix]
    for zix in range(len(zstr_ar)):
        zstr = zstr_ar[zix]
        # File path to merge into
        if tstr is not None:
            fpath_merged = folder + "Merged/" + dim_desc["img_name"] + "_" + tstr + "_" + zstr + ".tif"
        else:
            fpath_merged = folder + "Merged/" + dim_desc["img_name"] + "_" + zstr + ".tif"
        
        # Create empty merged image
        img_merged_bw = np.zeros((width*len(tile_desc["xix_unique_ar"]),height*len(tile_desc["yix_unique_ar"])), dtype=img_test.dtype)

        for six in range(len(sstr_ar)):    # Run over the stage positions -> single merged tif file
            sstr = sstr_ar[six]
            #Construct the filepath to merge
            fpath = cm.getFileName(fname_list[0], zstr_ix, zstr, tstr_ix, tstr, sstr_ix, sstr)
            
            img = cv2.imread(fpath, cv2.IMREAD_GRAYSCALE)
            height,width = img.shape
            
            # x,y indices
            xix = tile_desc["xix_lst"][six]
            yix = tile_desc["yix_lst"][six]
            # Image pixel positions
            xixar = np.arange(0,width) + width*xix
            yixar = np.arange(0,height) + height*yix
            
            # inverted y pixels
            img_merged_bw[(yix*height):((yix+1)*height), (xix*width):((xix+1)*width)] = np.transpose(img)
            
        print("\rImage merged for zstr,tstr = %s(%d/%d), %s(%d/%d)        " % (zstr, zix, len(zstr_ar), tstr, tix, len(tstr_ar)), end = "")
        sys.stdout.flush()
        
        # Write the merged image
        cv2.imwrite(fpath_merged, img_merged_bw)