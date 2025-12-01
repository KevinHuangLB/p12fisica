import fisica.*;

FWorld world;

FPoly cornhole1;
FPoly cornhole2;

FCircle bag1;
FCircle bag2;

FPoly board;
FPoly floor;
FPoly bagStand;
FPoly backboard;
FPoly blocker;
FPoly goal;

//Mode framework
int mode;
final int GAME = 0;
final int GAMEOVER = 1;

//keyboard variables
boolean spacekey;

//slider control variables
int sliderY;
boolean sliderGoingDown;
boolean spacekeyHit;
float accuracySlider;

//game variables
boolean isPlayer1;
boolean ballThrown;

int score1;
int score2;

// ball gravity variables
int beginningFrame;

color white = #FFFFFF;
color black = #000000;
color red = #A43E3B;
color lightBlue = #c0e6f0;
color brown = color(166, 120, 24);
color brightRed = #FF000D;
color blue = #3B719F;


void setup() {
  size(800, 800);

  //mode variables
  mode = GAME;

  //keyboard variables
  spacekey = false;

  //initiate objects
  makeWorld();
  bag1 = new FCircle(30);
  bag2 = new FCircle(30);
  board = new FPoly();
  floor = new FPoly();
  bagStand = new FPoly();
  backboard = new FPoly();
  blocker = new FPoly();
  goal = new FPoly();

  // slider variables
  sliderY = 100;
  sliderGoingDown = true;

  //ball gravity variables

  //game variables
  isPlayer1 = true;
  score1 = 0;
  score2 = 0;

  // finish setting up objects
  makeCircle(bag1);
  makeCircle2(bag2);
  makeBoard(board);
  makeFloor(floor);
  makeBagStand(bagStand);
  makeBackboard(backboard);
  makeBlocker(blocker);
  makeGoal(goal);
}

void draw() {
  if (mode == GAME) game();
  else if (mode == GAMEOVER) gameOver();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
