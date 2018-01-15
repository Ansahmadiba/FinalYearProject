// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// defining a public class triSynth

public class triSynth
{
    // sound sources/ modulation sources/ effects   
    TriOsc TOsc [4];
        
    SinOsc mod [4]; // for FM 
    ADSR env[4];
    NRev rev[4];
    Gain oscGain[4];
    Gain master[4];
    Gain feedback[4];
    Delay d[4];
    Chorus chor[4];

    // putting oscillators to dac
    mod[0] => TOsc[0] => env[0] => chor[0] => rev[0] => oscGain[0] => master[0] => dac;
    mod[1] => TOsc[1] => env[1] => chor[1] => rev[1] => oscGain[1] => master[1] => dac;
    mod[2] => TOsc[2] => env[2] => chor[2] => rev[2] => oscGain[2] => master[2] => dac;
    mod[3] => TOsc[3] => env[3] => chor[3] => rev[3] => oscGain[3] => master[3] => dac;

    // initial parameters set through for loop
    for (0 => int i ; i < 4 ; i++ )
    {
        // 1 => env[i].keyOn;
        0 => TOsc[i].gain => mod[i].gain;
        2 => TOsc[i].sync;
        oscGain[i] => feedback[i] => d[i] => oscGain[i];
        0:: second => d[i].delay => d[i].max;
        0 => feedback[i].gain;
        0 => chor[i].modDepth => chor[i].modFreq;
    }

    // method plays major/minor and 7th chords of given root note, length and volume
    fun void playChord(int root, string quality, dur length, float volume)
    {
        // function will make major or minor chords
        
        // root
        Std.mtof(root)=>TOsc[0].freq;
        volume => TOsc[0].gain;
        // third
        if (quality == "major")
        {
            Std.mtof(root+4) => TOsc[1].freq;
            volume => TOsc[1].gain;
        }
        else if (quality == "minor")
        {
            Std.mtof(root+3) => TOsc[1].freq;
            volume => TOsc[1].gain;
        }
        else if ((quality == "major7") || (quality == "minor7"))
        {
            <<<"Seventh chord selected: Check">>>;    
        }
        else
        {
            <<<"Must specify major/major7 or minor/minor7 chord">>>;
        }
        
        // fifth
        Std.mtof(root+7)=>TOsc[2].freq;
        volume => TOsc[2].gain;
        
        // seventh
        if (quality == "major7")
        {
            Std.mtof(root+11) => TOsc[3].freq;
            volume => TOsc[1].gain;
        }
        else if (quality == "minor7")
        {
            Std.mtof(root+10) => TOsc[3].freq;
            volume => TOsc[1].gain;
        }
        
        for (0 => int i ; i < 4 ; i++)
        {
            1 => env[i].keyOn;
        }
        length => now;
        
        for (0 => int i ; i < 4 ; i++)
        {
            1 => env[i].keyOff;
        }
    }
    
    // method sets ADSR envelope
    fun void envSet (dur attack, dur decay, float sustain, dur release)
    {
        for (0 => int i ; i <4 ; i++)
        {
            (attack, decay, sustain, release) => env[i].set;
        }
    }
    
    // method sets FM settings for synth
    fun void FMod( float modVol, float modFreq)
    {
        for (0 => int i ; i<4 ; i++)
        {
            modVol => mod[i].gain;
            modFreq => mod[i].freq;
        }
    }
    
    // method sets reverb mix
    fun void revMix(float reverb)
    {
        for (0 => int i ; i<4 ; i++)
        {
            reverb => rev[i].mix;
        }
    }
    
    // method sets delay settings on synth
    fun void delaySet(dur delayMax, dur delayT, float fback)
    {
        for (0 => int i ; i<4 ; i++)
        {
            delayMax => d[i].max;
            delayT => d[i].delay;
            fback => feedback[i].gain;
        }
    }
    
    // method sets chorus settings on synth
    fun void chorSet(float MDepth, float MFreq)
    {
        for (0 => int i ; i<4 ; i++)
        {
            MDepth => chor[i].modDepth;
            MFreq => chor[i].modFreq;
        }
    }
}   
    



