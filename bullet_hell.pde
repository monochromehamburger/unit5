import processing.sound.*;
int mode=0;
boolean aKey=false;
boolean dKey=false;
boolean wKey=false;
boolean sKey=false;
player ship=new player();
ArrayList<enemy> enemies=new ArrayList<>();
ArrayList<spinningEnemy> spinningEnemies=new ArrayList<>();
int straightEnemyX=0;
int straightEnemyTimer=30;
int spinningEnemyAngle=0;
int spinningEnemyTimer=75;
boolean spinningRight=true;
boolean goingRight=true;
boolean click=true;
void setup(){
  size(2000, 1500, P2D);
  ship=new player();
}
void draw(){
  background(0, 0, 0);
  if(mode==0){
    intro();
  }
  else if(mode==-1){
    lose();
  }
  else{
    game();
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
void mouseClicked(){
  if(click==true){
    enemies=new ArrayList<enemy>();
    mode=1;
    ship=new player(); 
    spinningEnemies=new ArrayList<spinningEnemy>();
  }
}
