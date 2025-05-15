
import processing.sound.*;
int mode=0;
boolean levelEnd=true;
int paddleX, paddleY, paddleD;
boolean aKey, dKey, wKey, sKey;
int ballx, bally, balld;
float vx, vy;
void setup(){
  paddleX=width/2;
  paddleY=height-100;
  paddleD=200;
  size(1500, 1500, P2D);
  ballx=width/2;
  bally=height/2;
  balld=50;
  vy=-5;
  vx=5;
}
void draw(){
  if (aKey) paddleX-=10;
  if (dKey) paddleX+=10;
  //if (wKey) paddleY-=10;
  //if (sKey) paddleY+=10;
  if(mode==0){
    intro();
  }
  else if(mode==1){
    game();
  }
  if (paddleX<paddleD/2) {
    paddleX=paddleD/2;
  }  
  if (paddleY<paddleD/2) {
    paddleY=paddleD/2; 
  }
  if (paddleX>width-paddleD/2) {
    paddleX=width-paddleD/2;
  }
  if (paddleY>height-paddleD/2) {
    paddleY=height-paddleD/2;
  }
  ballx+=vx;
  bally+=vy;
  if (dist(paddleX, paddleY, ballx, bally) <=paddleD/2+balld/2) {
      vx=(ballx-paddleX)/6;
      vy=(bally-paddleY)/6;
  }
  if (bally<=balld/2) vy=-vy;
  if (bally>=height-balld/2) vy=-vy;
  if (ballx<=balld/2) {
    vx=-vx;
    ballx=balld/2;
  }
  if (ballx>=width-balld/2) {
    vx=-vx;
    ballx=width-balld/2;
  }
}
void mouseClicked(){
  if(levelEnd==true){
    mode++;
  }
}

void keyPressed() {
  if (key=='a') {
    aKey=true;
  }
  if (key=='d') {
    dKey=true;
  }
  if (key=='w') {
    wKey=true;
  }
  if (key=='s') {
    sKey=true;
  }
}
void keyReleased(){
  if (key=='a') {
    aKey=false;
  }
  if (key=='d') {
    dKey=false;
  }
  if (key=='w') {
    wKey=false;
  }
  if (key=='s') {
    sKey=false;
  }
}
