"""
From a list of xml files, calculates and arranges an empty array that will hold the pixels of the part of the images.

"""
import xml.etree.ElementTree as ET

class MergeGrid:      # Merging the pictures together 
    """
    Merging a grid of positions described by the provided xml file paths

    __init__(xml_path_ar)

    Note:   initialize using an array of strings
    Args:   
        xml_path_ar - an array of xml paths
    Returns:
        MxN sized tiff image.
    """
    def __init__(self, xml_path_ar, ):
        self.xml_path_ar = xml_path_ar 

        # run through each xml path of the position
        for xml_path in xml_path_ar:
            tree = ET.parse(xml_path_ar)    # xml tree of the current stage position
            root = tree.getroot()           # root of the xml tree

            # image description at root[0][2]
            image_description = root[0][2]

            # X,Y,Z,T dimensions at image_description[4]
            dimensions = image_description[4]

            for dimension in dimensions:
                dimID = dimension.get("DimID")
                print("List of keys in dimension:")
                print(dimension.keys())
                if dimID is "X":
                    # Save the x dimension attributes
                elif dimID is "Y":
                    # Save the y dimension attributes
                elif dimID is "Z":
                    # Save the z dimension attributes
                #elif dimID is "T":
                    # Not needed at the moment

            # Hardware setting (hardware version, stage position etc.) = root[0][7]
            hardware_setting = root[0][7]

            # Hardware information kept at the attribute level
            hardware_info = hardware_setting.attrib     # dict
            # Useful keys for hardware info (Software, HardwareServerVersion) from the hardware setting
            software_version = hardware_info.get("Software")        # Software version used by the confocal
            hardware_version = hardware_info.get("HardwareServerVersion") # Confocal build version

            # Confocal settings info, defined by ATLConfocalSettingDefinition at hardware_info[0] kept at attribute level
            settings_info = hardware_setting[0].attrib     #dict
            # Useful keys for the settings info (ScanMode, ZPosition, Sections, 
            #                                    CycleCount, CycleTime, CompleteTime 
            #                                    StagePosX, StagePosY, StageRangeX, StageRangeY, 
            #                                    Zoom, Pinhole, PinholeAiry,
            #                                    EmissionWaveLengthForPinholeAiryCalculation, LineAverage)
            scanmode = settings_info["ScanMode"]    # xyzt
            zpos = settings_info["ZPosition"]       # Z position of the stage in um (What is the difference from the dimensions[2]["Origin"]?)
            zcnt = settings_info["Sections"]        # same as dimensions[2]["NumberOfElements"], number of z-stacks
            
            cycle_count = settings_info["CycleCount"]   # number of times this position is reached in x,y (this is number of t points in xyzt)
            cycle_time = settings_info["CycleTime"]     # How much time given for each cycle
            complete_time = settings_info["CompleteTime"]   # How much it took in total. Close to (cycle_count-1)*cycle_time, but in measured time

            xpos = settings_info["StagePosX"]   # x position of the stage in um
            xrange = settings_info["StageRangeX"]   # range of x of the stage in um
            ypos = settings_info["StagePosY"]   # y position of the stage in um
            yrange = settings_info["StageRangeY"]   # range of y of the stage in um

            zoom = settings_info["Zoom"]    # Zoom factor , max is 1.25 in 10x lens
            pinhole = settings_info["Pinhole"]  # pinhole size in um   (is it the radius or diam?)
            pinhole_AU = settings_info["PinholeAiry"]   # pinhole size in AU
            
            if verbose:
                print("XML data is read for file %s" % xml_path)
            # From the above parameters, obtain the larger picture size and corner positions
            
            

