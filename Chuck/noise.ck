// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// Noise sound chain
Noise n => Pan2 p => dac;

// BPM tempo;
BPM tempo;

// noise gain set
.00105 => n.gain;

// noise with a sine oscillating volume and pan
while (true)
{
    Math.sin(now/(60.0/800)::second *2*pi)=> p.pan;
    .0005 * Math.sin(now/(60.0/200)::second *2*pi) + .00105 => n.gain; 
    10::ms => now;    
}
