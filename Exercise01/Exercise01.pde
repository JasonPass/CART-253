float red = random(255); // CHANGED - allows for random value of red stroke
float green = random(100); // CHANGED - allows for random value of green stroke
float blue = random(255); // CHANGED - allows for random value of blue stroke
final int CIRCLE_SPEED = 5; // CHANGED - slower movement
final color NO_CLICK_FILL_COLOR = color(red); // CHANGED - random value of only R when launched
final color CLICK_FILL_COLOR = color(100, 200, 250); // This is the fill color of the circle when the mouse is over the circle
final color BACKGROUND_COLOR = color(20, 230, 180); // CHANGED - This is the color of the background
color STROKE_COLOR = color(red, green, blue); // CHANGED - random stroke color when launched
final int CIRCLE_SIZE = 10; // CHANGED - size of the circle smaller



int circleX; // Position of circle on X axis variable without a value
int circleY; // Position of circle on Y axis variable without a value
int circleVX; // Velocity of circle on X axis variable without a value
int circleVY; // Velocity of circle on Y axis variable without a value



void setup() {
  size(640, 480); // This is the size of the window
  circleX = width/2; // This is a variable for where the circle starts on the X axis when you run the program
  circleY = height/2; // This is a variable for where the circle starts on the Y axis when you run the program
  circleVX = CIRCLE_SPEED; // This is a variable for the circle's velocity on the X axis
  circleVY = CIRCLE_SPEED; // This is the Variable for the circle's velocity o the Y axis
  stroke(STROKE_COLOR); // CHANGED  - This is a varaible for the color of the stroke
  fill(NO_CLICK_FILL_COLOR); // This is the variable for the standard
  background(BACKGROUND_COLOR); // This is a varible for the color of the background
}

void draw() {
    if (mousePressed) {fill (CLICK_FILL_COLOR);
    ellipse(circleX, circleY, CIRCLE_SIZE * 8, CIRCLE_SIZE); // CHANGED - shape of ellipse when mouse click
    if (mousePressed) circleVX = CIRCLE_SPEED + 5; // CHANGED - faster speed when mouse pressed
    circleVY = CIRCLE_SPEED + 10; // CHANGED - faster speed when mouse pressed
    if (circleX + CIRCLE_SIZE > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX; // CHANGED
  }
  
    if (circleY + CIRCLE_SIZE> height || circleY - CIRCLE_SIZE/2 < 0) {
   circleVY = -circleVY; // CHANGED - tragectory of ellipse when mouse pressed 
   circleY = -circleVY; // CHANGED - tragectory of ellipse when mouse pressed
    
  }
  
  }
  else {
    fill(NO_CLICK_FILL_COLOR); // If it is it will fill the circle blue
  }
  
    
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); // Dimentions for drawing the circle 
  circleX += circleVX; // Moving the circle on X axis 
  circleY += circleVY; // Moving the circle on Y axis
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
    // When circleX hits left or right walls it will bounce back
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY; // When circleY hits left or right walls it will bounce back
  }
 
}