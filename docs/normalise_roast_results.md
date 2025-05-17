
# Normalising ROAST Results to MNI Space

As a last step before using ROAST results in group-level analyses, statistical comparisons, or visualisation in a common anatomical space, it is essential to normalise the output images to MNI space. This process ensures that all images are aligned and can be compared across subjects.

To achieve this, we will use SPM's normalisation scripts to align the T1-weighted anatomy, electric field magnitude (emag), vector field (e), and tissue segmentations (c1–c6) to standard MNI space. The normalise_roast_results.m script performs the steps involved in this process:

- Takes a single subject’s ROAST output (e.g. T1, emag, e-field, tissue segmentations) and:

- - Normalises all images to MNI space using SPM’s Normalize: Estimate & Write.

- - Applies the same deformation to other relevant files using Normalize: Write.

- - Smooths the normalized images with a 4 mm FWHM Gaussian kernel.

- - Creates a binary grey+white matter mask (c1c2bin.nii) for later use.


> [!IMPORTANT]  
> Before running the above script, copy-paste the file mri_data/template/TPM.nii into roast/lib/spm12/tpm/TPM.nii. This is necessary for the script to work correctly. Moreover, change the path of line 11 in roast_post_processing_job.m to the location of the TPM.nii file on your machine:

'''matlab
matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.tpm = {'C:\Users\User\github\neuroscience-workshop-Innsbruck-2025\mri_data\template\TPM.nii'};
'''


## Output files
After running the normalisation step, you will find the normalised and smoothed images in the same folder of the original ROAST output files. Discussing each output file in detail is beyond the scope of this document, but here is a brief overview of the most relevant files for group-level analyses:
- sw*emag_.nii (E-field magnituded, unit of V/m)
- sw*e*.nii (E-field vector, unit of V/m)

