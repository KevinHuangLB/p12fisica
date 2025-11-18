import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color white = #FFFFFF;
color black = #000000;

//assets
PImage redBird;
PImage mango;

float cloudX;
float cloudX2;

boolean gravityToggle;
boolean generateToggle;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);

  //load resources
  redBird = loadImage("red-bird.png");
  mango = loadImage("mango.png");

  //initialise world
  makeWorld();

  //cloud variables
  cloudX = 0;

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();

  //gravity
  gravityToggle = false;
  generateToggle = false;
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, 60);
  topPlatform.vertex(640, 240);
  topPlatform.vertex(640, 340);
  topPlatform.vertex(-100, 160);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(300, 480);
  bottomPlatform.vertex(350, 480);
  bottomPlatform.vertex(350, 550);
  bottomPlatform.vertex(550, 550);
  bottomPlatform.vertex(550, 480);
  bottomPlatform.vertex(600, 480);
  bottomPlatform.vertex(600, 580);
  bottomPlatform.vertex(300, 580);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  circle(cloudX, 50, 67);
  if (cloudX < width) {
    cloudX++;
  }
  if (cloudX >= width) cloudX = 0;

  fill(white);

  if (frameCount % 50 == 0 && !generateToggle) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  println(generateToggle);

  if (!gravityToggle) {
    world.step();  //get box2D to calculate all the forces and new positions
  }
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  circle(cloudX, 100, 50);
  if (cloudX2 < width) {
    cloudX2++;
  }
  if (cloudX2 >= width) cloudX2 = 0;

  rectMode(CENTER);
  square(200, 200, 50);
  square(600, 200, 50);
  rectMode(CORNER);
}

void mouseReleased() {
  if (mouseX > 175 && mouseX < 225 && mouseY < 225 && mouseY > 175) {
    gravityToggle = !gravityToggle;
  }
  if (mouseX > 575 && mouseX < 625 && mouseY < 225 && mouseY > 175) {
    generateToggle = !generateToggle;
  }
}

//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100, width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100, width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(100, 100);
  box.setPosition(random(100, width-100), -5);

  box.attachImage(mango);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.01);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100, width-100), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
