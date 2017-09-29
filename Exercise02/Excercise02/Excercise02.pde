//Background color
color backgroundColor = color(0);

//Variables for static background
int numStatic = 1; //CHANGED lower static
int staticSizeMin = 0; //CHANGED min to 0
int staticSizeMax = 20; //CHANGED max size to 20
color staticColor = color(200,40,30); //CHANGED color of static to dark red

//Variables of paddle dimensions, speed of paddle, and color
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 155; //CHANGED - made longer
int paddleHeight = 16;
color paddleColor = color(255);

//Variables for the ball dimensions, location, velocity, and color
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(180,80,80); //CHANGED - added color to the ball 

//CHANGED - added new box
int boxX;
int boxY;
int boxVX;
int boxVY;
int boxSize = 44;
int boxSpeed = 8;
int boxColor = color(180,80,80);


 

//The setup for the size, paddle position, and ball position
void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
  setupbox();
}

//Functions for the paddle
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//Setting up the ball in the middle of the screen and ball velocity
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//CHANGED setup for new box
void setupbox() {
  boxX = width/2;
  boxY = height/2;
  boxVX = boxSpeed;
  boxVY = boxSpeed;
  
}


//Calling the functions for the static, ball, and paddle
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
  
  drawbox();
  updatebox();
  
}

//Drawing the loop of static with arguments
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

//Function that allows the paddle to move across X axis
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

//Function for ball movement speed
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  //Functions for the way the ball behaves
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
  
}

//CHANGED functions for box movements 
void updatebox() {
  boxX += boxVX;
  boxY += boxVY;
  handleBoxHitPaddle();
  handleboxHitWall();
  handleboxOffBottom();
}
  

//Function for drawing paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//Functions for drawing ball
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize); 
}

//CHANGED - function that draws box
void drawbox() {
  rectMode(CENTER);
  stroke(255);
  fill(boxColor);
  rect(boxX, boxY, boxSize, boxSize);
}


    

//Function for how the ball behaves when it hits the paddle
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    ballColor = ballColor + 50;//CHANGED - when ball hits paddle the color value go up by 50
  }
}

//CHANGED - function for how the box behaves when it hits the paddle - NEW FUNCTION box gets bigger and smaller when hit
void handleBoxHitPaddle() {
  if (boxOverlapsPaddle()) {
    boxY = paddleY - paddleHeight/2 - boxSize/2;
    boxVY = -boxVY;
    boxColor = boxColor -80; 
    boxSize = boxSize +5;
    boxSize = paddleWidth - boxSize/1;
  }
 

}

//Boolean function that checks if the ball hits the paddle, if it does it returns true, if not it returns false
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}



//CHANGED function that checks if the box hits the paddle, if it does it returns true, if not it returns false
boolean boxOverlapsPaddle() {
  if (boxX - boxSize/2 > paddleX - paddleWidth/2 && boxX + boxSize/2 < paddleX + paddleWidth/2) {
    if (boxY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
 }

//Function for when the ball falls of the screen, the ball will be reset
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

//CHANGED - where the box falls from the screen
void handleboxOffBottom() {
  if (boxOffBottom()) {
    boxX = width/8;
    boxY = height/5; 
  }
}


//Boolean function that checks if the ball falls out of the screen, if it does it calls the function to reset it
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

//CHANGED Checks if the ball falls out off the screen, if it does it calls the function to reset it
boolean boxOffBottom() {
  return (boxY - boxSize/2 > height);
}

//Function for how the ball behaves when it hits the left, right or top wall, if it does it moves in opposite dirrection
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//CHANGED - how the ball behaves when it hits the left, right or top wall, if it does it moves in opposite dirrection
void handleboxHitWall() {
  if (boxX - boxSize/2 < 0) {
    boxX = 0 + boxSize/2;
    boxVX = -boxVX;
  } else if (boxX + boxSize/2 > width) {
    boxX = width - boxSize/2;
    boxVX = -boxVY;
  }
  
  if (boxY - boxSize/2 < 0) {
    boxY = 0 + boxSize/2; 
    boxVY = -boxVY;
  }
}



//Function that controls the paddle when the left and right arrows are pressed
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

//Funtions that controls left and right movements when the keys are released 
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}