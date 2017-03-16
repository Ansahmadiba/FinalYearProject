
//Import Libraries  

import de.voidplus.leapmotion.*;
import oscP5.*;
import netP5.*;

//Class Objects
LeapMotion leap;  
OscP5 oscP5;
NetAddress myBroadcastLocation;

//Open Sound Control (OSC)

//Server, Send Port & Recieve Port for data

String oscServer = "127.0.0.1";
int oscServerPortSend = 6451;
int oscServerPortReceive = 6452;

//pattern OSC text
String pattern = "";
String tagType = "";
float val = 0;
ScreenTapGesture g;

      int button =0;
      int prev_button = 0;


void setup() {

     //Screen Size according to resolution  
     size(displayWidth, displayHeight/7+displayHeight/2);

     leap = new LeapMotion(this).allowGestures();  // All gestures

     //White Background 
     background(198,110,5);
    
     smooth();
     frameRate(24);
    
     //Instantiation of a new leap,OscP5 objects
     leap = new LeapMotion(this);
     oscP5 = new OscP5(this, oscServerPortReceive);
     
     //Address of the Osc Receiver
     myBroadcastLocation = new NetAddress(oscServer, oscServerPortSend);

}

void draw() {
  
  //to not draw anything on canvas(Clear the drawing on canvas)
  background(128,0,50);
  stroke(204, 102, 0);
  strokeWeight(2);
       
        int r1LX=0;
        int r1LY=0;
        float r1displayWidth=displayWidth/6;
        float r1displayHeight=displayHeight/7;
        
        rect(r1LX,r1LY,r1displayWidth,r1displayHeight);
       
        int r2LX=0;
        int r2LY=displayHeight/7;
        float r2displayWidth=displayWidth/6;
        float r2displayHeight=displayHeight/6;
        float touchAreaR2=displayHeight/3.3;

        rect(r2LX,r2LY,r2displayWidth,r2displayHeight);
    
        int r3LX=0;
        float r3LY=displayHeight/3.3;
        float r3displayWidth=displayWidth/6;
        float r3displayHeight=displayHeight/6;
        float touchAreaR3=displayHeight/2.13;
        
        rect(r3LX,r3LY,r3displayWidth,r3displayHeight);
  
        int r4LX=0;
        float r4LY=displayHeight/2.13;
        float r4displayWidth=displayWidth/6;
        float r4displayHeight=displayHeight/6;
        float touchAreaR4=displayHeight/2.13;

        rect(0,r4LY,r4displayWidth,r4displayHeight);
 
 
        rect(displayWidth/2+displayWidth/3,0,displayWidth/6,displayHeight/7);
        
        rect(displayWidth/2+displayWidth/3,displayHeight/7,displayWidth/6,displayHeight/6);
        
        rect(displayWidth/2+displayWidth/3,displayHeight/3.3,displayWidth/6,displayHeight/6);
        
        rect(displayWidth/2+displayWidth/3,displayHeight/2.13,displayWidth/6,displayHeight/6);


    //Testing finger as a 
    
    customGesture();
    
  }


void customGesture(){
  
    strokeWeight(2);
    
        int r1LX=0;
        int r1LY=0;
        float r1displayWidth=displayWidth/6;
        float r1displayHeight=displayHeight/7;
        
        
        int r2LX=0;
        int r2LY=displayHeight/7;
        float r2displayWidth=displayWidth/6;
        float r2displayHeight=displayHeight/6;
        float touchAreaR2=displayHeight/3.3;
        
        
        int r3LX=0;
        float r3LY=displayHeight/3.3;
        float r3displayWidth=displayWidth/6;
        float r3displayHeight=displayHeight/6;
        float touchAreaR3=displayHeight/2.13;
  
        int r4LX=0;
        float r4LY=displayHeight/2.13;
        float r4displayWidth=displayWidth/6;
        float r4displayHeight=displayHeight/6;
        float touchAreaR4=displayHeight/2.13;
        
        
  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {

    // ==================================================
    // 1. Hand

//    int     handId             = hand.getId();
//    PVector handPosition       = hand.getPosition();
//    PVector handStabilized     = hand.getStabilizedPosition();
//    PVector handDirection      = hand.getDirection();
//    PVector handDynamics       = hand.getDynamics();
//    float   handRoll           = hand.getRoll();
//    float   handPitch          = hand.getPitch();
//    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector handOrigin =  hand.getPalmPosition();
 
//    PVector spherePosition     = hand.getSpherePosition();
//    float   sphereRadius       = hand.getSphereRadius();

    
    //===================================================
    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
//      PVector fingerStabilized = finger.getStabilizedPosition();
//      PVector fingerVelocity   = finger.getVelocity();
//      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();
      

      int state=1;
   
      
      // update button
      prev_button = button;
      if(fingerPosition.x < r1displayWidth && r1displayHeight>fingerPosition.y && hand.getGrabStrength ()>0.60)  {
           button = 1; // top left
       }
      else if(fingerPosition.x < r2displayWidth && touchAreaR2>fingerPosition.y && hand.getGrabStrength ()>0.60) {
            button = 2;
      }     
      else if(fingerPosition.x < r3displayWidth && touchAreaR3 >fingerPosition.y && hand.getGrabStrength ()>0.60) {
        button = 3;
      }
      else if(fingerPosition.x < r4displayWidth && hand.getGrabStrength ()>0.60) {
        button = 4;
      }
      
      if(button==1 && prev_button != button )  {
        
        println("Note 1 selected");
        
        rect(fingerPosition.x, fingerPosition.y, 10, 10);
       }        
        
        switch(state){
          
        case 1://start
        
        case('s'):case('S'):
                
        OscMessage myOscMessage = new OscMessage("/hello");
        
        //add a value to the OscMessage
        myOscMessage.add("Hello World! " + val);
        
        //send the OscMessage to a remote location specified in myNetAddress
        oscP5.send(myOscMessage,myBroadcastLocation);
        
        break;
        
        default:
         break;
        }
        
        }
        else if(button==2 && prev_button != button){
         rect(fingerPosition.x, fingerPosition.y, 30, 30);
         
         println("Note 2 selected");
        
        }
      else if(button==3 && prev_button != button){
         rect(fingerPosition.x, fingerPosition.y, 10, 10);
         
         println("Note 3 selected");
        
        }
        else if(button==4 && prev_button != button ){
        //   background(50,255,255);
        
            println("Note 4 selected");
        //  fill(103);
            ellipse(fingerPosition.x, fingerPosition.y, 20, 20);
  
        }
        else{
        fill(30,0,30);
        ellipse(fingerPosition.x,fingerPosition.y, 10 , 10);
        }
     }
   }
}


void oscEvent(OscMessage theOscMessage){
  
  pattern = theOscMessage.addrPattern();
  tagType = theOscMessage.typetag();
  val = theOscMessage.get(0).floatValue();

}
