#!/bin/bash

peaks=`jq -r '.peaks' config.json`
bundles=`jq -r '.bundles' config.json`
t1=`jq -r '.t1' config.json`

mkdir peaks bundles

mri_vol2vol --mov ${peaks} --targ ${t1} --regheader --interp nearest --o peaks_t1.nii.gz
mri_vol2vol --mov ${bundles} --targ ${t1} --regheader --interp nearest --o bundles_t1.nii.gz