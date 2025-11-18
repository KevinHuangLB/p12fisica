import fisica.*;

FWorld world;

FPoly cornhole1;
FPoly cornhole2;

FBlob bag1;
FBlob bag2;

color red = #A43E3B;


void setup() {
  size(800, 800);

  bag1 = new FBlob();
  bag2 = new FBlob();

  makeWorld();
}

void draw() {




  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100, width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(red);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}
