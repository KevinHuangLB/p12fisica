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

  background(lightBlue);

  textAlign(CENTER);
  textSize(25);
  text("Red: " + score1, 100, 100);
  text("Blue: " + score2, 200, 100);


  stroke(black);
  strokeWeight(5);

  line(700, 100, 700, 400); // base line

  stroke(brightRed);
  strokeWeight(5);
  line(750, 250, 800, 250); //indicator where to hit
  strokeWeight(5);

  stroke(brightRed);
  line(700, sliderY, 720, sliderY); //controlable

  if (sliderGoingDown && !spacekeyHit) {
    sliderY += 3;
  }
  if (!sliderGoingDown && !spacekeyHit) {
    sliderY -= 3;
  }
  if ((sliderY > 400 || sliderY < 100) && !spacekeyHit) sliderGoingDown = !sliderGoingDown;

  float vx = map(sliderY, 100, 400, -460, -790);
  float vy = map(sliderY, 100, 400, -430, -840);

  // PLAYERSSSSSSSSSSSSSSSSSSSSSS

  if (spacekey && isPlayer1) {
    bag1.setVelocity(vx, vy);
    ballThrown = true;
  }

  if (isPlayer1) {
    if (bag1.isTouchingBody(goal)) {
      score1++;
      bag2.setPosition(700, 650);
      bag1.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = false;
    }

    if (ballThrown && (abs(bag1.getVelocityX()) < 0.5 || bag1.isTouchingBody(backboard) || bag1.isTouchingBody(floor))) { //check if it goes backwards
      bag2.setPosition(700, 650);
      bag1.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = false;
    }
  }

  // PLAYER 22222222222222222222222222222222222222

  println(isPlayer1, ballThrown);

  if (spacekey && !isPlayer1) {
    bag2.setVelocity(vx, vy);
    ballThrown = true;
  }
  if (!isPlayer1) {
    if (bag2.isTouchingBody(goal)) {
      score2++;
      bag1.setPosition(700, 650);
      bag2.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = true;
    }

    if (ballThrown && (abs(bag2.getVelocityX()) < 0.5 || bag2.isTouchingBody(backboard) || bag2.isTouchingBody(floor))) { //check if it goes backwards
      bag1.setPosition(700, 650);
      bag2.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = true;
    }
  }



  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
