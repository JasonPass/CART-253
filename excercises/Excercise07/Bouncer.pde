class Bouncer {
  // The variables for the Bouncer objects  
  color clickColor = color (255, 255, 255, 255); 
  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;

  //Set up for the Bouncer
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }

  //This is what renders the movements of the bouncing objects
  void update() {
    x += vx;
    y += vy;

    handleBounce();
    handleMouse();
  }

  //What dterminds the parameters of the bounce
  void handleBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      // CHANGED - added sound to when bounces on width
      fileClickSound.play(); 
      vx = -vx; 
      size = size - 25;
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      // CHANGED - added sound to when bounces on height
      fileClickSound.play();
      vy = -vy;
      size = size - 5;// CNAHGED - size goes down by 5 when bounccers hit walls(eventually go inverse and get big)
    }
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  //Bouncer colors gets brighter when mouse is over them
  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }

  //CHANGED - mouseClicked function adds 1 to size and changes colors, opacity randomly
  void mouseClicked() {
    if (mousePressed == true) {    
      fileClickSound.play();
      size = size + 1;
      clickColor = color (random(255), random(255), random(255), random (20, 180));
    }
  }

  // Draws the Bouncers to the screen
  void draw() {
    noStroke();
    fill(clickColor);// CHANGED - fill color is now random when mouse clicked
    ellipse(x, y, size, size);
  }
}