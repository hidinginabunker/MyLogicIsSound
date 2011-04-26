SinOsc drone => dac;
199 => drone.freq;

SinOsc lowMelody => dac;
SinOsc highMelody => dac;

while(true){

    200 => lowMelody.freq;
    400 => highMelody.freq;
    1::second => now;

    300 => lowMelody.freq;
    1::second => now;

    1200 => highMelody.freq;
    400 => lowMelody.freq;
    1::second => now;

    800 => highMelody.freq;
    600 => lowMelody.freq;
    1::second => now;

    SinOsc midMelody;
    200 => midMelody.freq;
    midMelody => dac;

    Std.rand2f(600,610) => highMelody.freq;
    Std.rand2f(520,510) => lowMelody.freq;
    4::second => now;
}
