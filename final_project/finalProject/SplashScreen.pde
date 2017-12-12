  // SplashScreen //
  //
  //

  class SplashScreen {
    
    PImage imgSp;
    
    boolean finished = false;
    
  SplashScreen() {
  }
  
  void update() {
    imgSp = loadImage("background.final.jpg");
    display();
  }
  
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
  
   void keyPressed() {
    finished = true;
   }
   
  void keyReleased() {
  }
}