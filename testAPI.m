
clear;clc;clear java;
% For Matlab versions previous to 2010, run these lines:
javaaddpath(fullfile('/lib/bluecove-2.1.1-SNAPSHOT.jar'));
javaaddpath(fullfile('/lib'));

%%

mac = '001301040216';
SamplingRate = 1000;
analogChannels = [4];
nSamples = 10000;

bit = bitalino();

% Open bluetooth connection with bitalino
bit = bit.open(mac,SamplingRate);

% while 1
if bit.connection
    % get bitalino version
    bit.version();
    pause(2);
    %start acquisition on channel A4
    bit = bit.start(analogChannels);
    disp('Start Acquisition')
    % read samples
    data = bit.read(nSamples);
    disp('Data read')
    %stop acquisition
    bit.stop();
    %plot channel acquired
    plot(data(6,:))
end

%close connection
bit.close();




