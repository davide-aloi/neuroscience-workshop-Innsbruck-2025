# tDCS-induced Electric Field Models from MRI anatomical scans
Material for the workshop tDCS-induced Electric Field Models from MRI - University of Innsbruck, Neuroscience Workshop (Series 2025)

## Introduction

In the field of *Transcranial Electric Stimulation* (tES), accurately simulating how tES-induced current spreads in the brain, which regions it reaches, and to what extent, is fundamental to understanding inter-individual differences in response to the stimulation. In fact, differences in skull shape, cortical folding, cerebrospinal fluid, or other neuroanatomical features greatly influence electric fields induced by tES in the brain.

Models of tES electric fields in the brain can help explain the great variability observed in studies involving non-invasive brain stimulation (that is, the degree to which participants / patients respond to the stimulation varies a lot). Similarly, the same models can help optimise tES electrode montage to the specific neuroanatomy of an individual.

## Software requirement and installation
The workshop will require the following software:
- [Matlab](https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html)
- [ROAST](https://www.parralab.org/roast/): An open source tool that runs on Matlab, used to compute electric fields from MRI structural images.  
- [MRIcroGL](https://www.nitrc.org/projects/mricrogl): MRIcroGL allows you to view 2D slices and renderings of your brain imaging data. We will use it to find the coordinates for the virtual electrodes
- [Miniconda](https://docs.anaconda.com/miniconda/): A lighter installation of Anaconda Distribution that includes only conda and Python. This will be used to create the environment with the libraries used to access and visualise the results from ROAST.
- [Git](https://git-scm.com/downloads)
- [VScode \(suggested\)](https://code.visualstudio.com/download)


```Note that most of the commands to build the environments and install the dependencies can be run from the terminal within VS code. If you use a different editor you can run the commands from your preferred terminal directly.```

# Repository
[Install git](https://github.com/git-guides/install-git) if needed, and clone the current repository:

```bash
git clone https://github.com/davide-aloi/neuroscience-workshop-Innsbruck-2025
cd neuroscience-workshop-Innsbruck-2025
```

### Python envioronment
1) Download and install Miniconda
2) From VScode, open a new terminal and build the environment with the required libraries:

```bash
conda env create -f assets/environment.yml
# Verify that the environment was correctly created
conda env list
```

This should output: 
```console
# conda environments:
base                     C:\Users\User\miniconda3
tdcs_env                 C:\Users\User\miniconda3\envs\tdcs_env
```


# ROAST 

1) Download Roast from its [homepage](https://www.parralab.org/roast/) or clone the repository by running: 
```bash
# Clone ROAST into the roast folder of this repository
git clone https://github.com/andypotatohy/roast roast
```

2) From Matlab, add the roast folder to the paths:
```matlab
addpath('path-to-roast/roast')  
```

## Download test data
- [T1 scan](http://mritemplate.inria.fr/data/Template-T1-U8-RALPFH-HR.nii.gz)
- [T2 scan](http://mritemplate.inria.fr/data/Template-T2-U8-RALPFH-HR.nii.gz)



## Useful resources
- [ROAST homepage](https://www.opensourceimaging.org/project/roast/#:~:text=ROAST%3A%20A%20fully%20automated%2C%20Realistic,such%20as%20iso2mesh%20and%20getDP.)
- [Nilearn introduction](https://nilearn.github.io/stable/introduction.html)
- [MRIcroGL manual](https://www.cgl.ucsf.edu/home/meng/dicom/mricrogl-manual.pdf)


# FAQs
- [Git command not found (windows) &rarr; add git to system paths](https://linuxhint.com/add-git-to-path-windows/)
- [Conda command not found (windows) &rarr; add conda to system paths](https://saturncloud.io/blog/solving-the-conda-command-not-recognized-issue-on-windows-10/)