// Shooter //
//
// This is the game, it's in its own class which is then made 
// into an object called in the main program (shooter.update())

class Shooter {
  
  // This determines the hitbox of the enemies
  int boxSize = 28;
  
  // Variable to get random x locations for the 15 boxes to fall from 
  int[] boxX = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };    
  // Variable telling the boxes to choose a random location on the
  // y axis between -400 and 0 to fall from 
  int[] boxY = { int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)),int (random(-400)), int (random(-400)),int (random(-400)),int (random(-400)),int (random(-400)), int (random(-400)) };
  
  // Variable used for where the ship spawns
  int SHOOTER_INSET;
  
  // Variable that controls the speed of the ship
  int SPEED = 6;     
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

  // Characters used to make the ship move
  char leftKey;
  char rightKey;

  // A boolean that checks if you're playing
  boolean playing = false;
  // A boolean that checks if you returned to the menu
  boolean returnToMenu = false;
  
  // Variable used for shooting enemies
  int shotX;
  
  // Variable for the timer used to keep track of game 
  Timer timer;
  
  // Arguments for position and movement of ship and sets 
  // the starting velocity to 0
  Shooter(int _x, int _y, char _leftKey, char _rightKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    leftKey = _leftKey;
    rightKey = _rightKey;

    // Timer for the game is set to 60 seconds
    timer = new Timer(30000);
  }
  
  // update()
  //
  // Calls the rest of the code into here updates pretty much
  // the whole main game
 
  void update () {   
    //imgDone = loadImage("background.for.game.done.jpg");
    
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
    boxFalling();
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
  
  // boxFalling()
  //
  // This is where the array is for the boxes falling from the top
  // of the screen
  
  void boxFalling() {      
    // White stroke with no fill
    stroke(255, 255, 255); 
    noFill(); 
    for (int i=0; i<15; i++)
    {
      rect(boxX[i], boxY[i]++, 20, 20);
    }
  }
        
  // shooter(int shotX)
  //
  // Determines if the boxes were hit by the laser
  // if a box is hit then add 1 point 
  
  void shooter(int shotX) {
    // Boolean to check if we strike the boxes with the laser
    boolean strike = false;
    // For the array of 15 boxes do the following
    // if we hit target
    for (int i = 0; i < 15; i++) {
      
      // Checks if we hit a box, if we did do the following
      if ((shotX >= (boxX[i]-boxSize/2)) && (shotX <= (boxX[i]+boxSize/2))) {
        // Strike becomes true if we hit a box
        strike = true;
        // Shoots line from this location, line goes up until boxY
        line(shooter.x, shooter.y, shooter.x, boxY[i]);
        // Slight red hue when they explode                                    
        fill(255, 220, 220);
        noStroke();
        // When a box is shot they explode + 60 of their size
        rect(boxX[i], boxY[i], boxSize+60, boxSize+60);
        rectMode(CENTER);
        boxX[i] = getRandomX();
        // Box spawns at random locatioon between
        // 0 and 100 when hit
        boxY[i] = int (random(0, 100));
        // Adds a point each time we hit a box
        score++;
      }
    }
    // if we don't strike anything than just fire a red 
    // line a accross the screen
    if (strike == false)
    {
      // Shoots line from this location, line goes to the end of screen
      line(shooter.x, shooter.y, shooter.x, 0);
    }
  }
  
  // gameOver()
  //
  // When the timer is done your time is up 
  // You will see your total score along with the 
  // gameOver graphic / text
    
  void gameOver() {     
    textSize(20);
    fill(255);    
    // If the timer reaches 60 seconds the game is done
    if (timer.isDone()) {
  
      background (imgDone);    
      font = createFont("UbuntuR.ttf", 20);
      textFont (font);
      textAlign(CENTER);
      fill(255, 255, 255);  
      text("Thank you for playing!", width/2.2, height/2);
      text("Your total score is: "+ score, width/2.2, height/2 + 25);
      text("Press m to try play again", width/2.2, height/2 +90);
      fill(color(0));
      fill(255, 0, 0);
      // Turns the boxes un-hittable so that players cant
      // accumulate extra points while in this state 
      boxSize = 0;
    }
  }
  
  // screenInfo()
  //
  // This is the information you see at the top left 
  // corner of the window
  
  void screenInfo() {  
    font = createFont("UbuntuR.ttf", 20);
    textFont (font);
    fill(255);
    textSize(12);
    text ("SCORE    ", 50,20);
    text ("TIME    ", 46,40);
    text(score, 90, 20);    
  }
  
  // outOfScreen()
  //
  // When the box falls through the force field the game will end 
  // and you will be shown a screen of the box approaching earth 
  // along with your total score 
  
  void outOfScreen() {
    // The array of 15 boxes
    for (int i = 0; i < 15; i++) {
      
      // If one of them is greater then the height
      // activate the following
      if (boxY[i]-boxSize/2 > height) {              
        background(imgGo);
        text("Your total score is:", width/2.2, height/2.2 +50);
        text(score, width/2.2, height/2.2 + 100);
        text ("YOU LET ONE TRHOUGH", width/2.2, height/2+300);
        text("Press m to try again", width/2.2, height/2 +200);
        // Turns the boxes un-hittable so that players cant
        // accumulate extra points while in this state 
        boxSize = 0;
      }
    }
  }
  
  // reset()
  //
  // Reset the game by pressing m, resets the time and 
  // the boxes randomly, returns player to the menu
  
  void reset() {
    // Resets socre back 0
    score = 0;
    // Resets  the timer back to 0
    timer.stop();
    // Respawns the boxes at the top randomly 
    boxFalling();
    // Puts the box size back to its default value 
    boxSize = 28;
    // The boxes are spawned randomly from -400 to 0
    for (int i = 0; i < boxY.length; i++) {
      boxY[i] = int (random(-400));
    }    
    returnToMenu = false;
  }
  
  // keyPressed()
  //
  // Called in the main program, all the ship movements 
  // and velocity are here
    
  void keyPressed() {
    // Check if the key is th left key
    if (key == leftKey) {
      // If so we want a negative x velocity
      vx = -SPEED;
    } 
    // Otherwise check if the key isth right key 
    else if (key == rightKey) {
      // If so we want a positive x velocity
      vx = SPEED;
    }
    
    if (key == 'w') {
      // If so we want a negative y velocity
      vy = -SPEED;
    } 
    // Otherwise check if the key is our down key 
    else if (key == 's') {
      // If so we want a positive y velocity
      vy = SPEED;
    }
    
    if (key == 'e') {
      SPEED = 6;
    }
    
    if (key == 'm' || key == 'M') {
      returnToMenu = true;
    }
  }
  
  // keyReleased()
  //
  // keyReleased is also called in the main program
  // Makes sure that hen you release a WASD key that the ship stops moving

  void keyReleased() {
    // Check if the key is left key and the ship is moving left
    if (key == leftKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } 
    // Otherwise check if the key is the right key and the ship is moving right 
    else if (key == rightKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
    // Checks if the key is the up key and moving
    if (key == 'w' && vy < 0) {
      // If so it should stop
      vy = 0;
    } 
    // Checks if the key is the down key and the ship is moving down 
    else if (key == 's' && vy > 0) {
      // If so it should stop
      vy = 0;
    }
    // R is you boost mode which changes the SPEED variable to 30 
    // Also plays a sound when activated
    if (key == 'r') {
      SPEED = 30;
      fileW.play();
    }
  }
}

    
  
  
  
    
  