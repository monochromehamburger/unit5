import processing.sound.*;
int mode=0;
boolean aKey=false;
boolean dKey=false;
boolean wKey=false;
boolean sKey=false;
player ship=new player();
ArrayList<enemy> enemies=new ArrayList<>();
void setup(){
  size(2000, 1500, P2D);
  ship=new player();
}
void draw(){
  background(0, 0, 0);
  if(mode==0){
    intro();
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
  mode=1;
}
