# Using ROAST: how to place virtual electrodes and run simulations for tDCS-induced electric fields

In studies investigating transcranial direct current stimulation (tDCS) (both in healthy and clinical populations) a significant source of variability in observed outcomes arises from the heterogeneity of brain anatomical features or  abnormalities. In fact, inter-individual differences in brain lesions, cortical atrophy, and skull geometry substantially affect how electric current flows through the brain. This variability undermines the reproducibility and precision of manual electrode placement approaches, often leading to reduced current intensity at the intended target and unpredictable current spread or direction (Nasimova & Huang, 2022 TO ADD).

One approach to address the challenges posed by inter-individual anatomical variability is the utilisation of individualised finite element models (FEM) derived from MRI scans, which allow the prediction of tDCS-induced electric field distributions across different tissues and regions of the brain (Albizu et al., 2020; Nasimova & Huang, 2022). These models have become increasingly accessible thanks to advancements in automated tissue segmentation and the emergence of open-source software packages that streamliene the modelling pipelines, such as SimNIBS (Windhoff et al., 2013) and ROAST (Huang et al., 2018, 2019).


## ROAST
In this workshop, we will focus on ROAST (Realistic vOlumetric Approach-based Simulator for TES), a fully automated MATLAB-based pipeline designed to model current flow induced by tES. ROAST allows to compute electric field distributions starting from a T1-weighted (and optionally T2-weighted) anatomical MRI, requiring only minimal manual intervention.

A few notes about ROAST: 

- ROAST is a one-command pipeline that automates most processing steps, including tissue segmentation, electrode placement, meshing, and FEM solving.
- The ROAST package is built on top of existing tools like SPM12 (Matlab), Iso2Mesh, and getDP.
- ROAST handles all steps in a unified workflow.


### Step-by-step breakdown of the ROAST pipeline

ROAST starts from a T1-weighted anatomical MRI in NIfTI format. Optionally, a T2-weighted scan can also be provided to improve segmentation quality and mesh definition.

Using SPM12, ROAST automatically segments the head into the following tissue types:

- Grey Matter (GM)

- White Matter (WM)

- Cerebrospinal Fluid (CSF)

- Skull (bone)

- Skin (scalp)

- Eyes

- Air cavities

During the segmentation step, each voxel is labeled based on its tissue class, and the result is stored as a segmented volume.

!NOTE The quality of segmentation strongly affects the final model. Including a T2 scan is especially helpful when the T1 image alone does not offer sufficient contrast between CSF and surrounding tissues.