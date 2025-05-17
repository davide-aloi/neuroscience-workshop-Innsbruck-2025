% Author: Davide Aloi - Workshop Version
% Simplified script for processing a single ROAST result
% Performs: resampling, normalisation, smoothing, and binary GM+WM mask generation

% Set path to roast output
data_path = '../mri_data/';

% Path to batch job file
jobfile = {'roast_post_processing_job.m'};
jobs = jobfile;

% ---------- INPUTS ---------- %
inputs = cell(4, 1);

% 1. Change Directory
inputs{1} = {data_path};


% 2. T1 image to estimate normalisation. Replace with your original T1 scan
t1 = dir(fullfile(data_path, 'icbm_avg_152_t1_tal_nlin_symmetric_VI.nii'));
inputs{2} = {fullfile(t1.folder, t1.name)};

% 3. Images to normalize + smooth (anat, emag, efield, c1-c6, roast-touched mask)
write_im_names = cell(10, 1);
write_im_names{1} = fullfile(t1.folder, t1.name);  % T1

tmp_emag = dir(fullfile(data_path, '*emag.nii'));
write_im_names{2} = fullfile(tmp_emag.folder, tmp_emag.name);

tmp_e = dir(fullfile(data_path, '*_e.nii'));
write_im_names{3} = fullfile(tmp_e.folder, tmp_e.name);

for i = 1:6
    tmp_seg = dir(fullfile(data_path, sprintf('c%d*T1*T2.nii', i)));
    write_im_names{3+i} = fullfile(tmp_seg.folder, tmp_seg.name);
end


touched_mask = dir(fullfile(data_path, '*T1*T2_SPM_masks.nii'));
write_im_names{10} = fullfile(touched_mask.folder, touched_mask.name);

inputs{3} = write_im_names;

% 4. c1 and c2 masks for binarized GM+WM mask
c1 = dir(fullfile(data_path, 'c1*T1*T2.nii'));
c2 = dir(fullfile(data_path, 'c2*T1*T2.nii'));
inputs{4} = {fullfile(c1.folder, c1.name); fullfile(c2.folder, c2.name)};

% ---------- RUN SPM JOB ---------- %
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
