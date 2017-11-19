
Shooter shooter;

// variable for ship image
PImage  img;

// variables for checking time of when the game started until your time is up
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
    // Size 
    size (1280, 1000);
    smooth ();
    // Time in milliseconds, time interval of 
    lasttimecheck = millis();
    timeinterval = 40000; 
    
    shooter = new Shooter(SHOOTER_INSET, width/2, 'a', 'd');
  }
    
  void draw() {

   //Game Style
   background (0);
  
   
   shooter.update();

   fill(255);
   text(score, 20,20);
  
   ballFalling();
   gameOver();  
    
   shooter.display();

    
  }
  
  void mousePressed()
  {
    fire = true;
  }
  
  void ballFalling()
  {  
    stroke(255, 255, 255); 
    noFill(); 
    
    for (int i=0; i<7; i++)
    {
     rect(ballx[i], bally[i]++, random(10,20), random(10,40));
    }
  }
  

  
  
  // GameOver
  // When time limit is reached the game is done and shows you your total points 
  void gameOver()
  {
    textSize(25);
    fill(255);
    text(second(),20,70);
      if(millis() > lasttimecheck + timeinterval)
      {
        lasttimecheck = millis();
        fill(255, 255, 255);
        text("TIME LIMIT REACHED", width/2.2, height/2);
        text("Your total points is: "+ score, width/2.2, height/2 + 25);
        fill(color(0));
        fill(255, 0, 0);
        textAlign(CENTER);
        noLoop();
       }
      }
      
      void keyPressed() {
       shooter.keyPressed();
        
      }
      
      void keyReleased(){
       shooter.keyReleased();
        
      }
      