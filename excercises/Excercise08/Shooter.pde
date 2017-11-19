class Shooter {
  
int SPEED = 10; // sensitivity

int HEIGHT = 8;
int WIDTH = 8;
    
int x;
int y;
int vx;
int vy; //be able to move forward

color shooterColor = color (255,0,0);

char upKey;
char downKey;

int shotX;

Shooter(int _x, int _y, char _upKey, char _downKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    
    upKey = _upKey;
    downKey = _downKey;    
}

 void update () {
   x += vx;
   y += vy;
  // x = constrain(x,-8 + WIDTH,width - WIDTH + 50);
  x = constrain(x, 0 + WIDTH/2-5, width - WIDTH/2-45);
  // y = constrain(y,0 + HEIGHT/2,height - HEIGHT/2);
 }

  
  void display () {
  img = loadImage ("Craft.png");
  fill(255);
  stroke (255,50,50);
  image(img, x, y );
  imageMode(CORNER);
   if(fire)
    {
      shooter(mouseX);
      fire = false;
    }

   }
   
      void shooter(int shotX)
  { 
    
    // boolean for laser gun 
    boolean strike = false;
    for (int i = 0; i < 7; i++)  // 7 total missiles 
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        line(mouseX, 565, mouseX, bally[i]);
        fill(color(255,255,255,180));
        noStroke();
        rect(ballx[i], bally[i], ballSize+50, ballSize+50);
        rectMode(CENTER);
        ballx[i] = getRandomX();
        bally[i] = 0;


// update score when you deactivate missile
        score++;
      }    
    }
  
    if(strike == false)
    {
      line(mouseX, 565, mouseX, 0);
    }  
  
  }
  
  
     void keyPressed() {
     
    // Keys to control the ship are WASD 
    
    if (key == upKey) {
      vx = -SPEED;
    } 
    else if (key == downKey) {
      vx = SPEED;   
    }
        if (key == 'w') {
      vy = -SPEED;
    } 
    else if (key == 's') {
      vy = SPEED;   
    }
     }
   
    
     void keyReleased() {
       
    // key released for moving the ship,
    // letting go of the WASD keys should stop moving the ship
    
    if (key == upKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } 
    else if (key == downKey && vx > 0) {
      
      vx = 0;
     }
     
         if (key == 'w' && vy < 0) {
      
      vy = 0;
    } 
    else if (key == 's' && vy > 0) {
      // If so it should stop
      vy = 0;
     }
     
    }    
}
   