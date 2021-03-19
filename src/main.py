import merging_functions as mf

import os

exp_name = "EQ59_Gly_02022021"
acq_name = "TileScan_Tp30-38"

exp_folder = f"D:/Tolga/Colony Images/{exp_name}/"
base_folder = os.path.join(exp_folder, f"{exp_name}_{acq_name}")
# metadata_folder = base_folder + "MetaData/"

# xml_path = metadata_folder + f"{exp_name}_{acq_name}_Properties.xml"

metadata = mf.collect_metadata(base_folder, exp_name, acq_name)

mf.merge(metadata)