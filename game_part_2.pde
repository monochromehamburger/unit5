color white= #ffffff;
color black= #000000;
float ballx, bally, balld;
float vx, vy;
float ax, ay;
color color1 = #42213d;
color color2 = #123456;
color color3=#C0FFEE;
color color4= #abcdef;
color color5=#959384;
boolean aKey, dKey, wKey, sKey;
float x, y, d;
float x2, y2, d2;
boolean a2Key, d2Key, w2Key, s2Key;
float holex, holey, holed;
int points=0;
void setup(){
  size(1500, 1500, P2D);
  ballx=width/2;
  bally=height/2;
  balld=50;
  vx=random(0,10);
  vy=random(0,10);
  //ax=random(0,2);
  //ay=random(0,2);
  x=width/2;
  y=height/2-200;
  x2=width/2;
  y2=height/2+200;
  d=100;
  d2=100;
  holex=width/2;
  holey=100;
  holed=100;
}
void draw(){
  background(color1);
  strokeWeight(5);
  stroke(black);
  fill(255, 0, 0);
  circle(ballx, bally, balld);
  ballx+=vx;
  bally+=vy; 
  vy+=ay;
  vx+=ax;
  if(bally<=balld/2) vy=-vy;
  if(bally>=height-balld/2) vy=-vy;
  if(ballx<=balld/2){
    vx=-vx;
    ballx=balld/2;
  }
  if(ballx>=width-balld/2){
    vx=-vx;
    ballx=width-balld/2;
  }
  strokeWeight(5);
  stroke(0);
  fill(0);
  circle(holex, holey, holed);
  stroke(255);
  strokeWeight(5);
  fill(color2);
  circle(x, y, d);
  fill(color3);
  circle(x2, y2, d2);
  if(aKey) x-=10;
  if(dKey) x+=10;
  if(wKey) y-=10;
  if(sKey) y+=10;
  if(a2Key) x2-=10;
  if(d2Key) x2+=10;
  if(w2Key) y2-=10;
  if(s2Key) y2+=10;
  if(dist(x, y, ballx, bally) <=d/2+balld/2){
    vx=(ballx-x)/5;
    vy=(bally-y)/5;
  }
  if(dist(x2, y2, ballx, bally) <=d2/2+balld/2){
    vx=(ballx-x2)/5;
    vy=(bally-y2)/5;
  }
  if(dist(holex, holey, ballx, bally) <=holed/2+balld/2){
    points++;
    ballx=width/2;
    bally=height/2;
  }
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text(points, x, y);
  
}
void keyPressed(){
  if(key=='a'){
    aKey=true;
  }
  if(key=='d'){
    dKey=true;
  }
  if(key=='w'){
    wKey=true;
  }
  if(key=='s'){
    sKey=true;
  }
  if(keyCode==LEFT){
    a2Key=true;
  }
  if(keyCode==RIGHT){
    d2Key=true;
  }
  if(keyCode==UP){
    w2Key=true;
  }
  if(keyCode==DOWN){
    s2Key=true;
  }
}
void keyReleased(){
  if(key=='a'){
    aKey=false;
  }
  if(key=='d'){
    dKey=false;
  }
  if(key=='w'){
    wKey=false;
  }
  if(key=='s'){
    sKey=false;
  }
  if(keyCode==LEFT){
    a2Key=false;
  }
  if(keyCode==RIGHT){
    d2Key=false;
  }
  if(keyCode==UP){
    w2Key=false;
  }
  if(keyCode==DOWN){
    s2Key=false;
  }
}
