function tones = dtmfdial(nums)
%DTMFDIAL Create a vector of tones which will dial
% a DTMF (Touch Tone) telephone system.
%
% usage: tones = dtmfdial(nums)
% nums = vector of numbers ranging from 1 to 12
% tones = vector containing the corresponding tones.
%
if (nargin < 1)
error('DTMFDIAL requires one input');
end
fs = 8000; %-- This MUST be 8000, so dtmfdeco( ) will work.
