# -*- coding: utf-8 -*-
"""
Created on Tue Dec  1 09:05:05 2020

@author: Tolga
"""

import cv2
import numpy as np

from matplotlib import pyplot as plt

### IMAGE SCAN PROPERTIES:
# Voxel size:
x_voxel = 1.82 #um
y_voxel = 1.82 #um
z_voxel = 4.283 #um
dt = 53.43      #min
    
xar = yar = np.linspace(0,930, 512)
zar = np.linspace(0,586.72, 138)
tar = np.linspace(0, 23*60 + 9 + 2.87/60, )
# tlen = 27
# zlen = 138
tlen = 27
#zlen = 1
zix = 70

pos_str = "Position2002"

folder = "C:/Users/Tolga/Dropbox/Raw Data/Colony Images - Confocal/Colony Images"
test_file =  folder + "/Raw_Images/ColonyGrowth_EQ59_11172020_Mark_and_Find_002_" + pos_str + "_t00_z000_ch00.tif"
img_test = cv2.imread(test_file)
height,width,layers = img_test.shape
size = (width,height)

out = cv2.VideoWriter(folder + "/test_radial.avi", cv2.VideoWriter_fourcc(*'MP42'), float(4), size)
for tix in range(tlen):
    tval = tar[tix]
    t_str = "t%02d" % (tix)
    z_str = "z%03d" % (zix)
    filename = "C:/Users/Tolga/Dropbox/Raw Data/Colony Images - Confocal/Colony Images/Raw_Images/ColonyGrowth_EQ59_11172020_Mark_and_Find_002_" + pos_str + "_" + t_str + "_" + z_str + "_ch00.tif"

    print("Loading file = %s" % (filename))
    
    img = cv2.imread(filename)
    img_bw = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    img_blur = cv2.GaussianBlur(img, (11,11),0)
    
    alpha = 20
    beta = -10
    img_contrast = np.clip(alpha*img_blur + beta, 0, 255)
    # img_contrast = np.clip(((img_blur/255.)**5)*255, 0, 255)
    cv2.imwrite(folder+"/temp.jpg", img_contrast)
    img_jpg = cv2.imread(folder+"/temp.jpg")
    
    bar_start_coor = (50,440)
    bar_end_coor = (int(50 + 200/x_voxel),450)
    bar_thickness = -1
    bar_color = (255,255,255)
    cv2.rectangle(img_jpg, bar_start_coor, bar_end_coor, bar_color, bar_thickness)
    
    text_x = int(bar_start_coor[0])
    text_y = int((bar_start_coor[1]+bar_end_coor[1])/2 + 30)
    cv2.putText(img_jpg,"200 um", (text_x,text_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
    
    zval_x = 300
    zval_y = 50
    z_str_show = "z=%.2f um" % (zix*z_voxel)
    cv2.putText(img_jpg, z_str_show, (zval_x, zval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
    
    tval_x = 0
    tval_y = 20
    t_str_show = "t=%d min" % (tval)
    cv2.putText(img_jpg, t_str_show, (tval_x, tval_y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 2)
    
    out.write(img_jpg)
        
out.release()