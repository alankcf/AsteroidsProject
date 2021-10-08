void gameover () {
  
  
  if (shiplives == 0) {
    textSize(100);
    text("GAMEOVER", width/2, height/3);
  }
  
  if (count == 21) {
    background(orange);
    textSize(100);
    text("YOU WON", width/2, height/3);
    
  }
  count = 0;
  //if won (got UFO + asteroids)
  
}

void gameoverClicks () {
  mode = INTRO;
  shiplives = 3;
  myObjects.remove(new Asteroid());
  myObjects.remove(new Asteroid());
  myObjects.remove(new Asteroid());
  myObjects.add(new UFO());
}
