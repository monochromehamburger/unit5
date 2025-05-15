
void game(){
  background(93,13,89);
  fill(0);
  textSize(100);
  
  text("BREAK OUT", width/2, height/2-500);
  circle(paddleX, paddleY, paddleD);
  fill(200, 60, 60);
  circle(ballx, bally, balld);
}
