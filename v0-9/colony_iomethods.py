'''
    A selection of methods to be called with the tilescan merger and movie maker
'''
# Dependencies
import numpy as np


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
    for child in image_xml:
        if child.tag == "ImageDescription":
            image_description = child
            for gchild in image_description:
                if gchild.tag == "Name":    # Name of the image
                    img_name = gchild.text
                elif gchild.tag == "Dimensions":     # x,y,z,stage,t dimensions
                    # Run through each deminson description
                    for ggchild in gchild:
                        if ggchild.tag == "DimensionDescription":   # Check for tag
                            szstr = ggchild.get("NumberOfElements")
                            voxelstr = ggchild.get("Voxel")
                            unitstr = ggchild.get("Unit")
                            unitstr = unitstr.replace("\xb5", "u") # Replace greek letter of \mu with letter u
                            
                            # Check for dimensions
                            if ggchild.get("DimID") == "X":
                                xsz = int(szstr)
                                xvoxel = np.double(voxelstr)
                                xunit = unitstr
                            elif ggchild.get("DimID") == "Y":
                                ysz = int(szstr)
                                yvoxel = np.double(voxelstr)
                                yunit = unitstr
                            elif ggchild.get("DimID") == "Z":
                                zsz = int(szstr)
                                zvoxel = np.double(voxelstr)
                                zunit = unitstr
                            elif ggchild.get("DimID") == "Stage":
                                ssz = int(szstr)
                                svoxel = np.double(voxelstr)
                            elif ggchild.get("DimID") == "T":
                                tsz = int(szstr)
                                # Note: tvoxel is not used!!
                                # Each image has its own timestamp data
    # Returns a dictionary of dimension descriptions
    return {"img_name": img_name,
            "xsz": xsz, "xvoxel": xvoxel, "xunit": xunit,
            "ysz": ysz, "yvoxel": yvoxel, "yunit": yunit,
            "zsz": zsz, "zvoxel": zvoxel, "zunit": zunit,
            "ssz": ssz, "svoxel": None,
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
            "xpos_lst": xpos_lst, "ypos_lst": ypos_lst,
            "tile_xcnt": len(xix_unique_ar), "tile_ycnt": len(yix_unique_ar)
            }