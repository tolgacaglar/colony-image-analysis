import merging_functions as mf

import os

exp_name = "EQ59_Gly_03232021"
acq_name_lst = ["TileScan_Tp1-9_xyzt",
                "TileScan_Tp10-33_xyzt",
                "TileScan_Tp34-57_xyzt"]#,

exp_folder = os.path.join("D:", "Tolga", "Colony Images", f"{exp_name}")

for acq_name in acq_name_lst:
    metadata = mf.collect_metadata(exp_folder, exp_name, acq_name, inner=True)

    mf.merge(metadata, inner=True)

    # mf.make_movie(metadata)