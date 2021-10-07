void mouseReleased () {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks(); 
  }else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
