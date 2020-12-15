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

# Folder for the files
folder = "D:/Tolga/Colony Images/12112020/3dTimeScan_12h/"
xml_fname = "MetaData/EQ59_Single_Colony_TilesScan.lif_3dTimeScan_12h_init_Properties.xml"

xml_path = folder + xml_fname
tree = ET.parse(xml_path)    # xml tree of the current stage position
root = tree.getroot()           # root of the xml tree

image = root[0]

# Image dimension description
dim_desc = collectImageDim(image)

# y is inverted, xy is swapped: invert x
for i in range(len(xix_lst)):
    xix_lst[i] = len(xix_unique_ar) - xix_lst[i] - 1

img_test = cv2.imread(folder + "Merged/3dTimeScan_12h_init_t0_z000.tif")
(height, width, layers) = img_test.shape

dim_vid = (512,512)
shrink_frac = 512/height
# out = cv2.VideoWriter("C:/Users/Tolga/Dropbox/Presentation/test_height.mp4", cv2.VideoWriter_fourcc(*'MP42'), 4, (xsz,ysz))
# cv2.VideoWriter_fourcc(*'DIVX')
for tix in range(dim_desc["tsz"]):
    t_str = "t%d" % (tix)
    out = cv2.VideoWriter(folder + "3dTimeScan_12h_init_%s.avi" % (t_str), cv2.VideoWriter_fourcc(*'DIVX'), 5, dim_vid)
    img_zsum = np.zeros(dim_desc["zsz"])
    for zix in range(dim_desc["zsz"]):
        z_str = "z%03d" % (zix)
        fpath = folder + "Merged/3dTimeScan_12h_init_%s_%s.tif" % (t_str, z_str)

        print("Loading file = %s" % (fpath))
        
        img = cv2.imread(fpath)
        img_blur = cv2.GaussianBlur(img, (11,11),0)

        alpha = 20
        beta = -10
        img_contrast = np.uint8(np.clip(alpha*img_blur + beta, 0, 255))
        # Resize for video output
        img_resized = cv2.resize(img_contrast, dim_vid)

        bar_start_coor = (50,440)
        bar_end_coor = (int(50 + 200/dim_desc["xvoxel"]*shrink_frac),450)
        bar_thickness = -1
        bar_color = (255,255,255)
        cv2.rectangle(img_resized, bar_start_coor, bar_end_coor, bar_color, bar_thickness)
        
        text_x = int(bar_start_coor[0])
        text_y = int((bar_start_coor[1]+bar_end_coor[1])/2 + 30)
        cv2.putText(img_resized,"200 um", (text_x,text_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        zval_x = 260
        zval_y = 50
        z_str = "z=%.3f%s" % (zix*dim_desc["zvoxel"], dim_desc["zunit"])
        cv2.putText(img_resized, z_str, (zval_x, zval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        # tval_x = 0
        # tval_y = 20
        # t_str_show = "t=20h %d min" % (27)
        # cv2.putText(img_jpg, t_str_show, (tval_x, tval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        out.write(img_resized)
        # img_zsum[zix] = sum(sum(sum(img_blur/255.)))/3
        
    out.release()