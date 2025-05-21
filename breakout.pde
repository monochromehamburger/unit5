
import processing.sound.*;
int mode=0;
boolean levelEnd=true;
int paddleX, paddleY, paddleD;
boolean aKey, dKey, wKey, sKey;
int ballx, bally, balld;
float vx, vy;  
int brickd=100;
int bricksLeft;
int[] x;
int[] y;
int[] brickColor;
boolean[] alive;
int n;
int lives=3;
void setup(){
  n=120;
  bricksLeft=n;
  paddleX=width/2;
  paddleY=height;
  paddleD=200;
  size(1500, 1500, P2D);
  ballx=width/2;
  bally=height/2+300;
  balld=50;
  vy=-5;
  vx=random(-5,5);
  x=new int[n];
  y=new int[n];
  brickColor=new int[n];
  alive=new boolean[n];
  start();
}
void start(){
  int x1=50;
  int y1=100;
  for(int i=0;i<n;i++){
    if(random(4)<3){
      alive[i]=true;
    }
    else{
      bricksLeft--;
    }
    brickColor[i]=((x1+y1)/10);
    x[i]=x1;
    y[i]=y1;
    x1+=100;
    if(x1>=1500){
      x1=50;
      y1+=100;
    }
  }
}
void draw(){
  if (aKey) paddleX-=15;
  if (dKey) paddleX+=15;
  //if (wKey) paddleY-=10;
  //if (sKey) paddleY+=10;
  if(mode==0){
    intro();
  }
  else if(mode==1){
    game();
  }
  else if(mode==-1 && lives>0){
    loseLife();
  }
  else if(mode==-1){
    lose();
  }
  else if(mode==2){
    win();
  }
  if (paddleX<paddleD/2) {
    paddleX=paddleD/2;
  }  
  //if (paddleY<paddleD/2) {
  //  paddleY=paddleD/2; 
  //}
  if (paddleX>width-paddleD/2) {
    paddleX=width-paddleD/2;
  }
  //if (paddleY>height-paddleD/2) {
  //  paddleY=height-paddleD/2;
  //}
  ballx+=vx;
  bally+=vy;
  if (dist(paddleX, paddleY, ballx, bally) <=paddleD/2+balld/2) {
      vx=(ballx-paddleX)/5;
      vy=(bally-paddleY)/5;
  }
  if (bally<=balld/2) vy=-vy;
  if (bally>=height-balld/2){
    mode=-1;
    lives--;
    ballx=width/2;
    bally=height/2+200;
    vx=0;
    vy=0;
    levelEnd=true;
  }
  if (ballx<=balld/2) {
    vx=-vx;
    ballx=balld/2;
  }
  if (ballx>=width-balld/2) {
    vx=-vx;
    ballx=width-balld/2;
  }
  if(bricksLeft==0){
    mode=2;
    levelEnd=true;
  }
  if(abs(vy)<=0.5){
    vy+=0.5;
  }
}
void mouseClicked(){
  if(levelEnd==true){
    mode++;
    levelEnd=false;
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
