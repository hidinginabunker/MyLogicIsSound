SinOsc a => dac;
SinOsc b => dac;

170.0 => float initfreq  => float freq;
178.0 => float initfreq2 => float freq2;

while(true){
    
    initfreq  => freq  => a.freq;
    initfreq2 => freq2 => b.freq;  
    1000::ms +=> now;
    
    do {
        
        .1 -=> freq;
        .1 -=> freq2;
        
        freq  => a.freq;
        freq2 => b.freq;
        
        1::ms +=> now;
    } 
    until(freq <= 80);

}
    
    