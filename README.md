<h1 align="center">Temp apply warp peaks bundles</h1>

<p align="center">
  Resamples fibre peaks and tract masks into T1w space with FreeSurfer mri_vol2vol and warps them to MNI152 1mm space with an FSL nonlinear warp, using nearest-neighbour interpolation.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.801"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.801-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Resamples fibre peaks and tract masks into T1w space with FreeSurfer mri_vol2vol and warps them to MNI152 1mm space with an FSL nonlinear warp, using nearest-neighbour interpolation.**

Moves the peaks image and the tract mask volume to the T1w grid by header registration (mri_vol2vol), then applies the given warp with FSL applywarp to the MNI152 T1 1mm template, copying the mask labels. Use it to bring subject peaks and bundle masks into MNI space; the warp must map T1w space to MNI152. The App name marks it as temporary.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` · `neuro/transform/nifti` · `neuro/peaks` · `neuro/tractmasks` |
| **Outputs** | `neuro/tractmasks` · `neuro/peaks` |
| **Container** | `brainlife/freesurfer:7.3.2` |
| **Resources** | 4 CPUs · 1.5 h walltime |
| **Requires** | `FREESURFER_LICENSE` |
| **Run it** | [doi.org/10.25663/brainlife.app.801](https://doi.org/10.25663/brainlife.app.801) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes | T1-weighted image whose grid is used as the intermediate space. |
| `warp` | `neuro/transform/nifti` | yes | Nonlinear warp from T1w space to MNI152 (applied with FSL applywarp). |
| `peaks` | `neuro/peaks` | yes | Fibre orientation peaks image to warp. |
| `bundles` | `neuro/tractmasks` | yes | Tract masks (mask.nii.gz with label.json) to warp. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | Tract masks in MNI152 1mm space with the original labels. |
| `peaks` | `neuro/peaks` | Peaks image resampled to MNI152 1mm space. |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.801](https://doi.org/10.25663/brainlife.app.801), choose `neuro/anat/t1w`, `neuro/transform/nifti`, `neuro/peaks`, `neuro/tractmasks` from your project and press **Execute**. The results are saved to your project as `neuro/tractmasks`, `neuro/peaks`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/freesurfer:7.3.2`), [`jq`](https://jqlang.github.io/jq/), `FREESURFER_LICENSE`.

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "t1": "/path/to/t1/t1",
       "warp": "/path/to/warp/warp",
       "peaks": "/path/to/peaks/peaks",
       "masks": "/path/to/bundles/masks"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Temp apply warp peaks bundles. brainlife.io App. [doi:10.25663/brainlife.app.801](https://doi.org/10.25663/brainlife.app.801)
- Fischl. FreeSurfer. *NeuroImage* 62:774-781 (2012). [doi:10.1016/j.neuroimage.2012.01.021](https://doi.org/10.1016/j.neuroimage.2012.01.021)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

brainlife.io team

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

See [LICENSE](LICENSE).
