  // Shooter //
  //
  // This is the game, it's in its own class which is then made 
  // into an object called in the main program (shooter.update())
  
  class Shooter {
  
    // This determines the hitbox of the enemies
    int boxSize = 28;
    
    // Variable to get random x locations for the 15 boxes to fall from 
    int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };    
    // Variable telling the boxes to choose a random location on the
    // y axis between -400 and 0 to fall from 
    int[] bally = { int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)),int (random(-400)), int (random(-400)),int (random(-400)),int (random(-400)),int (random(-400)), int (random(-400)) };
    
    // Variable used for where the ship spawns
    int SHOOTER_INSET;
    
    // Variable that controls the speed of the ship
    int SPEED = 5;     
    // Height box for the ship
    int HEIGHT = 30;
    // Width box for the ship
    int WIDTH = 40;
  
    // Variables for movements on x and y axis 
    // also used for velocity 
    int x;
    int y;
    int vx;
    int vy; 
  
    // color shooterColor = color (255, 0, 0);
  
    // Characters used to make the ship move
    char upKey;
    char downKey;
  
    // A boolean that checks if you're playing
    boolean playing = false;
    // A boolean that checks if you returned to the menu
    boolean returnToMenu = false;
    
    // Variable used for shooting enemies
    int shotX;
    
    // Variable for the timer used to keep track of game 
    Timer timer;
    
    // arguments for position and movement of ship and sets 
    // the starting velocity to 0
    Shooter(int _x, int _y, char _upKey, char _downKey) {
      x = _x;
      y = _y;
      vx = 0;
      vy = 0;
  
      upKey = _upKey;
      downKey = _downKey;
  
      // Timer for the game is set to 45 seconds
      timer = new Timer(5000);
    }
  
  // update()
  //
  // Calls the rest of the code into here updates pretty much
  // the whole main game
 
  void update () {   
    // Background is an image I made in photoshop
    background (imgBg);
    
    // What lets you move the ship
    // Updates movement with the velocity 
    x += vx;
    y += vy;
    
    // Constrains the ship to within the window on x and y axis
    // Left a bit of extra room for the x axis just in case
    x = constrain(x, 0 + WIDTH/2-5, width - WIDTH/2 +5);
    y = constrain(y, 0 + HEIGHT/2+10, height - HEIGHT/2 - 20);
  
    // Update the rest of the code into update()
    // so that in the main page there's only 
    // shooter.update() in the case
    ballFalling();
    display();
    outOfScreen();
    shooter.stars();
    shooter.screenInfo();    
    
    // Create the font Ubuntu Rugular for the text in the game
    font = createFont("UbuntuR.ttf", 20);
    
    textFont (font);
    textSize(12);
    fill(255);
    // Timer methode called to dispolay the amount of time left 
    text(timer.getElapsed()/1000, 90, 40);
    // When the time is up the game is done
    shooter.gameOver();
  }
  
  // stars()
  //
  // This gives a bit of life to the game 
  // some quick flickering that can be interpreted as 
  // stars in the distance or space debris
  
  void stars() {   
    fill(0, 0);
    fill(255, 220, 0, 100);
    stroke(150);
    ellipse(random(1000), random(1000), 2, 2);
  }
  
  // startGame()
  //
  // Checks if the player is playing 
  // If they are the timer stars counting up to 60 seconds
  
  void startGame() {    
    playing = true;
    timer.start();   
  }
  
  // display()
  //
  // Draws crucial feature sof the game such as 
  // the ship, the laser 
  
  void display() {
    timer.isDone();
    // The ship you control was made in Photoshop
    img = loadImage ("Craft3.png");
    // The color of the line / laser
    stroke (255, 50, 50);
    image(img, x, y );
    imageMode(CENTER);
    // If statement to check if we shoot
    if (fire)
    {
      shooter(x);
      fire = false;
    }
  }
  
  // getRandomX()
  //
  // Returns random locations for the boxes to fall from on X axis
  // between 30 and 1250
  
  int getRandomX() {
    return int(random(30, 1250));
  }
  
  // ballFalling()
  //
  // This is where the array is for the boxes falling from the top
  // of the screen
  
  void ballFalling() {      
    // White stroke with no fill
    stroke(255, 255, 255); 
    noFill(); 
    for (int i=0; i<15; i++)
    {
      rect(ballx[i], bally[i]++, 20, 20);
    }
  }
    
    
  // shooter(int shotX)
  //
  // Determines if the boxes were hit by the laser
  // if a box is hit then add 1 point 
  
  void shooter(int shotX) {
    // boolean to check if we strike the boxes with the laser
    boolean strike = false;
    // For tyhe array of 15 boxes dos the following
    // if we hit target
    for (int i = 0; i < 15; i++) {
  
      if ((shotX >= (ballx[i]-boxSize/2)) && (shotX <= (ballx[i]+boxSize/2))) {
        strike = true;
        line(shooter.x, shooter.y, shooter.x, bally[i]);
        //fill(color(255, 255, 255, 180));
        noStroke();
        rect(ballx[i], bally[i], boxSize+60, boxSize+60);
        rectMode(CENTER);
        ballx[i] = getRandomX();
        bally[i] = 0;
        score++;
      }
    }
  
    if (strike == false)
    {
      line(shooter.x, shooter.y, shooter.x, 0);
    }
  }
    
  void gameOver() {
  
    textSize(20);
    fill(255);
    //if (playing = true) { 
    if ( timer.isDone() ) {
  
      background (0);    
      font = createFont("UbuntuR.ttf", 20);
      textFont (font);
      textAlign(CENTER);
      fill(255, 255, 255);
      text("TIME LIMIT REACHED", width/2.2, height/2);
      text("Your total points is: "+ score, width/2.2, height/2 + 25);
      text("Press m to try play again", width/2.2, height/2 +50);
      fill(color(0));
      fill(255, 0, 0);
  
      //boolean strike = false;
      // playing = false;
      // if (mousePressed) {
      //fire = false;
      // }
    }
  }
  
  void screenInfo() {
   
    font = createFont("UbuntuR.ttf", 20);
    textFont (font);
    fill(255);
    textSize(12);
    text ("SCORE    ", 50,20);
    text ("TIME    ", 46,40);
    text(score, 90, 20);
    
  }
  
  void outOfScreen() {
  
    for (int i = 0; i < 15; i++) {
  
      if (bally[i]-boxSize/2 > height) {              
        background(imgGo);
        text("Your total score is:", width/2.2, height/2.2 +50);
        text(score, width/2.2, height/2.2 + 100);
        text ("YOU LET ONE TRHOUGH", width/2.2, height/2+300);
        text("Press m to try again", width/2.2, height/2 +200);
      }
    }
  }
  
  void reset() {
    
    score = 0;
    timer.stop();
    ballFalling();
    for (int i = 0; i < bally.length; i++) {
      bally[i] = int (random(-400));
    }
  
    returnToMenu = false;
  }
  
  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative x velocity
      vx = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive x velocity
      vx = SPEED;
    }
    if (key == 'w') {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == 's') {
      // If so we want a positive y velocity
      vy = SPEED;
    }
    if (key == 'e') {
      SPEED = 5;
    }
    if (key == 'm' || key == 'M') {
      returnToMenu = true;
    }
  }
  
  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
  
    if (key == 'w' && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == 's' && vy > 0) {
      // If so it should stop
      vy = 0;
    }
  
    if (key == 'r') {
      SPEED = 30;
      fileW.play();
    }
  }
}
    
  
  
  
    
  