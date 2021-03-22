import merging_functions as mf

import os

exp_name = "EQ59_Glu_03142021"
acq_name_lst = ["TileScan_24-48h_xyzt"]#,

exp_folder = os.path.join("E:", "Tolga", f"{exp_name}")

for acq_name in acq_name_lst:
    metadata = mf.collect_metadata(exp_folder, exp_name, acq_name)

    mf.merge(metadata)

    mf.make_movie(metadata]