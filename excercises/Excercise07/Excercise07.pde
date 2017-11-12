//CHANGED - import mp3 soundfile library
import processing.sound.*;
//CHANGED - variable for mp3 soundfile 
SoundFile fileClickSound;





//Color of background
int size;
color backgroundColor = color(255,255,255);
//The two bouncing objects
Bouncer bouncer;
Bouncer bouncer2;

//Setting up the size, bg color, and specifications for the 2 bouncing objects 
void setup() {
  size(640,480);
  fileClickSound = new SoundFile (this, "soundStrange.mp3"); // CHANGED - added a sound when bouncers hit wall
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//Methods to call/update bouncer
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw(); // for drawing bouncer1
  bouncer2.draw(); // for drawing bouncer2
  bouncer.mouseClicked();//CHANGED - added mouseClicked for bouncer
  bouncer2.mouseClicked();//CHANGED - added mouseClicked for bouncer2
  
}