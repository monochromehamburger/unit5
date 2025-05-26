
void level3(){
  background(93,13,89);
  speed=30;
  
  fill(0);
  textSize(250);
  textAlign(CENTER);
  //bricks
  text("BREAK OUT", width/2, height/2-200);
  circle(paddleX, paddleY, paddleD);
  fill(200, 60, 60);
  circle(ballx, bally, balld);
  for(int i=0;i<n;i++){
    if(alive[i]==true){
      //thank you calvin for the gradient
      fill(86, brickColor[i], 173);
      circle(x[i], y[i], brickd);
    }
  }
  int i=0;
  while(i<n){
    if(alive[i]==true){
      if(dist(ballx, bally, x[i], y[i])<balld/2+brickd/2){ 
        vx=(ballx-x[i])/random(0.5,6);
        vy=(bally-y[i])/random(0.5,6);
        alive[i]=false;
        bricksLeft--;
      }
    }
    i++;
  }
  textSize(50);
  fill(255);
  text("Level 3: gambling", 400, height-100);
 }
