SinOsc b => ADSR b_env => Dyno compressor => Gain g => dac;
1.0 => g.gain;

//SinOsc b => ADSR b_env => Dyno compressor;
1 => b.sync; 
compressor.compress(); 
.4 => compressor.thresh; 
10::ms => compressor.attackTime;

Noise c => LPF c_f => ADSR c_env => b; 
1 => b.gain; 
.35 => c.gain; 
c_f.set(220 * 12, 2); 

1::ms => b_env.attackTime => c_env.attackTime; 
150::ms => b_env.decayTime; 
120::ms => c_env.decayTime; 
0 => b_env.sustainLevel => c_env.sustainLevel; 
120::ms => b_env.releaseTime => c_env.releaseTime; 

//GABE BIT
1000::ms => dur measure;

[measure * 1.0,   // whole note
measure  * 0.5,   // half note
measure  * 0.25,  // quarter note
measure  * 0.125, // eigth note
measure  * 0.0625, // sixteenth note
measure  * 0.03125, // 32nd note
measure  * 0.015625 // 64th note
] @=> dur subDivisions[];
 
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
while(true) 
{   
    subDivisions[Std.rand2(0,4)] => dur division;
    0::ms => dur measurePlace;
    0.1 => float gain;
    while(measurePlace <= measure){
        division +=> measurePlace;
        1 => b_env.keyOn => c_env.keyOn;
        0.2 +=> gain;
        gain => g.gain;
        division +=> now;
    }
        
//    0 => int fill;
//    while (fill <= Std.rand2(1,7)){
//        1 => b_env.keyOn => c_env.keyOn;
//        evens * subDivisions[Std.rand2(0,4)] +=> now;
//        1 +=> fill;
//    }


//    1 => b_env.keyOn => c_env.keyOn;
//    evens +=> now;
//        1 => b_env.keyOn => c_env.keyOn;
//    evens +=> now;
//        1 => b_env.keyOn => c_env.keyOn;
//    odds +=> now;
//    (beats[Std.rand2(0,1)] * Std.rand2f(0.5,2.0) )+=> now;
    //(beats[Std.rand2(0,1)] / 2 )+=> now;
}