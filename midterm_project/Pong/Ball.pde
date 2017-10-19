// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  // CHANGED - speed to 8
  int SPEED = 8;
  // CHANGED - when game is done resets speed to 8
  int resetSPEED = 8;
  
  // CHANGED - size to 80 
  int SIZE = 80;
  // CHANGED - resets ball size when it goes off screen
  int resetSize = 80;
  
  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;
    
  // The colour of the ball
  color ballColor =  color(255, 255, 255); 
  
  // CHANGED - color of the ball changes depending on who hit it 
  color ballColorP1 = color(#e15601);
  color ballColorP2 = color(#2090d8);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;
   

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
       }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity
  
  void reset() {
    x = width/2;
    y = height/2;
  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
  boolean isOffScreen() {
    // CAHNGED - check if the ball is off the left side of the window by checking if it's location is less than 0.
    if (x + SIZE/2 < 0) {
      // CHANGED - add point to P2 each time ball goes off left screen
      trackPointsP2++;
      // CHANGED - size resets to 80 when ball goes off screen
      SIZE = 80;
      // CHANGED - everytime someone scores, speed increases
      SPEED += 15; 
      // CHANGED - direction changes up or down
      vy++;
      // CHANGED - plays beep sound when ball goes off screen
      file.play();

      return true;
    } // CHANGED - check if the ball is off the right side of the window by checking if it's location is greater than the width of the window.
    else if (x - SIZE/2 > width) {
      // CHANGED - add point to P1 each time ball goes off right screen
      trackPointsP1++;
      // CHANGED - size resets to 80 when ball goes off screen
      SIZE = 80;
      // CHANGED - everytime someone scores, speed increases 
      SPEED += 15; 
      // CHANGED - direction changes up or down
      vx++ ;
      // CHANGED - plays beep sound when ball goes off screen
      file.play();
  
      return true;
    } else {
      
      return false;    
    }
  }
  
  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity     

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/ 2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
       
    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
        // CHANGED - size goes down by 5 when hit by paddle and color changes to orange
         SIZE -= 5;
         ballColor = ballColorP1;
      } else if (vx > 0) {
      
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
        // CHANGED - size goes down by 5 when hit by paddle and color changes to blue
        SIZE -= 5;
        ballColor =  ballColorP2;
        
      }
      // And make it bounce
      vx = -vx;
      SPEED += 50;    
    }
  }
   
  // display()
  //
  // Draw the ball at its position

  void display() {
  
  // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
  noStroke();
  // CHANGED - fills ball white 
  fill (ballColor);
  rectMode(CENTER);
  // CHANGED - to ball 
  ellipse(x, y, SIZE, SIZE);
  }
}