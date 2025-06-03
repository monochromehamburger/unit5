void intro(){
  background(0,255,0);
  image(gif[frame/5], 0, 0, width, height);
  
  fill(72, 173, 117);
  textSize(100);
  textAlign(CENTER);
  text("BREAK OUT", width/2, height/2-200);
  text("P to Pause", width/2, height/2+400);
  text("Click to Start", width/2, height/2+300);
  for(int i=0;i<5;i++){
    fill(23, 229, 203);  
    square(width/2+i*200-450, height/2-50, 100);
  }
  paddleX=width/2;
  paddleY=height;
  paddleD=200;
  size(1500, 1500, P2D);
  ballx=width/2;
  bally=height/2+200;
  balld=50;
  vy=5;
  vx=random(-5, 5);
  levelEnd=true;
}
