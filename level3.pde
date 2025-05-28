
void level3(){
  if(random(100)<1){
    float number=random(100);
    if(number<50){
      currentColor=common;
    }
    else if(number<75){
      currentColor=uncommon;
    }
    else if(number<89){
      currentColor=rare;
    }
    else if(number<96){
      currentColor=epic;
    }
    else if(number<99){
      currentColor=mythic;
    }
    else{
      currentColor=legendary;
    }
  }
  background(currentColor);
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
  fill(82, 82, 82);
  text("Level 3: gambling", 300, height-100);
  text("Common: 50%", 300, height-200);
  text("Uncommon: 25%", 300, height-300);
  text("Rare: 14%", 300, height-400);
  text("Epic: 7%", 300, height-500);
  text("Mythic: 4%", 300, height-600);
  text("Legendary: 1%", 300, height-700);
  text("1% chance to gamble every frame", 400, height-800);
 }
