# Dependencies
import xml.etree.ElementTree as ET
import numpy as np
import glob
import cv2
import sys

import colony_iomethods as cm

from matplotlib import pyplot as plt

# Folder for the files
folder = "D:/Tolga/Colony Images/12112020/3dTimeScan_12h/"
xml_fname = "MetaData/EQ59_Single_Colony_TilesScan.lif_3dTimeScan_12h_init_Properties.xml"

xml_path = folder + xml_fname
tree = ET.parse(xml_path)    # xml tree of the current stage position
root = tree.getroot()           # root of the xml tree

image = root[0]

# Image dimension description
dim_desc = cm.collectImageDim(image)

img_test = cv2.imread(folder + "Merged/3dTimeScan_12h_init_t0_z000.tif")
(height, width, layers) = img_test.shape

dim_vid = (512,512)
scale = dim_vid[0]/height

# For a set number of t
# dim_desc["tsz"] = 1
# For a set number of z
# dim_desc["zsz"] = 5
for tix in range(dim_desc["tsz"]):
    t_str = "t%d" % (tix)
    out = cv2.VideoWriter(folder + "3dTimeScan_12h_init_%s.avi" % (t_str), cv2.VideoWriter_fourcc(*'DIVX'), 4, dim_vid)
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

        # Scale bar
        scalebar_length = 200   # in um
        bar_start_coor = (50,440)
        bar_end_coor = (int(50 + scalebar_length/dim_desc["xvoxel"]*scale),450)
        bar_thickness = -1
        bar_color = (255,255,255)
        cv2.rectangle(img_resized, bar_start_coor, bar_end_coor, bar_color, bar_thickness)
        
        text_x = int(bar_start_coor[0])
        text_y = int((bar_start_coor[1]+bar_end_coor[1])/2 + 30)
        cv2.putText(img_resized,"%d %s" % (scalebar_length, dim_desc["xunit"]), (text_x,text_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
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