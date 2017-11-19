
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
  
  
  