void intro(){
  background(0,255,0);
  fill(0);
  textSize(100);
  textAlign(CENTER);
  text("BREAK OUT", width/2, height/2-200);
  for(int i=0;i<5;i++){
    fill(23, 229, 203);  
    square(width/2+i*200-450, height/2-50, 100);
  }
}
