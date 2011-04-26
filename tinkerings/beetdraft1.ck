SinOsc b => ADSR b_env => Dyno compressor => dac; 
1 => b.sync; 
compressor.compress(); 
.4 => compressor.thresh; 
10::ms => compressor.attackTime; 

Noise c => LPF c_f => ADSR c_env => b; 
0.3 => b.gain; 
.35 => c.gain; 
c_f.set(220 * 12, 2); 

1::ms => b_env.attackTime => c_env.attackTime; 
150::ms => b_env.decayTime; 
120::ms => c_env.decayTime; 
0 => b_env.sustainLevel => c_env.sustainLevel; 
120::ms => b_env.releaseTime => c_env.releaseTime; 


// MAIN
200::ms => dur evens;
evens * 2 => dur odds;
[evens,odds] @=> dur beats[];

while(true) 
{
    1 => b_env.keyOn => c_env.keyOn;
    (beats[Std.rand2(0,1)] * 1 )+=> now;
    //(beats[Std.rand2(0,1)] / 2 )+=> now;
}
