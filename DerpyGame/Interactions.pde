
void keyReleased() {
  if (key == ' ' && mode == GAME) {
    spacekey = false;
    spacekeyHit = true;
  }
}
void keyPressed() {
  if (key == ' ' && mode == GAME) {
    spacekey = true;
    spacekeyHit = false;
  }
}
void mouseReleased(){
  if (mode == GAMEOVER){
   gameOverClicks(); 
  }
}
