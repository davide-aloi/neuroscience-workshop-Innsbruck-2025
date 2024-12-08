# tDCS-induced Electric Field Models from MRI anatomical scans
Material for the workshop tDCS-induced Electric Field Models from MRI - University of Innsbruck, Neuroscience Workshop (Series 2025)

## Introduction

## Software requirement and installation
The workshop will require the following software:
- [Matlab](https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html)
- [MRIcroGL](https://www.nitrc.org/projects/mricrogl)
- [Miniconda](https://docs.anaconda.com/miniconda/)
- [Git](https://git-scm.com/downloads)
- [VScode \(suggested\)](https://code.visualstudio.com/download)

```Note that most of the commands to build the environments and install the dependencies can be run from the terminal within VS code. If you use a different editor you can run the commands from your preferred terminal directly.```

# ROAST 
ROAST is an open source tool that runs on Matlab and will be used to compute electric fields from MRI structural images.

1) Download Roast from its [homepage](https://www.parralab.org/roast/) or clone the repository by running: 
```bash
git clone https://github.com/andypotatohy/roast
```
2) From Matlab, add the roast folder to the paths:
```matlab
addpath('path-to-roast/roast')  
```


### Python envioronment
1) Download Miniconda from the above link and [add conda to the environment paths](https://saturncloud.io/blog/solving-the-conda-command-not-recognized-issue-on-windows-10/)

2) From VScode, open a new terminal and clone the repository:

```bash
git clone https://github.com/davide-aloi/neuroscience-workshop-Innsbruck-2025
```

3) Build the conda enviornmet with the required libraries by running 

```bash
cd assets
conda env create -f environment.yml
# Verify that the environment was correctly created
conda env list
```



## Useful resources
- [ROAST homepage](https://www.opensourceimaging.org/project/roast/#:~:text=ROAST%3A%20A%20fully%20automated%2C%20Realistic,such%20as%20iso2mesh%20and%20getDP.)
- [Nilearn introduction](https://nilearn.github.io/stable/introduction.html)
- [MRIcroGL manual](https://www.cgl.ucsf.edu/home/meng/dicom/mricrogl-manual.pdf)

