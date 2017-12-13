// Menu //
//
// This class is for the menu
// This is where you're reset if the time runs out or if you press m 
   
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
  // The display method displays what makes up the menu screen
  
  void display() {            
    background(0);
    font = createFont("UbuntuR.ttf", 20);
    textFont (font);
    textAlign(CENTER);
    textSize(35);
    text("Press k to start game", width/2, 800 );
    textSize(20);
    // Info the player needs to know before playing
    text("Your mission: defend planet earth for 60 seconds", width/2, height/2 - 40);
    text("Do not let them through the force field", width/2, height/2 - 10);
    text("Use WASD to move and left click to fire", width/2, height/2 + 20);
    text("Press r for hyperspeed and e to cruise", width/2, height/2 + 50);
    text("Remember you have an emergency rear laser canon!", width/2, height/2 + 80);
  }
    
  // keyPressed()
  //
  // Called by the main program when the menu is active 
  // The player must press k in order to start the game 
  
  void keyPressed() {
    if (key == 'k' || key == 'K') {
       selection = State.SHOOTER;
       shooter.startGame();
    }
  }
 
           
  // keyReleased()
  //
  // Does nothing
  
  void keyReleased() {
  }
}