% example5_5 
t = [0:.1:2*pi]; % Times at which to sample the sine function
sig = sin(t); % Original signal, a sine wave
partition = [-1:.2:1]; % Length 11, to represent 12 intervals
codebook = [-1,-0.9,-0.7,-0.5,-0.3,-0.1,0.1,0.3,0.5,0.7,0.9,1]; % Length 12, one entry for each interval
[index,quants, distor1] = quantiz(sig,partition,codebook); % Quantize.
plot(t,sig, ' x ',t,quants,'.')
axis([-.2 7 -1.2 1.2])
legend('original signal','quantized output')
[distor1]% Display mean square distortions
