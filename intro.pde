void intro(){
  background(0,255,0);
  fill(0);
  textSize(100);
  text("BREAK OUT", height/2, width/2-50);
}
void draw(){
  for(int i=0;i<5;i++){
    fill(23, 229, 203);  
    square(width/2+i*200-450, height/2-50, 100);
  }
}
