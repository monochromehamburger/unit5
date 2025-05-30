import processing.sound.*;
int mode=0;
int frame=0;
boolean levelEnd=true;
int paddleX, paddleY, paddleD;
boolean aKey, dKey, wKey, sKey;
int ballx, bally, balld;
float vx, vy;  
int ballx2, bally2, balld2;
float vx2, vy2;  
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
import processing.sound.*;
SoundFile intro;
SoundFile fail;
SoundFile success;
SoundFile music;
color common=#FFFFFF;
color uncommon=#10FF00;
color rare=#416EE5;
color epic=#8707D8;
color mythic=#DB0214;
color legendary=#FAF43D;
color currentColor=common;
void setup(){
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
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
  ballx2=width/2;
  bally2=height/2+300;
  balld2=50;
  vy=-5;
  vy2=-5;
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
  music.loop();
  music.amp(1);
}
void start(){
  int x1=50;
  int y1=100;
  ballx2=width/2+100;
  bally2=height/2+300;
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
  else if(currentLevel==7){
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
  println(mode);
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
  else if(mode==7){
    level4();
  }
  else if(mode==-2){
    pause();
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
  if(mode!=-2){
    ballx+=vx;
    bally+=vy;
    ballx2+=vx2;
    bally2+=vy2;
  }
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
      if(mode==7){
        vx=(ballx-paddleX)/5;
        vy=(bally-paddleY)/5;
      }
  }
  if (dist(paddleX, paddleY, ballx2, bally2) <=paddleD/2+balld2/2) {
      vx2=(ballx2-paddleX)/5;
      vy2=(bally2-paddleY)/5;
      
  }
  if (bally<=balld/2){
    bally=balld/2;
    vy=-vy;
  }
  if (bally2<=balld2/2){
    bally2=balld2/2;
    vy2=-vy2;
  }
  if (bally>=height-balld/2){
    mode=-1;
    lives--;
    ballx=width/2;
    bally=height/2+200;
    ballx2=width/2;
    bally2=height/2+200;
    vx=0; 
    vy=0;
    vx2=0; 
    vy2=0;
    levelEnd=true;
    fail.play();
  }
  if (currentLevel==7 && bally2>=height-balld2/2){
    mode=-1;
    lives--;
    ballx2=width/2;
    bally2=height/2+200;
    ballx=width/2;
    bally=height/2+200;
    vx2=0; 
    vy2=0;
    vx=0; 
    vy=0;
    levelEnd=true;
    fail.play();
  }
  if (ballx<=balld/2) {
    vx=-vx;
    ballx=balld/2;
  }
  if (ballx>=width-balld/2) {
    vx=-vx;
    ballx=width-balld/2;
  }
  if (ballx2<=balld2/2) {
    vx2=-vx2;
    ballx2=balld2/2;
  }
  if (ballx2>=width-balld2/2) {
    vx2=-vx2;
    ballx2=width-balld2/2;
  }
  if(bricksLeft==0){
    mode=2;
    currentLevel+=2;
    bricksLeft=1;
    lives=3;
    levelEnd=true;
    success.play();
  }
  if(abs(vy)<=0.5){
    vy+=0.5;
  }
  if(abs(vy2)<=0.5){
    vy2+=0.5;
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
   vy2=5;
   ballx2=width/2-100;
   ballx=width/2;
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
  if(key=='p'){
    mode=-2;
  }
  if(key=='o'){
    mode=currentLevel;
  }
}
