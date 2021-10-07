void gameover () {
  background(blue);
  
  //if lost (hit by bullet)
  
  //if won (got UFO + asteroids)
  
}

void gameoverClicks () {
  mode = INTRO;
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new UFO());
}
