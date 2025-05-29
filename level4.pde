
void level4(){
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
  circle(ballx2, bally2, balld2);
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
        vx=(ballx-x[i])/5;
        vy=(bally-y[i])/5;
        alive[i]=false;
        bricksLeft--;
      }
      if(dist(ballx2, bally2, x[i], y[i])<balld2/2+brickd/2){ 
        vx2=(ballx2-x[i])/5;
        vy2=(bally2-y[i])/5;
        alive[i]=false;
        bricksLeft--;
      }
    }
    i++;
  }
  textSize(50);
  fill(255);
  text("Level 4: double trouble", 400, height-100);
 }
