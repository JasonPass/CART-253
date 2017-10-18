import processing.sound.*; //<>// //<>//

SoundFile file;

// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

PImage img;

//Quote that appears for winner
//String [] quotes = { "If you are worrying about being desperate you are probably very wise", "food can be as beautiful as a queen from hell", "You don't need to have to want it enough in order to get rid of insanity","With common confusion comes common rhythm", "If you laugh at chaos, enslave people who are different from you","Advertisers can make certain people have sex with something that nobody has ever had sex with","Consider that you're frustrated with how the world works and remember to look into the mirror and ask who am I?", "Even weirdoes overestimate psychic powers", "Don't laugh. Allow yourself to stay in touch with a moron.", "Thinking outside the box is to assail what we know is unassailable."};

//String [] displayQuotes;

//boolean showText =false;
//int displayIndex =0;

///////////////////////////////
// The background colour during play (black)
color backgroundColor = color(0);

int pointsP1 = 0;
int pointsP2 = 0;

int trackPointsP1;
int trackPointsP2;

int winner = 10;

PFont font;

//CHANGED - font for score


  //color ballColorP1 = color(200,100,40);
//  color ballColorP2 = color(0,0,255);
//boolean gameDone = false;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(800, 500);
 file = new SoundFile (this, "beep.mp3");
  img = loadImage("space.background.png");
  //img2 = loadImage ("TEST2.png");
  //img = loadImage("Mini-bomb.png");
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'i', 'k');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(img);
  


  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  //Shows the points
  displayPoints();
  
  winningPlayer();

  // Check if the ball has collided with either paddle

  ball.collide(leftPaddle);

  
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
    //ball.SPEED ++;
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  
 // if (gameDone) {
   // ball.SPEED = 0;
  }
  
//}
// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

//
void displayPoints() {
  
  font = createFont("digital-7.ttf", 25);
  
  fill(#ea2525);
  // Horizontal alignment and vertical alignment will be centered
  textAlign(CENTER);
  textFont(font);
  textSize(30);
  
  text(trackPointsP1, (width/4), 30);
  
  text(trackPointsP2, width - (width/4), 30);
}




void winningPlayer() {
  
  if (trackPointsP1 == winner) {
    showWinner("Planet Orange has been saved!",color (255,255,255));
   // ball.SPEED = 5;
   // gameDone = true;
    
   reset();
    
 }

  if (trackPointsP2 == winner) {
    showWinner("Planet Blue has been saved!",color (255,255,255));
    
    //gameDone = true;
  //  ball.SPEED = 5;
   reset();
  }
}


void showWinner ( String winningPlayerText, color winningPlayerColor ) {
  
  fill(255, 255, 255);
  // Set text and location
  text("YOU WIN!", width/2, height/3);
  
  // Set text of player who wins and location
  fill(winningPlayerColor);
  text(winningPlayerText, width/2, (height/2 + 80));
  textSize(20);
  text ("R Key to restart", width/2, (height/2 + 140));

  
}

//void colorChange () {
// if collide(Paddle paddle) == true 
 
  
//}

void reset () {
     
   ball.reset();
   

  if (keyPressed && key == 'r'){
    
   ball.vx = ball.resetSPEED;
   ball.vy = ball.resetSPEED;

    trackPointsP1 = 0;
    trackPointsP2 = 0;

   // gameDone = false;
  }
  }  





void keyPressed() {


  
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
   }


// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}