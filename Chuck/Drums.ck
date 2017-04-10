// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// defining public tempo class instance
BPM tempo;

// putting duration into a shorter variable
tempo.quarterNote => dur qtr;

// defining sound samples
SndBuf kick => dac;
SndBuf click => NRev r => Pan2 p1 => dac;

// setting parameters
.24 => kick.gain => click.gain;
1.35 => kick.rate;
.60 => r.mix;

// importing
me.dir(-1) + "/audio/kick_01.wav" => kick.read;
me.dir(-1) + "/audio/click_04.wav" => click.read;

// initial settings
kick.samples() => kick.pos;
click.samples() => click.pos;
-0.4 => p1.pan;
.28 => click.gain;

// click function
fun void clickplay()
{
    while (true)
    {
        1::qtr => now;
        0 => click.pos;
        3::qtr => now;
    }
}

// sporking click function
spork ~ clickplay();


// Mother shred: kick sound
while (true)
{
    2.5::qtr => now;
    Math.random2f(0.175/2,0.2/2)=> kick.gain;
    0 => kick.pos;
    .75::qtr => now;
    Math.random2f(0.175/2,0.225/2)=> kick.gain;
    0 => kick.pos;
    .75::qtr => now;
    
    2.5::qtr => now;
    Math.random2f(0.175/2,0.2/2)=> kick.gain;
    0 => kick.pos;
    .75::qtr => now;
    Math.random2f(0.175/2,0.225/2)=> kick.gain;
    0 => kick.pos;
    .75::qtr => now;
}