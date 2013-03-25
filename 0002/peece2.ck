SinOsc melody 	=> Gain melodyMix 		=> dac;
SinOsc baseNote => Gain baseNoteMix 	=> dac;
SinOsc shell 	=> Gain shellNoteMix 	=> dac;

1.0 => melodyMix.gain;
0.5 => baseNoteMix.gain;
0.5 => shellNoteMix.gain;

700::ms => dur tempoUpperBound => dur tempo;
200::ms => dur tempoLowerBound;
30::ms  => dur tempoStep;

//C Minor Scale
[
0.0, //SENTINEL
130.81, //C3 1
146.83, //D3 2
164.81, //E3 3
174.61, //F3 4
196.00, //G3 5
220.00, //A3 6
246.94, //B3 7
264.0, //C4  8
297.0, //D4  9
316.8, //E4 10
352.0, //F4 11
396.0, //G4 12
442.4, //A4 13
475.4, //B4 14
528.0, //C5 15
594.0  //D6 16
] @=> float scale[];

["Briskly","Calmly", "Slowly","Sentimentally", "Lovingly", "Nostalgically","Tenderly"] @=> string adverbs[];
["stroking","licking", "touching", "gazing at", "loving","swimming through", "sleeping with"] @=> string gerunds[];
["cats","ice","you","snow","time", "leaves","angels"] @=> string nouns[];

float baseFreq;
float shellFreq;
float melodyFreq;

while (true){
	<<<adverbs[Std.rand2(0,6)],gerunds[Std.rand2(0,6)],nouns[Std.rand2(0,6)]>>>;
    scale[Std.rand2(1,10)] => baseFreq => baseNote.freq;
	scale[Std.rand2(5,11)] => shellFreq => shell.freq;
    
    do {
        tempo * Std.rand2f(0, 0.3) +=> tempo;
        scale[Std.rand2(6,14)] => melodyFreq => melody.freq;
      
        tempo +=> now;  
        <<< baseFreq,"hz,",shellFreq,"hz,",melodyFreq,"hz,",tempo / ms,"ms">>>;
    } until (tempo > tempoUpperBound);
    
    do {
        tempo * Std.rand2f(0,0.3) -=> tempo;
        scale[Std.rand2(7,16)] => melodyFreq => melody.freq;
        
        tempo +=> now;
        <<< baseFreq,"hz,",shellFreq,"hz,",melodyFreq,"hz,",tempo / ms,"ms">>>;
    } until (tempo <= tempoLowerBound);
    
    Std.rand2f(0, 200) * 1::ms => dur extraTime +=> now;
    <<< baseFreq,"hz,",shellFreq,"hz,",melodyFreq,"hz,",extraTime / ms,"ms">>>;
	<<<"","">>>;
}
