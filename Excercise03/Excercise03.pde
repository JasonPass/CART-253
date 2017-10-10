//Color of background
int size;
color backgroundColor = color(255,255,255);
//The two bouncing objects
Bouncer bouncer;
Bouncer bouncer2;

//Setting up the size, bg color, and specifications for the 2 bouncing objects 
void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//Methods to call/update bouncer
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw(); //Constructor for drawing bouncer1
  bouncer2.draw(); //Constructor for drawing bouncer2
  bouncer.mouseClicked();//CHANGED - added mouseClicked constructor for bouncer
  bouncer2.mouseClicked();//CHANGED - added mouseClicked constructor for bouncer2
  
}