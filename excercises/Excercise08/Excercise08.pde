
Shooter shooter;

// variable for ship image
PImage  img;

// varisbles for checking time of when the game started until your time is up
float lasttimecheck;
float timeinterval;

int SHOOTER_INSET = 640;


int score;
int ballSize = 15;
//boolean for the laser fired from the ship
boolean fire = false;
  
// gameOver variable
int gameOver = 0;
 
// startGame;
int getRandomX()

  {
    return int(random(1000));
  }
  
  int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] bally = { 0, 0, 0, 0, 0, 0, 0};
  
  
   void setup()
  {
    //Size 
    size (1280, 1000);
    smooth ();
    lasttimecheck = millis();
    timeinterval = 40000; 
    
    shooter = new Shooter(SHOOTER_INSET, width/2, 'a', 'd');
    //shooter = new Shooter(SHOOTER_INSET, width/2, 'w', 's');

  }
    
  void draw() {

   //Game Style
   background (0);
   fill(0,2);
   //rect(0, 0, 1280, 720);
   fill(255);
   noStroke();
   ellipse(random(width), random(height), 2, 2);
  
   
   shooter.update();
    //fill(0);
    //stroke (255);
   // triangle(mouseX-15, 600, mouseX+15, 600, mouseX, 565);
    // display score
    
    fill(255);
    text(score, 20,20);
    //if(fire)
   // {
     // shooter(mouseX);
     // fire = false;
   // }
  
     ballFalling();
     gameOver();  
    
     shooter.display();

    
  }