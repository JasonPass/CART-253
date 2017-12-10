  
  class Menu {
    
    
    // A variable to track the user's selection (starts as NONE)
  
    State selection = State.NONE;
  
    // A constructor that does nothing
    Menu() {
    }
  
    // update()
    //
    // The update method just displays the menu
    
    void update() {
      display();
    }
  
    // display()
    //
    // The display method displays the options available in the game
    
    void display() {      
      background(0);
      font = createFont("UbuntuR.ttf", 20);
      textFont (font);
      textAlign(CENTER);
      textSize(32);
      text("Press k to start game", width/2, 500 );
      textSize(20);
      text("Use WASD to move and left click to fire", width/2, height/2 +50);
      text("Press r for hyperspeed and e to cruise", width/2, height/2 +80);
      text("Remember you have an emergency rear laser canon!", width/2, height/2 +110);
    }
    
  
    // keyPressed()
    //
    // Called by the main program when the menu is active. If the player
    // presses a key to select one of the game versions, this object
    // will remember the state chosen.
    
    void keyPressed() {
      if (key == 'k' || key == 'K') {
         selection = State.SHOOTER;
         shooter.startGame();
      }
    }
      
        
  
    // keyReleased()
    //
    // Does nothing.
    
    void keyReleased() {
    }
  }