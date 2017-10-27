// Eiddirg
//
// A class defining the behaviour of a single Eiddirg
// which can move randomly in the window (within the grid),
// loses energy per move, gains energy from overlapping and gets bigger

class Eiddirg {
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color (50,200,100);
  
  // Limits for energy level and gains/losses    
  int maxEnergy = 300;
  int moveEnergy = -1;
  int collideEnergy = 5;

 // Eiddirg(tempX, tempY, tempSize)
 //
 // Set up the Eiddirg with the specified location and size
 // Initialise energy to the maximum  
 Eiddirg (int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }
  
  // update()
  //
  // Move the Eiddirg and update its energy levels
  void update() {
    // If the energy level reaches 0, the eiddirgs come back 
    if (energy == 0) {
      // comes back with 300 energy when they die
      energy = 300;
      // adds 60 fill when they die
      fill += 60;
      // plus 40 size when they die 
      size += 40;
      return;
    }
    // Eiddirgs move in random X or Y directions on the grid by 2
    int xMoveType = floor(random(-5, 5));
    int yMoveType = floor(random(-5, 5));
    x += size * xMoveType;
    y += size * yMoveType;
     // Makes sure that the Eiddirg stay inside the window by moviong them back in if out width/height
     if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
    
    // Update the Eiddirg's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    // Constrain the Eiddirg energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }
  
  
  // collide(other)
  //
  // Checks for collision with the other Eiddirg
  // and updates energy level
  
  void collide(Eiddirg other) {
        // If a Eiddirg colides with one that has died, it wont gain energy
        if (energy == 0 || other.energy == 0) {
      return;
    }
    
    //Checks if Eiddirgs colide with each other
    //if it does than it gains energy
    if (x == other.x && y == other.y) {
      // Increase this Eiddirg's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);    
      }
    } 
    
  // display()
  //
  // Draw the Eiddirg on the screen as a rectangle
  void display() {
  //  Fills color red, changes opacity depending on level of energy 
    fill(fill, energy);
    //noStroke();
    noStroke();
    rect(x, y, size, size);
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    