void game () {
  
  textSize(25);
  fill(yellow);
  text("Lives:" + shiplives, 130, 100);
  
  if (shiplives == 0) {
    mode = GAMEOVER;
  }
  generate++;
  //println(generate);
    if (generate >= 700) {
      myObjects.add (new UFO());
      generate = 0;
    } 
   
   //pause indicator
   fill(darkyellow);
   stroke(darkyellow);
   textSize(15);
   text("Click to pause!", 700, 60);
   rectMode(CORNER);
   rect(690, 75, 7, 50);
   rect(710, 75, 7, 50);
  
   //teleport bar
   rectMode(CORNER);
   fill(darkyellow);
   stroke(darkyellow);
   rect(100, 670, 200, 50);
   fill(darkblue);
   stroke(darkblue);
   rect(100, 670, teleport, 50);   
   
    if (teleport < 200) {
     teleport = teleport + 1; //0.1;
   } else {
   teleport = 200;
   fill(darkyellow);
   textSize(20);
   text("Teleport READY", 200, 695);
   textSize(10);
   text("Click ENTER", 200, 710);
  }
}

void gameClicks() {
  mode = PAUSE;
  fill(black);
  stroke(black);
  strokeWeight(2);
  rect(690, 75, 7, 50);
  rect(710, 75, 7, 50);
  fill(darkyellow);
  triangle(680, 75, 680, 125, 725, 100);
}
