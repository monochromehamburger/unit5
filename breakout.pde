
import processing.sound.*;
int mode=0;
int frame=0;
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
PImage[] gif;
int numOfFrames;
PFont font;
int speed;
int currentLevel=1;
void setup(){
  speed=15;
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
  numOfFrames=74;
  gif=new PImage[numOfFrames];
  font = createFont("Comic Sans MS Italic", 128);
  textFont(font);
  for(int i=0;i<numOfFrames;i++){
    gif[i]=loadImage("frame_"+i+"_delay-0.1s.gif");
  }
  start();
}
void start(){
  int x1=50;
  int y1=100;
  bricksLeft=n;
  if(currentLevel==1){
    for(int i=0;i<n;i++){
      if(random(2)<1){
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
  else{
    for(int i=0;i<n;i++){
      if(random(4)<1){
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
  
}
void draw(){
  
  if (aKey) paddleX-=speed;
  if (dKey) paddleX+=speed;
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
  else if(mode==3){
    level2();
  }
  else if(mode==5){
    level3();
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
      if(mode==3){
        vx=(ballx-paddleX)/3;
        vy=(bally-paddleY)/3;
      }
      if(mode==5){
        vx=(ballx-paddleX)/random(0.5,6);
        vy=(bally-paddleY)/random(0.5,6);
      }
  }
  if (bally<=balld/2){
    bally=balld/2;
    vy=-vy;
  }
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
    currentLevel+=2;
    bricksLeft=1;
    lives=3;
    levelEnd=true;
    println(currentLevel);
  }
  if(abs(vy)<=0.5){
    vy+=0.5;
  }
  frame++;
  if(frame==numOfFrames*5){
    frame=0;
  }
  if(bally<0){
    bally=0;
  }
}
void mouseClicked(){
  //if(levelEnd==true){
   mode=currentLevel;
   vy=5;
   if(lives==0){
     lives=3;
   }
  //  levelEnd=false;
  //}
  if(mode%2==1 && lives==3){
    for(int i=0;i<n;i++){
      x=new int[n];
      y=new int[n];
      alive=new boolean[n];
      start();
    }
    ballx=width/2;
    bally=height/2+300;
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
  if (key=='q'){
    bricksLeft=0;
  }
}
