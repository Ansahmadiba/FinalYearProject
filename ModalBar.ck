// Assignment_Final_ALGORISM(Ambient_ChuckScapes)

// ModalBar sound chain 
ModalBar MBar1 => NRev rev1 => Pan2 p1 => dac;
ModalBar MBar2 => NRev rev2 => Pan2 p2 => dac;

// defining public tempo class instance
BPM tempo;

// setting params
tempo.quarterNote => dur quarter;
.05 => rev2.mix;

while (true)
{
    // setting probabilities to change the granularity of modalbar hits
    Math.random2(1,10) => int select;
    if (select>8)
    {    
        Math.random2f(.27,.38) => MBar1.strike;
        1:: quarter => now;
    }
    else if (select < 3)
    {
        Math.random2f(.27,.38) => MBar1.strike;
        .5:: quarter => now;
    }
    else
    {
        Math.random2f(.27,.38) => MBar1.strike;
        .25:: quarter => now;
    }
    // randomizing pan
    Math.random2f(-4,4) => p1.pan;
}





