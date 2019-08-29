%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% endfire
% refer to "A Dual-Microphone Speech Enhancement Algorithm
% Based on the Coherence Function"
%
% broadside
% refer to "A coherence-based noise reduction algorithm for binaural
% hearing aids"
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all
% clear all;
addpath(genpath('lib'));
c = 340; % speed of sound

%%
%% load recorded office noise audio

fs = 16000;

angle = [0,0]/180*pi;
% array spacing
d = 0.0213;
r = d/2; 

slice = [1,3];
[ sig ] = sim.signal_simulation( r,slice );
x = sig.x;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = size(x,2);
%% 
frameLength = 256;
overlap = 128;
inc = frameLength - overlap;
N_FFT = 256;


x1 = x;

%% process

[ out,Fvv2,SNR] = process(x1,d);

%% evaluate
speech = sig.speech;
% [pesq_mos]= pesq_vec(speech, out,fs)
rmpath(genpath('lib'));
util.visual( x(:,1),out );
% util.fig(out, fs);


