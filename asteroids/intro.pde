void intro () {
  //background(blue);
  
  image(gif[f], 400, 400, width, height);
  f = f + 1;
  
  if (f == numberOfFrames) f = 0;
  
  //font
  textFont(font);
  fill(darkyellow);
  textSize(100);
  textAlign(CENTER);
  text("ASTEROIDS", width/2, height/5);
  textSize(25);
  text("click to begin!", width/2, 4*height/5);
}

void introClicks () {
 mode = GAME; 
 
}
