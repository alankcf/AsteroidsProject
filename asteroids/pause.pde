void pause() {
  //fill(0);
  
  textSize(50);
  textAlign(CENTER);
  fill(darkyellow);
  text("Game PAUSED", 400, 300);
}

void pauseClicks() {
  mode = GAME;
  rect(690, 75, 7, 50);
  rect(710, 75, 7, 50);
}
