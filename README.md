# tDCS-induced Electric Field Models from MRI anatomical scans
Material for the workshop tDCS-induced Electric Field Models from MRI - University of Innsbruck, Neuroscience Workshop (Series 2025).

## Introduction

In the field of *Transcranial Electric Stimulation* (tES), accurately simulating how tES-induced current spreads in the brain, which regions it reaches, and to what extent, is fundamental to understanding inter-individual differences in response to the stimulation. In fact, differences in skull shape, cortical folding, cerebrospinal fluid, or other neuroanatomical features greatly influence electric fields induced by tES in the brain (Nasimova et al ., 2022)<sup>[1](#references)</sup>.

Models of tES electric fields in the brain can help explain the great variability observed in studies involving tES (that is, the degree to which participants / patients respond to the stimulation varies a lot). Similarly, those models can also help optimise tES electrode montage to the specific neuroanatomical features of an individual.

These current-flow models are generated using MRI anatomical scans of human heads (such as T1 and T2 scans), which undergo several processing steps:

1. The MRI scan is segmented into different tissues (i.e., each voxel in the scan is assigned to either grey matter, white matter, cerebrospinal fluid, bone, skin, etc.).
2. Different tissue conductivities are assigned to each tissue type.
3. Virtual electrodes are placed on the scalp based on pre-specified locations.
4. Everything is then converted into a 3D mesh.
5. The current flow is estimated through a finite element model (FEM) solved numerically.  

<div style="text-align: center;">
<img src="images/README/1737903920342.png" width="250">  
</div>
  

In this workshop, we will go through the entire process highlighted above and we will see how to visualise the computed tES models. We will use ROAST (_Realistic Volumetric-Approach-Based Simulator For TES_)<sup>[2](#references)</sup> for the simulation, SPM (MATLAB) for the normalisation of the results and MRIcroGL for the visualisation of the results.

## Software requirement and installation
The workshop will require the following software:
- [Matlab](https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html)
- [ROAST](https://www.parralab.org/roast/): An open source tool that runs on Matlab, used to compute electric fields from MRI structural images.  
- [MRIcroGL](https://www.nitrc.org/projects/mricrogl): MRIcroGL allows you to view 2D slices and renderings of your brain imaging data. We will use it to find the coordinates for the virtual electrodes
- [Git](https://git-scm.com/downloads)
- [VScode \(suggested\)](https://code.visualstudio.com/download)

```Note that most of the commands to build the environments and install the dependencies can be run from the terminal within VS code. If you use a different editor you can run the commands from your preferred terminal directly.```

### Repository
[Install git](https://github.com/git-guides/install-git) if needed, and clone the current repository:

```bash
git clone https://github.com/davide-aloi/neuroscience-workshop-Innsbruck-2025
cd neuroscience-workshop-Innsbruck-2025
```

### ROAST 
1) Download Roast from its [homepage](https://www.parralab.org/roast/) or clone the repository by running: 

```bash
# Clone ROAST into the roast folder of this repository
mkdir roast
git clone https://github.com/andypotatohy/roast roast
```

2) From Matlab, navigate to the current repository folder, and either right-click on the roast folder -> add to path or run the following command in the Matlab console:

```matlab
addpath('roast')  
```

### Download test data and unzip it
- [T1 scan](https://packages.bic.mni.mcgill.ca/mni-models/icbm152/mni_icbm152_nl_VI_nifti.zip)

- Note: For simplicity I have placed the above T1 scan in the `mri_data` folder of the current repository (icbm_avg_152_t1_tal_nlin_symmetric_VI.nii).

> [!NOTE]  
> You can try all the scripts with your MRI scans if you have them. However example data has been placed in mri_data folder and is also present in roast/example. Moreover, ROAST allows to use T2 scans as well, but for the sake of simplicity we will only use T1 scans. However, if you have T2 scans, you can use them as well to improve the accuracy of the SPM segmentation.


# Running ROAST: Step-by-Step guide
For simplicity, the workflow is divided into sub-sections, each focusing on a specific step of the process:
1. [Using ROAST: an overview](docs/roast.md).
2. [Running the simulation with ROAST: practical examples](docs/roast_simulation.md).
3. [ROAST output files](docs/roast_output.md).
4. [Normalisation with SPM](docs/normalise_roast_results.md). 
5. [Visualising ROAST results in MRIcroGL](docs/results_visualisation.md).


# FAQs
- [Git command not found (windows) &rarr; add git to system paths](https://linuxhint.com/add-git-to-path-windows/)

# Useful resources
- [ROAST homepage](https://www.opensourceimaging.org/project/roast/#:~:text=ROAST%3A%20A%20fully%20automated%2C%20Realistic,such%20as%20iso2mesh%20and%20getDP.)
- [MRIcroGL manual](https://www.cgl.ucsf.edu/home/meng/dicom/mricrogl-manual.pdf)


# References
1) Nasimova, M., & Huang, Y. (2022). Applications of open-source software ROAST in clinical studies: A review. Brain Stimulation, 15(4), 1002–1010. https://doi.org/10.1016/j.brs.2022.07.003.
2) Huang Y, Datta A, Bikson M, Parra LC. ROAST: An Open-Source, Fully-Automated, Realistic Volumetric-Approach-Based Simulator For TES. Annu Int Conf IEEE Eng Med Biol Soc. 2018 Jul;2018:3072-3075. doi: 10.1109/EMBC.2018.8513086. PMID: 30441043.

# Awknowledgements
Most of the scripts in this repository were created during my PhD, under the supervision of [Dr. Davinia Fernandez-Espejo](https://www.daviniafernandezespejo.com/) at the [Centre for Human Brain Health](https://www.birmingham.ac.uk/research/centres-institutes/human-brain-health)