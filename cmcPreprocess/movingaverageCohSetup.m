%Loops throguh each trial to get CMC takes longer...but used for running
%average
% 
myDir = '/Volumes/CassidyLab/EMBARK/EEG/Process/';

%Grab each mat file in the path
myFiles = dir(fullfile(myDir, '*.mat'));

%Loops through each file of interest
for k = 20:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    tic
    load(fullFileName)
clear cohspctrm;
    %Directory to path containg the CMC processing scripts
     cd '/Users/jcassidy/Documents/MATLAB/CMC/cmcPreprocess/';

cfg            = [];
cfg.output     = 'powandcsd';
cfg.method     = 'mtmfft';
cfg.foilim     = [1 50];
cfg.tapsmofrq  = 5;
cfg.keeptrials = 'yes'; 
freq           = ft_freqanalysis(cfg, data);

for i = 1:length(data.trial)
    cfg = [];
    cfg.method = 'coh';
    cfg.trials = i;
    cohspctrm(i) =  ft_connectivityanalysis(cfg, freq);
end


clearvars -except fd data freq cohspctrm myDir myFiles baseFileName fullFileName;

cd '/Volumes/CassidyLab/EMBARK/EEG/ProtocolCMC/';
save(baseFileName, 'cohspctrm')
end





