function key = dtmfdeco(xx,fs)
%DTMFDECO key = dtmfdeco(xx,[fs])
% returns the key number corresponding to the DTMF waveform, xx.
% fs = sampling freq (DEFAULT = 8000 Hz if not specified.
%
if (nargin < 3), fs = 8000; end;
tone_pairs = ...
[ 697 697 697 770 770 770 852 852 852 941 941 941;
1209 1336 1477 1209 1336 1477 1209 1336 1477 1336 1209 1477 ];
