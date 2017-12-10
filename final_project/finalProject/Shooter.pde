class Shooter {

  //PFont font;

  int boxSize = 28;
  int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  //int[] bally = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  int[] bally = { int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)), int (random(-400)),int (random(-400)), int (random(-400)),int (random(-400)),int (random(-400)),int (random(-400)), int (random(-400)) };

  int SHOOTER_INSET = 640;

  int SPEED = 5; // sensitivity

  int HEIGHT = 20;
  int WIDTH = 40;

  int x;
  int y;
  int vx;
  int vy; //be able to move forward

  color shooterColor = color (255, 0, 0);

  char upKey;
  char downKey;

  boolean playing = false;
  boolean returnToMenu = false;

  Timer timer;

  int shotX;

  Shooter(int _x, int _y, char _upKey, char _downKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    upKey = _upKey;
    downKey = _downKey;

    // Timer is set to 40 seconds
    timer = new Timer(20000);

    // Smooths edges
  //  smooth();
  }