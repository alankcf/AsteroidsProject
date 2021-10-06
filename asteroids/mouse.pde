void mouseReleased () {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
