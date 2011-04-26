SinOsc melody => Gain melodyMix => dac;
SinOsc drone => Gain droneMix => dac;

1.0 => melodyMix.gain;
0.5 => droneMix.gain;

700::ms => dur tempoUpperBound => dur tempo;
200::ms => dur tempoLowerBound;
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
] @=> float scale[];

["Briskly","Calmly", "Slowly","Sentimentally", "Lovingly", "Nostalgically","Tenderly"] @=> string adverbs[];
["stroking","licking", "touching", "gazing at", "loving","swimming through", "sleeping with"] @=> string gerunds[];
["cats","ice","you","snow","time", "leaves","angels"] @=> string nouns[];

float droneFreq;
float melodyFreq;

while (true){
	<<<adverbs[Std.rand2(0,6)],gerunds[Std.rand2(0,6)],nouns[Std.rand2(0,6)]>>>;
    scale[Std.rand2(0,8)] => droneFreq => drone.freq;
    
    do {
        tempo * Std.rand2f(0, 0.3) +=> tempo;
        scale[Std.rand2(0,6)] => melodyFreq => melody.freq;
      
        tempo +=> now;  
        <<< droneFreq,"hz,",melodyFreq,"hz,",tempo / ms,"ms">>>;
    } until (tempo > tempoUpperBound);
    
    do {
        tempo * Std.rand2f(0,0.3) -=> tempo;
        scale[Std.rand2(3,8)] => melodyFreq => melody.freq;
        
        tempo +=> now;
        <<< droneFreq,"hz,",melodyFreq,"hz,",tempo / ms,"ms">>>;
    } until (tempo <= tempoLowerBound);
    
    Std.rand2f(0, 200) * 1::ms => dur extraTime +=> now;
    <<< droneFreq,"hz,",melodyFreq,"hz,",extraTime / ms,"ms">>>;
	<<<"","">>>;
}
