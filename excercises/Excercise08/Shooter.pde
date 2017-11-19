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

  