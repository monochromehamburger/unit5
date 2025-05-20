
import processing.sound.*;
int mode=0;
boolean levelEnd=true;
int paddleX, paddleY, paddleD;
boolean aKey, dKey, wKey, sKey;
int ballx, bally, balld;
float vx, vy;  
int brickd=100;

int[] x;
int[] y;
boolean[] alive;
int n;
void setup(){
  n=20;
  paddleX=width/2;
  paddleY=height;
  paddleD=200;
  size(1500, 1500, P2D);
  ballx=width/2;
  bally=height/2;
  balld=50;
  vy=-5;
  vx=5;
  x=new int[n];
  y=new int[n];
  alive=new boolean[n];
  int x1=150;
  int y1=100;
  for(int i=0;i<n;i++){
    alive[i]=true;
    x[i]=x1;
    y[i]=y1;
    x1+=300;
    if(x1>=1400){
      x1=150;
      y1+=200;
    }
  }
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
  else if(mode==-1){
    lose();
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
      vx=(ballx-paddleX)/6;
      vy=(bally-paddleY)/6;
  }
  if (bally<=balld/2) vy=-vy;
  if (bally>=height-balld/2){
    mode=-1;
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
