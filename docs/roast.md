# Using ROAST: how to place virtual electrodes and run simulations for tDCS-induced electric fields

In studies investigating transcranial direct current stimulation (tDCS) (both in healthy and clinical populations) a significant source of variability in observed outcomes arises from the heterogeneity of brain anatomical features or  abnormalities. In fact, inter-individual differences in brain lesions, cortical atrophy, and skull geometry substantially affect how electric current flows through the brain. This variability undermines the reproducibility and precision of manual electrode placement approaches, often leading to reduced current intensity at the intended target and unpredictable current spread or direction (Nasimova & Huang, 2022 TO ADD).

One approach to address the challenges posed by inter-individual anatomical variability is the utilisation of individualised finite element models (FEM) derived from MRI scans, which allow the prediction of tDCS-induced electric field distributions across different tissues and regions of the brain (Albizu et al., 2020; Nasimova & Huang, 2022). These models have become increasingly accessible thanks to advancements in automated tissue segmentation and the emergence of open-source software packages that streamliene the modelling pipelines, such as SimNIBS (Windhoff et al., 2013) and ROAST (Huang et al., 2018, 2019).


## ROAST
In this workshop, we will focus on ROAST (Realistic vOlumetric Approach-based Simulator for TES), a fully automated MATLAB-based pipeline designed to model current flow induced by tES. ROAST allows to compute electric field distributions starting from a T1-weighted (and optionally T2-weighted) anatomical MRI, requiring only minimal manual intervention.

A few notes about ROAST: 

- ROAST is a one-command pipeline that automates most processing steps, including tissue segmentation, electrode placement, meshing, and FEM solving.
- ROAST electrode placement can be achieved both specifying 10-20 electrode positions or from actual MRI coordinates (i.e., identifyied manually using MRIcrongl).
- The ROAST package is built on top of existing tools like SPM12 (Matlab), Iso2Mesh, and getDP.
- ROAST handles all steps in a unified workflow.
- [something about space - conversion]


The ROAST pipeline consists of several key steps, each of which plays a crucial role in generating accurate and realistic electric field models. We will first go through a theoretical overview of the pipeline, and then we will run some simulations on sample data.

### Step-by-step breakdown of the ROAST pipeline
ROAST starts from a T1-weighted anatomical MRI in NIfTI format. Optionally, a T2-weighted scan can also be provided to improve segmentation quality and mesh definition.

> [!NOTE]  
>Why is segmentation needed?
>Segmentation is a critical step because different tissues in the head have very different electrical conductivities. For example, CSF conducts current much more easily than skull or white matter. By assigning each voxel in the MRI to a specific tissue class, ROAST can later assign appropriate conductivity values and generate a realistic head model. This is essential for accurately simulating how current flows during tDCS, particularly in anatomically complex or lesioned brains.


#### 1. Tissue segmentation
Using SPM12, ROAST automatically segments the head into the following tissue types:

- white matter (WM),
- grey matter (GM),
- skull,
- scalp,
- CSF,
- air cavities. 

During the segmentation step, each voxel is labeled based on its tissue class, and the result is stored as a segmented volume.


> [!NOTE]  
>The quality of segmentation strongly affects the final model. Including a T2 scan is especially helpful when the T1 image alone does not offer sufficient contrast between CSF and surrounding tissues.

#### 2. Conductivity values assignment
Once the tissues have been segmented, ROAST assigns a set of default isotropic conductivity values to each tissue type and to the electrode components. These conductivity values determine how easily electrical current can pass through each material, which is critical for realistic current flow modelling. The default values used by ROAST are (Huang et al., 2019):

- Grey matter: 0.276 S/m
- White matter: 0.126 S/m
- Cerebrospinal fluid (CSF): 1.65 S/m
- Bone: 0.01 S/m
- Skin: 0.465 S/m
- Air: 2.5 × 10⁻¹⁴ S/m
- Electrodes: 5.9 × 10⁷ S/m
- Conductive paste: 0.3 S/m

These values are assumed to be isotropic (the same in all directions) and constant across the entire model unless manually adjusted.


#### 3. Post processing
After segmentation, ROAST applies a custom post-processing step to refine the tissue maps produced by SPM. This includes smoothing the segmentations, filling CSF gaps, and removing disconnected voxels (Huang et al., 2019). The result is a clean, discrete tissue map in which each voxel is uniquely assigned to one tissue type specified above.


#### 4. Electrode placement
Next, ROAST places virtual electrodes on the scalp using one of two methods:

- Method 1: Electrode placement via standard EEG systems (e.g., 10–20 or BioSemi-256);
- Method 2: Electrode placement via custom-defined coordinates in subject-specific MRI space.

For greater anatomical precision, especially in individualised modelling, you may choose to specify custom electrode coordinates per participant.

For completeness, we will go through both approaches.


##### 4.1 Electrode placement via standard EEG montages
ROAST can automatically place electrodes on the scalp using standard EEG montages. This is particularly useful for those who want to quickly set up a simulation without needing to manually specify electrode coordinates. The user can select from a list of standard montages, such as the 10-20 system or the BioSemi-256 system. ROAST will then automatically convert these locations to the subject-specific MRI space using the transformation matrix generated during the normalisation step. 

The list of available montages and electrode locations can be found in the [ROAST documentation](https://github.com/andypotatohy/roast/blob/master/capInfo.xlsx). 



##### 4.2 Manual electrode placement
Alternatively, you can manually specify the coordinates of the electrodes in the subject's MRI space. This is useful for custom montages or when using non-standard electrode placements. To do this, you will need to identify the coordinates of the desired electrode locations in the MRI space and provide them to ROAST in a specific format.

To accurately identify the coordinates we will use the visualisation tool called MRIcroGL. This tool allows you to view the MRI scan in with a three-dimensional render, along with the canonical multi-planar view, and to select any voxel in the 3D space and display the respective MRI volume space coordinates. 


![me](images\README\ezgif-810074e308f39d.gif)
