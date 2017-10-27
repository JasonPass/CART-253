// Griddies
// by Pippin Barr
// MODIFIED BY: Jason Passalacqua
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

int eiddirgSize = 50;

Eiddirg[] eiddirgs = new Eiddirg[50];

 float lastTime;
 float timeInterval;

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  //
  size(640, 480);
  frameRate(10);
  
 lastTime = millis();
timeInterval = 2000;

  // QUESTION: What does this for loop do?
  //A: Sets up the griddies from the array for creating the random griddies in random areas of the screen
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

for (int i = 0; i < eiddirgs.length; i++) {
    int x = floor(random(0, width/eiddirgSize));
    int y = floor(random(0, height/eiddirgSize));
    eiddirgs[i] = new Eiddirg(x * eiddirgSize, y * eiddirgSize, eiddirgSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();


    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // A: Checks if griddies j and i are not the same 
      if (j != i) {
        // QUESTION: What does this line check?
        // A: Checks if griddies i and j collide
        griddies[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddies[i].display();
  }

for (int i = 0; i < eiddirgs.length; i++) {
    eiddirgs[i].update();

    for (int j = 0; j < eiddirgs.length; j++) {

      if (j != i) {
        eiddirgs[i].collide(eiddirgs[j]);
      }
    }

    // Display the eiddirgs
    eiddirgs[i].display();
  }
}