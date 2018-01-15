// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// defining global tempo class instance
BPM tempo;

// impulse chucked to resonance filter (sound chain)
Impulse imp => ResonZ res => NRev rev => Gain impGain => Gain master => Pan2 p1 => dac;
impGain => Gain impFeedback => Delay delay => impGain;

// scale array
[51, 53, 55, 56, 58, 60, 62, 63] @=> int scale[];

// arrays to be used for improvisation on chords (arpeggios)
[60, 60+3, 60+7] @=> int first[];
[58, 58+4, 58+7] @=> int scnd[];
[56, 56+4, 56+7] @=> int thrd[];
[65, 65+3, 65+7] @=> int frth[];
// randomize time array
[2,4] @=> int love[];

// setting parameters
500 => res.Q;
.25 => rev.mix;
1::tempo.thirtysecondNote => delay.delay => delay.max;
0.3 => impFeedback.gain;

// initializing check duration to switch between while loops
0::second => dur check;

// main while loop
while (true)
{
    while (true)
    {
        Math.random2(70,90) => imp.next;    // randomizing volume
        Std.mtof(first[Math.random2(0,2)])*8 =>  res.freq;  // selecting freq from first array
        love[Math.random2(0,1)]::tempo.thirtysecondNote => dur playTime;    // randomizing play time
        playTime => now;
        playTime + check => check;  // updating check to ensure break time from while loop
        Math.random2f(-.1,-.2)=>p1.pan;
        // check for break
        if ((check > (8::tempo.quarterNote))||(check > (8::tempo.quarterNote)))
        {
            0::second => check;
            <<<"next">>>;
            break;
        }
    }

    // similar while loops for second, third and fourth arrays 
    while (true)
    {
        Math.random2(70,90) => imp.next;
        Std.mtof(scnd[Math.random2(0,2)])*8 =>  res.freq;
        love[Math.random2(0,1)]::tempo.thirtysecondNote => dur playTime;
        playTime => now;
        playTime + check => check;
        Math.random2f(-.1,-.2)=>p1.pan;
        if ((check > (8::tempo.quarterNote))||(check > (8::tempo.quarterNote)))
        {
            0::second => check;
            <<<"next">>>;
            break;
        }
    }

    while (true)
    {
        Math.random2(70,90) => imp.next;
        Std.mtof(thrd[Math.random2(0,2)])*8 =>  res.freq;
        love[Math.random2(0,1)]::tempo.thirtysecondNote => dur playTime;
        playTime => now;
        playTime + check => check;
        Math.random2f(-.1,-.2)=>p1.pan;
        if ((check > (8::tempo.quarterNote))||(check > (8::tempo.quarterNote)))
        {
            0::second => check;
            <<<"next">>>;
            break;
        }
    }

    while (true)
    {
        Math.random2(40,60) => imp.next;
        Std.mtof(frth[Math.random2(0,2)])*8 =>  res.freq;
        love[Math.random2(0,1)]::tempo.thirtysecondNote => dur playTime;
        playTime => now;
        playTime + check => check;
        Math.random2f(-.1,-.2)=>p1.pan;
        if ((check > (8::tempo.quarterNote))||(check > (8::tempo.quarterNote)))
        {
            0::second => check;
            <<<"next">>>;
            break;
        }
    }
}