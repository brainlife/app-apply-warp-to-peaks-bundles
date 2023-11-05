#!/bin/bash

peaks=`jq -r '.peaks' config.json`
bundles=`jq -r '.masks' config.json`
t1=`jq -r '.t1' config.json`

mkdir peaks masks masks/masks
export SUBJECTS_DIR=./
mri_vol2vol --mov ${peaks} --targ ${t1} --regheader --interp nearest --o peaks_t1.nii.gz
mri_vol2vol --mov ${bundles}/mask.nii.gz --targ ${t1} --regheader --interp nearest --o bundles_t1.nii.gz

cp ${bundles}/label.json ./masks/masks/
