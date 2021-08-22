% example5_6
t = [0:.1:2*pi]; % Times at which to sample the sine function
sig = sin(t); % Original signal, a sine wave
partition = [-1:.1:1]; % Length 21, to represent 22 intervals
codebook=[-1,-0.95,-0.85,-0.75,-0.65,-0.55,-0.45,-0.35,-0.25,-0.15,-0.05,0.05,0.15,0.25,0.35,0.45,0.55,0.65,0.75,0.85,0.95,1]; % Length 22, one entry for each interval
[index,quants, distor2] = quantiz(sig,partition,codebook); % Quantize.
plot(t,sig, ' x ',t,quants,'.')
axis([-.2 7 -1.2 1.2])
legend('original signal','quantized output')
[distor2] % Display mean square distortions