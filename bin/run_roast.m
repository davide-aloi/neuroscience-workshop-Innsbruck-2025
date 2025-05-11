
%% First let's move to the roast directory.
cd roast

%% Roast Demo
% Before running roast on our own data and with specific parameters,
% let's run a test simulation to check if everything is working as expected.
% By running the following command (or roast('nyhead') if you have a powerful machine with 
% more than 50GB of RAM), we can check if the installation is working properly.
roast

% The above command will run a simulation on one of the test scans present
% in roast/example. 

%% Two common issues might happen at this point: 
% 1. ROAST needs the Image Processing Toolbox. If that happens, you will have to install it and run the function again.
% This might take a while. 

% 2. Slightly more complicated issue. If you are running ROAST on a 64bit windows machine,
% you might get an error related to the iso2mash library used by ROAST (the error message might look
% something like: "Error using cgalv2m (line xx) output file was not found, failure was encountered when running command:").
% If this happens, close matlab, and delete the folder roast/lib/iso2mesh. 
% Then, from the terminal, cd to the roast/lib directory and run the following commands
% git clone git clone https://github.com/fangq/iso2mesh
% This shuold solve the issue.

%%  Paths to the t1 scan
t1_scan = 'C:\Users\User\github\neuroscience-workshop-Innsbruck-2025\mri_data\icbm_avg_152_t1_tal_nlin_symmetric_VI.nii'; 
t1 = fullfile(t1_scan)

%% Roast settings:
% Let's use some widely used electrodes locations for motor cortex stimulation.
% C3	Central, left hemisphere	Over the left motor cortex (somatomotor area)
% Fp2	Frontal polar, right hemisphere	Right frontopolar cortex (prefrontal region)

roast(t1, {'C3', 1.85,'Fp2', -1.85}, 'capType', '1020' ,'elecType', 'pad', 'elecSize', [50 50 3], 'zeroPadding', 60)

% Add zeroPadding to ensure the head is not touching the image boundary.
% This creates extra space around the scalp, allowing electrodes and gel layers
% to be placed fully within the volume and preventing meshing errors.


% Feel free to experiment and change the parameters as you like. Moreover, you can try to run the simulation using
% both a t1 and a t2 scan. For this, you will need to have a t2 scan and specify it in the roast function. 
% i.e.,
% roast(t1, {'C3', 1.85,'Fp2', -1.85}, 'T2', t2, 'capType', '1020' ,'elecType', 'pad', 'elecSize', [50 50 3])

% TIP: In roast/example you can find a number of scans that you can play
% around with and experiment.

