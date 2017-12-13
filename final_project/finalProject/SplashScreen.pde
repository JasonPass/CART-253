// SplashScreen //
//
// This is the class for the splash screen when the player
// first opens the game 
// A quick intro to the game, lets the player know before hand 
// how the game is in a vague sense 

class SplashScreen {
  // Splash screen graphic made in Photoshop
  PImage imgSp;
  // Boolean to move to the menu
  boolean finished = false;
  
  SplashScreen() {
  }
  
  // update()
  //
  // Displays "display" and the grahpic made in Photoshop
  
  void update() {
    imgSp = loadImage("background.final.jpg");
    display();
  }
  
  // display()
  //
  // This is whats called in update and where the text is 
  
  void display() {
    background(imgSp);
    font = createFont("UbuntuR.ttf", 20);
    textFont (font);
    textAlign(CENTER);
    textSize(64);
    fill(255);  
    textSize(40);
    text("Press any key to continue", width/2, height/2+200);
  }
  
   // keyPressed()
   //
   // Called by the main program when the menu is active 
   // The player must press any key in order to move to the menu 
   
   void keyPressed() {
    finished = true;
   }
   
  // keyReleased()
  //
  // Does nothing
   
  void keyReleased() {
  }
}