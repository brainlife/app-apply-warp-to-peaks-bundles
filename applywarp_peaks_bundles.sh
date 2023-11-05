#!/bin/bash

t1=`jq -r '.t1' config.json`
warp=`jq -r '.warp' config.json`

template="MNI152_T1_1mm.nii.gz"
applywarp --rel --interp=nn -i ./peaks_t1.nii.gz -r ${FSL_DIR}/data/standard/MNI152_T1_1mm.nii.gz -w ${warp} -o peaks/peaks.nii.gz
applywarp --rel --interp=nn -i ./bundles_t1.nii.gz -r ${FSL_DIR}/data/standard/MNI152_T1_1mm.nii.gz -w ${warp} -o masks/masks/mask.nii.gz
