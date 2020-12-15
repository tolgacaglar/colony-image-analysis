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

# Folder for the files
folder = "D:/Tolga/Colony Images/12112020/3dTimeScan_12h/"
xml_fname = "MetaData/EQ59_Single_Colony_TilesScan.lif_3dTimeScan_12h_init_Properties.xml"

xml_path = folder + xml_fname
tree = ET.parse(xml_path)    # xml tree of the current stage position
root = tree.getroot()           # root of the xml tree

image = root[0]

# TileScan images are saved in parameter s**.
# Get the tilescan info
tilescan_info = None
for child in image:
    if child.get("Name") == "TileScanInfo":
        print("tilescan is set")
        tilescan_info = child
        break

snum = len(tilescan_info)
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
# y is inverted, so have another inverse
#for i in range(len(yix_lst)):
#    yix_lst[i] = len(yix_unique_ar) - yix_lst[i] - 1

# Collect the image information for each
image_description = None
img_name = ""
xsz = ysz = zsz = ssz = tsz = None
xvoxel = yvoxel = zvoxel = None
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
                        elif ggchild.get("DimID") == "Y":
                            ysz = int(ggchild.get("NumberOfElements"))
                            yvoxel = np.double(ggchild.get("Voxel"))
                        elif ggchild.get("DimID") == "Z":
                            zsz = int(ggchild.get("NumberOfElements"))
                            zvoxel = np.double(ggchild.get("Voxel"))
                        elif ggchild.get("DimID") == "Stage":
                            ssz = int(ggchild.get("NumberOfElements"))
                            svoxel = np.double(ggchild.get("Voxel"))
                        elif ggchild.get("DimID") == "T":
                            tsz = int(ggchild.get("NumberOfElements"))
                            # Note: tvoxel is not used!!
                            # Each image has its own timestamp data

out = cv2.VideoWriter(folder + "test_height.avi", cv2.VideoWriter_fourcc(*'MP42'), float(4), (xsz*len(xix_unique_ar),ysz*len(yix_unique_ar)))
# out = cv2.VideoWriter("C:/Users/Tolga/Dropbox/Presentation/test_height.avi", cv2.VideoWriter_fourcc(*'MP42'), 4, (xsz,ysz))
tar = [6]
zsz = 5
for tix in range(len(tar)):
    img_zsum = np.zeros(zsz)
    for zix in range(zsz):
        t_str = "t%d" % (tar[tix])
        z_str = "z%03d" % (zix)
        fpath = folder + "Merged/3dTimeScan_12h_init_%s_%s.tif" % (t_str, z_str)

        print("Loading file = %s" % (fpath))
        
        img = cv2.imread(fpath)
        img_bw = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        img_blur = cv2.GaussianBlur(img, (11,11),0)
        
        alpha = 20
        beta = -10
        img_contrast = np.clip(alpha*img_blur + beta, 0, 255)
        # img_contrast = np.clip(((img_blur/255.)**5)*255, 0, 255)
        cv2.imwrite(folder+"/temp.jpg", img_contrast)
        img_jpg = cv2.imread(folder+"/temp.jpg")
        
        # bar_start_coor = (50,440)
        # bar_end_coor = (int(50 + 200/x_voxel),450)
        # bar_thickness = -1
        # bar_color = (255,255,255)
        # cv2.rectangle(img_jpg, bar_start_coor, bar_end_coor, bar_color, bar_thickness)
        
        # text_x = int(bar_start_coor[0])
        # text_y = int((bar_start_coor[1]+bar_end_coor[1])/2 + 30)
        # cv2.putText(img_jpg,"200 um", (text_x,text_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        # zval_x = 300
        # zval_y = 50
        # z_str = "z=%.2f um" % (zix*z_voxel)
        # cv2.putText(img_jpg, z_str, (zval_x, zval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        # tval_x = 0
        # tval_y = 20
        # t_str_show = "t=20h %d min" % (27)
        # cv2.putText(img_jpg, t_str_show, (tval_x, tval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
        
        out.write(img_jpg)
        img_zsum[zix] = sum(sum(sum(img_blur/255.)))/3
        
out.release()