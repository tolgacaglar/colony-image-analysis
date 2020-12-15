"""
From a list of xml files, calculates and arranges an empty array that will hold the pixels of the part of the images.

"""
# Dependencies
import xml.etree.ElementTree as ET
import numpy as np
import glob
import cv2
import sys

from matplotlib import pyplot as plt

## Define a filename constructor for various identifiers
def getFileName(fname, zix, zstr, tix, tstr, six, sstr):
    fsplit_lst = fname.split("_")   # split filename by '_'
    # Rename the timepoint, z-scan and stagepos identifiers
    if zix is not None:
        fsplit_lst[zix] = zstr
    if tix is not None:
        fsplit_lst[tix] = tstr
    if six is not None:
        fsplit_lst[six] = sstr

    # Construct the full file name
    fname_ret = fsplit_lst[0]
    for fsplit in fsplit_lst[1:]:
        fname_ret += "_" + fsplit
    
    return fname_ret

# Image dimension description from the xml file
def collectImageDim(image_xml):
    image_description = None
    img_name = ""
    xsz = ysz = zsz = ssz = tsz = None
    xvoxel = yvoxel = zvoxel = None
    xunit = yunit = zunit = ""
    for child in image:
        if child.tag == "ImageDescription":
            image_description = child
            for gchild in image_description:
                if gchild.tag == "Name":    # Name of the image
                    img_name = gchild.text
                elif gchild.tag == "Dimensions":     # x,y,z,stage,t dimensions
                    # Run through each deminson description
                    for ggchild in gchild:
                        if ggchild.tag == "DimensionDescription":   # Check for tag
                            if ggchild.get("DimID") == "X":
                                xsz = int(ggchild.get("NumberOfElements"))
                                xvoxel = np.double(ggchild.get("Voxel"))
                                xunit = ggchild.get("Unit")
                            elif ggchild.get("DimID") == "Y":
                                ysz = int(ggchild.get("NumberOfElements"))
                                yvoxel = np.double(ggchild.get("Voxel"))
                                yunit = ggchild.get("Unit")
                            elif ggchild.get("DimID") == "Z":
                                zsz = int(ggchild.get("NumberOfElements"))
                                zvoxel = np.double(ggchild.get("Voxel"))
                                zunit = ggchild.get("Unit")
                            elif ggchild.get("DimID") == "Stage":
                                ssz = int(ggchild.get("NumberOfElements"))
                                svoxel = np.double(ggchild.get("Voxel"))
                            elif ggchild.get("DimID") == "T":
                                tsz = int(ggchild.get("NumberOfElements"))
                                # Note: tvoxel is not used!!
                                # Each image has its own timestamp data
    # Returns a dictionary of dimension descriptions
    return {"img_name": img_name,
            "xsz": xsz, "xvoxel": xvoxel, "xunit": xunit,
            "ysz": ysz, "yvoxel": yvoxel, "yunit": yunit,
            "zsz": zsz, "zvoxel": zvoxel, "zunit": zunit,
            "ssz": ssz, "svoxel": svoxel,
            "tsz": tsz}

# Tilescan Information from the xml file
def collectTileScan(image_xml):
    # TileScan images are saved in parameter s**.
    # Get the tilescan info
    tilescan_info = None
    for child in image_xml:
        if child.get("Name") == "TileScanInfo":
            print("tilescan is set")
            tilescan_info = child
            break

    xix_lst, yix_lst = [],[]     # x,y indices for each tile
    xpos_lst, ypos_lst = [],[]    # x,y positions for each tile
    # Run through each tile to take position information
    for tile in tilescan_info:
        xix_lst.append(int(tile.get("FieldX")))
        yix_lst.append(int(tile.get("FieldY")))
        xpos_lst.append(np.double(tile.get("PosX")))
        ypos_lst.append(np.double(tile.get("PosY")))

    # unique x,y indices for each tile
    xix_unique_ar = np.unique(xix_lst)
    yix_unique_ar = np.unique(yix_lst)

    # y is inverted, so have another inverse
    for i in range(len(xix_lst)):
        xix_lst[i] = len(xix_unique_ar) - xix_lst[i] - 1

    return {"xix_lst": xix_lst, "yix_lst": yix_lst,
            "xix_unique_ar": xix_unique_ar, "yix_unique_ar": yix_unique_ar,
            "xpos_lst": xpos_lst, "ypos_lst": ypos_lst
            }

# Folder for the files
folder = "D:/Tolga/Colony Images/12112020/3dTimeScan_17h_init_long/"
xml_fname = "MetaData/EQ59_Single_Colony_TilesScan.lif_3dTimeScan_17h_init_long_Properties.xml"

xml_path = folder + xml_fname
tree = ET.parse(xml_path)    # xml tree of the current stage position
root = tree.getroot()           # root of the xml tree

image = root[0]

# Image dimension description
dim_desc = collectImageDim(image)
# TileScan description
tile_desc = collectTileScan(image)

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

# For each z section
#zstr_ar = ["z074"]
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
            fpath = getFileName(fname_list[0], zstr_ix, zstr, tstr_ix, tstr, sstr_ix, sstr)
            
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