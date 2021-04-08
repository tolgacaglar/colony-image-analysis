import merging_functions as mf

import os

exp_name = "EQ59_Fru_04032021"
acq_name_lst = ["TileScan_Tp1-7",
                "TileScan_Tp8-31",
                "TileScan_Tp32-55"]#,

exp_folder = os.path.join("D:", "Tolga", "Colony Images", f"{exp_name}")
inner = True

for acq_name in acq_name_lst:
    metadata = mf.collect_metadata(exp_folder, exp_name, acq_name, inner=inner)

    mf.merge(metadata, inner=inner)

    # mf.make_movie(metadata)