import merging_functions as mf

import os
import pandas as pd

# exp_name = "EQ59_Glu_04172021"
# plt_ids = [1,1,1,2,2,3,3,3,4,4,5,5]
# tp_ids = [2,8,12,3,7,1,6,11,5,10,4,9]

# exp_name = "EQ59_Gly_04172021"
# plt_ids = [3,2,1,4,3,2,1,5,4,3,2,1]
# tp_ids = [1,2,3,4,5,6,7,8,9,10,11,12]
# exp_folder = os.path.join("E:", "Tolga", f"{exp_name}")
# acq_name_lst = []


exp_name = "EQ59_Gly_04242021"
exp_folder = os.path.join("D:", "Tolga", f"{exp_name}")
inner = True
tstr = "t0"
dim = (512,512)
ksz_um = 10 # Kernel size for filters in um

full_stage = True
marked = True 

plate_csv_path = os.path.join(exp_folder, f"{exp_name}_Plates.csv")
timepoint_csv_path = os.path.join(exp_folder, f"{exp_name}_TimePoints.csv")

plate_df = pd.read_csv(plate_csv_path)
timepoint_df = pd.read_csv(timepoint_csv_path)
df = plate_df.merge(timepoint_df, on="plate_id", how="inner")

for (index, row) in df.iterrows():
    plt_id = row["plate_id"]
    tp_id = row["timepoint_id"]

    print(f"plate_id: {plt_id} - tp_id: {tp_id}")

    acq_name = f"TileScan_Plt{plt_id}_Tp{tp_id}"
    metadata = mf.collect_metadata(exp_folder, exp_name, acq_name, inner=inner)

    # mf.merge(metadata, inner)

    mf.make_movie(metadata, 0, 0, 0, dim, ksz_um, marked, full_stage)