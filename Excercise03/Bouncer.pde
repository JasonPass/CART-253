class Bouncer {

// The variables for the Bouncer objects  
 float red = random (255);
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
    vx = -vx; 
    size = size - 5;
    
    
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
    size = size - 5;
   }
   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 //Bouncer colors gets brighter when mouse is over them
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
// Draws the Bouncers to the screen
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}