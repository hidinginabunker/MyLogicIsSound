SinOsc a => Gain g => dac;

[
1.0, //SENTINEL
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

1000::ms => dur measure;

[measure * 1.0,   // whole note
measure  * 0.5,   // half note
measure  * 0.25,  // quarter note
measure  * 0.125, // eigth note
measure  * 0.0625, // sixteenth note
measure  * 0.03125, // 32nd note
measure  * 0.015625 // 64th note
] @=> dur subDivisions[];


while(true) 
{   
    subDivisions[Std.rand2(0,3)] => dur division;
    0::ms => dur measurePlace;
    0.1 => float gain;
    while(measurePlace <= measure){
        division +=> measurePlace;
        scale[Std.rand2(0,16)] => a.freq;
//        0.1 -=> gain;
//        gain => g.gain;
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