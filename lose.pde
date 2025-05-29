void lose(){
  background(0,255,0);
  fill(0);
  vy=0;
  vy2=0;
  textSize(100);
  textAlign(CENTER);
  text("You lost LLLLLLLLLLLLL", width/2, height/2-200);
  text("Click to Restart", width/2, height/2);
  for(int i=0;i<5;i++){
    fill(100, 82, 203);  
    square(width/2+i*200-450, height/2+100, 100);
  }
  setup();
}
