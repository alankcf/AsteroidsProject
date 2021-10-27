void intro() {
  //background(orange);
  myGif.show(); 
  myButton.show();
  
  if(myButton.clicked) mode = GAME;
  
  //font
  textFont(font);
  fill(darkyellow);
  textSize(100);
  textAlign(CENTER);
  text("Dungeons", width/2, height/5);
  textSize(25);
  //text("click to begin!", width/2, 4*height/5);
}
