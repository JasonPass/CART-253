// Jason Passalacqua


// ARTIST'S STATEMENT


// Synopsis

// This retro style action space shooter brings back nostalgic memories of the 90's arcade games. 
// The art style is a minimalist rendition of an old school game. 

// You have X amount of time to deactivate as much boxes as you can. If you let these boxes through earth's 
// atmosphere you lose. 

// Try and accoumalate as many points as you can!
// Compete with friends and try to get the highest score you can!


// Statement

// Deactivator 27 is a mnemonic game I created that is meant to bring back the nostalgia in the simplicity 
// old school games used to have. Mechanically I wanted the game to be simple. The game is point based 
// so it tends to bring the natural competitiveness in people. Aesthetically the game is minimalistic. I chose 
// this art style as a critique on design trends. Recreating a space invaders style of game with design trends 
// from more than two decades later demonstrates how we recycle trends whether in design or fashion. 

// My game is organized into different states. There’s the splash screen, the menu and then the game 
// itself. I felt it was necessary to have a splash screen just to let the first-time players get a taste of what 
// the game will be like. From there you are moved to the menu which explains the controls and the goal  
// of the game. Finally, after you press K you are moved to the actual game. I coded the ship to move with 
// WASD using keyPressed and keyReleased. Pressing the left mouse button returns the “Boolean fire” to 
// true firing a red line vertically from the center of the ship. The laser also fires backwards only when 
// there’s a box lined up behind you. When you hit a box with this laser “Boolean strike” becomes true and 
// the box explodes. The boxes (your targets) are meant to abstractly represent missiles or bombs. I chose 
// not to explain where they came from so that the players can come up with their own representations. I 
// used an array of 15 boxes that fall from the top of the screen. I used the random function quite a bit in 
// this game. In “int getRandomX()” it returns a random integer between 30 and 1250, just enough to give 
// a decent margin for the boxes to fall into. I used Ubuntu as the main font for this game. It’s a typeface
// that has many angular geometric lines along with some soft curves and I find the complements the 
// geometric vector shapes of the game well. I used the sound library to add ambience to the game along with 
// effect sounds. The PNG for the ship was made in Photoshop along with the splash screen and the screen
// when you let a box through the force field. I tried mimicking the art style of the old arcade games 
// where the posters would be slightly more exaggerated than the game itself. 


// Set of named options for game menu and splashscreen
enum State {
  NONE, 
    SPLASHSCREEN, 
    MENU, 
    SHOOTER
}

// Variable to track the state in the game
State state;

// Variables that store information for each state
SplashScreen splashScreen;
Menu menu;
Shooter shooter;

// Import sound library 
import processing.sound.*;
SoundFile file;
SoundFile fileW;