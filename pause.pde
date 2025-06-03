void pause(){
  background(0,255,0);
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Paused", width/2, height/2);
  text("Press O to Unpause", width/2, height/2-200);
  for(int i=0;i<5;i++){
    fill(100, 82, 203);  
    square(width/2+i*200-450, height/2+100, 100);
  }
}
