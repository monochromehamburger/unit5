void win(){
  background(0,255,0);
  fill(0);
  textSize(100);
  textAlign(CENTER);
  text("You win YAY", width/2, height/2-200);
  text("Click to Continue", width/2, height/2);
  for(int i=0;i<5;i++){
    fill(76, 202, 49);  
    square(width/2+i*200-450, height/2+100, 100);
  }
  
}
