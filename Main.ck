// Assignment_Final_ALGORISM(Ambient_ChuckScapes)


BPM tempo;

Hid hid; 
HidMsg msg; 

0 => int device; 

if (hid.openKeyboard( device ) == false ) me.exit(); 
    <<<"keyboard:", hid.name() + "ready">>>;

[51, 53, 55, 56, 58, 60, 62, 63] @=> int scale[];

// defining a triSynth instanc
triSynth TO;
// setting envelope through method
TO.envSet(.8::second, .24::second, .68, .4:: second);
// setting FM settings through method
TO.FMod(1.5, 40);
// setting reverb, chorus and delay settings through methods
TO.revMix(.3);
TO.chorSet(.00125,5);
TO.delaySet(4::tempo.quarterNote, 2::tempo.quarterNote, .6 );

// playing chord progression through playChord method
while (true)
{
    hid => now; 
    
    while ( hid.recv ( msg) ){
        //check if button pressed
        if ( msg.isButtonDown() ){
            TO.playChord (msg.ascii, "minor", 5:: tempo.quarterNote , .05 );
            3:: tempo.quarterNote => now;
        }
     }
    
 
}

