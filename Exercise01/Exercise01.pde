final int CIRCLE_SPEED = 7; // This is speed of the circles movement
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); // This is the standard color of the circle
final color CLICK_FILL_COLOR = color(100, 100, 250); // This is the fill color of the circle when the mouse is over the circle
final color BACKGROUND_COLOR = color(250, 150, 150); // This is the color of the background
final color STROKE_COLOR = color(250, 150, 150); // This is the stroke color of the circle
final int CIRCLE_SIZE = 50; // This is the  size of the circle

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
  stroke(STROKE_COLOR); // This is a varaible for the color of the stroke
  fill(NO_CLICK_FILL_COLOR); // This is the variable for the standard
  background(BACKGROUND_COLOR); // This is a varible for the color of the background
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); // This is the code that allows the color to change if the mouse is within the circle diameter
  }
  else {
    fill(NO_CLICK_FILL_COLOR); // If it is it will fill the circle blue 
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); // Dimentions for drawing the circle 
  circleX += circleVX; // Moving the circle on X axis 
  circleY += circleVY; // Moving the circle on Y axis
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX; // When circleX hits left or right walls it will bounce back
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY; // When circleY hits left or right walls it will bounce back
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR); // When mouse is pressed the background will fill to pink
}