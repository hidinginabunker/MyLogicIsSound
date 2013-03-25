SinOsc left => Gain leftmix => dac.left;
SinOsc right => Gain rightmix => dac.right;

3.0 => leftmix.gain;
0.0 => rightmix.gain;

300::ms => dur tempoUpperBound => dur tempo;
5::ms  => dur tempoStep;

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
    
    while(tempo <= tempoUpperBound){
        tempo + tempoStep => tempo;
        
        freqs[Std.rand2(0,4)] => left.freq;
        freqs[Std.rand2(0,4)] => right.freq;
        tempo +=> now;
        <<< tempo >>>;
    }
    
    while(tempo >= tempoStep) {
        tempo - tempoStep => tempo;
        freqs[Std.rand2(4,8)] => left.freq;
        freqs[Std.rand2(4,8)] => right.freq;
        tempo +=> now;
        <<< tempo >>>;
    }
}