// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// defining public tempo class instance
BPM tempo;

// shakers sound chain
Shakers shak1 => NRev rev1 => Pan2 p1 => dac; 
Shakers shak2 => NRev rev2 => Pan2 p2 => dac;

// initial params set
.05 => rev1.mix => rev2.mix;
4 => shak2.preset;

// function for purcussive water droplets created by a Shaker preset
fun void waterdrop()
{
    while (true)
    {
        Math.random2f(.38,.56) => shak2.noteOn;     // randomizing volume
        .125 :: tempo.quarterNote => now;
        Math.random2f(-.30,-.45)=> p2.pan;          // randomizing pan
    }
}

// sporking water droplet sound
spork ~ waterdrop();

// Mother program
while (true)
{
    Math.random2(5,6) => shak1.preset;              // switching between presets
    Math.random2f(.05,.10) => shak1.noteOn;         // randomizing volume
    .125 :: tempo.quarterNote => now;
    Math.random2f(.30,.45)=> p1.pan;                // randomizing pan    
}




