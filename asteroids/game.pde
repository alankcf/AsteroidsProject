void game () {
  
  textSize(25);
  fill(yellow);
  text("Lives:" + shiplives, 100, 200);
  
  if (shiplives == 0) {
    mode = GAMEOVER;
  }
    
    
}

void gameClicks() {
  mode = GAMEOVER;
}
