import merging_functions as mf

import os

# exp_name = "EQ59_Glu_04172021"
# plt_ids = [1,1,1,2,2,3,3,3,4,4,5,5]
# tp_ids = [2,8,12,3,7,1,6,11,5,10,4,9]

exp_name = "EQ59_Gly_04172021"
plt_ids = [3,2,1,4,3,2,1,5,4,3,2,1]
tp_ids = [1,2,3,4,5,6,7,8,9,10,11,12]
exp_folder = os.path.join("E:", "Tolga", f"{exp_name}")
acq_name_lst = []

for ix in range(len(plt_ids)):
    acq_name = f"TileScan_Plt{plt_ids[ix]}_Tp{tp_ids[ix]}"
    acq_name_lst.append(acq_name)

inner = True

for acq_name in acq_name_lst:
    metadata = mf.collect_metadata(exp_folder, exp_name, acq_name, inner=inner)

    mf.merge(metadata, inner=inner)

    # mf.make_movie(metadata)