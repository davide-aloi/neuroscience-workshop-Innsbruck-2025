% Davide Aloi - PhD student - University of Birmingham - Centre for Human
% Brain Health.

t1_scan = '../mri_data/Template-T1-U8-RALPFH-HR.nii.gz'; % Main folder

%% Roast settings:
% Anode over the right cheek (e239 in egi system)
% Cathode over right cerebellum (e157)
t1 = fullfile(t1.folder, t1.name)

roast(t1, {'e239', 1.85,'e157', -1.85}, 'captype', 'egi' ,'electype', 'pad', 'elecsize', [50 50 3])

