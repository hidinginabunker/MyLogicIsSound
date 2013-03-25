SinOsc left => Gain leftmix => dac.left;
SinOsc right => Gain rightmix => dac.right;

1.0 => leftmix.gain;
0.0 => rightmix.gain;

700::ms => dur tempoUpperBound => dur tempo;
30::ms  => dur tempoStep;

//C Minor Scale
[264.0, //C
297.0, //D
316.8, //E
352.0, //F
396.0, //G
442.4, //A
475.4, //B
528.0, //C
594.0  //D
] @=> float freqs[];

while (true){
    
    do {
        tempo * Std.rand2f(0, 0.3) +=> tempo;
        
        freqs[Std.rand2(0,6)] => left.freq;
        freqs[Std.rand2(0,4)] => right.freq;
        tempo +=> now;
        <<< tempo / ms, "ms going up">>>;
    } until (tempo > tempoUpperBound);
    
    do {
        tempo * Std.rand2f(0,0.3) -=> tempo;
        freqs[Std.rand2(3,8)] => left.freq;
        freqs[Std.rand2(4,8)] => right.freq;
        tempo +=> now;
        <<< tempo / ms,"ms going down">>>;
    } until (tempo <= 200::ms);
}