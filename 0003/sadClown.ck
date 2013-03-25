SinOsc s => dac.left;
SinOsc s2 => dac.right;

500::ms => dur beat;
beat/2    => dur beat2;

30 => float lowerBoundFreq;
400 => float higherBoundFreq;

while (true){
    Std.rand2f(lowerBoundFreq,higherBoundFreq) => s.freq;
    beat +=> now;
    Std.rand2f(lowerBoundFreq,higherBoundFreq) => s2.freq;
    beat2 +=> now;
}