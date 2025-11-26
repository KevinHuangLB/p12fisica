
void keyReleased() {
  if (key == ' ') {
    spacekey = false;
    spacekeyHit = true;
  }
}
void keyPressed() {
  if (key == ' ') {
    spacekey = true;
    spacekeyHit = false;
  }
}
