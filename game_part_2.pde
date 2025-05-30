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
int points1=0;
int points2=0;
import processing.sound.*;
//mode framework
int mode=0;
final int INTRO =0;
final int GAME = 1;
final int PAUSE=2;
final int GAMEOVER1=3;
final int GAMEOVER2=4;
SoundFile fail;
SoundFile success;
SoundFile music;
boolean green=true;
boolean orange=false;
color orangeColor=#FF9203;
void setup() {
  size(1500, 1500, P2D);
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
  ballx=width/2;
  bally=height/2;
  balld=50;
  vx=random(0, 10);
  vy=random(0, 10);
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
  music.loop();
  music.amp(1);
  mode=0;
  orange=false;
}
void draw() {
  if(points1==10){
    mode=3;
  }
  if(points2==10){
    mode=4;
  }
    
  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER1) {
    gameOver();
  } else if(mode==GAMEOVER2){
    gameOver2();
  } else {


    if(orange==false){
      background(color1);
    }
    else{
      background(orangeColor);
    }
    strokeWeight(5);
    stroke(black);
    fill(255, 0, 0);
    if (green)fill(0, 255, 0);
    else fill(255, 0, 0);
    circle(ballx, bally, balld);
    ballx+=vx;
    bally+=vy;  
    vy+=ay;
    vx+=ax;
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
    strokeWeight(5);
    stroke(0);
    fill(0);
    stroke(255);
    strokeWeight(5);
    fill(color4);
    circle(x, y, d);
    fill(color5);
    circle(x2, y2, d2);
    if (aKey) x-=10;
    if (dKey) x+=10;
    if (wKey) y-=10;
    if (sKey) y+=10;
    if (a2Key) x2-=10;
    if (d2Key) x2+=10;
    if (w2Key) y2-=10;
    if (s2Key) y2+=10;
    if (dist(x, y, ballx, bally) <=d/2+balld/2) {
      if (green) {
        vx=(ballx-x)/8;
        vy=(bally-y)/8;
      } else {
        points2+=1;
        ballx=width/2;
        bally=height/2;
        fail.play();
        vx=random(40,80);
        vy=random(40,80);
        d2-=6;
      }
    }
    if (dist(x2, y2, ballx, bally) <=d2/2+balld/2) {
      if (green) {
        vx=(ballx-x2)/8;
        vy=(bally-y2)/8;
      } else {
        points1+=1;
        ballx=width/2;
        bally=height/2;
        fail.play();
        vx=random(40,80);
        vy=random(40,80);
        d-=6;
      }
    }
    if(!green && random(0,250)<1){
      vx=random(40,80);
      vy=random(40,80);
    }
    //if(dist(holex, holey, ballx, bally) <=holed/2+balld/2){
    //  points2+=2;
    //  ballx=width/2;
    //  bally=height/2;
    //  success.play();
    //}
    //if(dist(holex, height-holey, ballx, bally) <=holed/2+balld/2){
    //  points1+=2;
    //  ballx=width/2;
    //  bally=height/2;
    //  success.play();
    //}
    if (bally<=balld/2) {
      if (green) {
        points2++;
        d2-=6;
        ballx=width/2;
        bally=height/2;
        success.play();
        vx=0;
        vy=0;
      }
    }
    if (bally>=height-balld/2) {
      if (green) {
        points1++;
        d-=6;
        ballx=width/2;
        bally=height/2;
        success.play();
        vx=0;
        vy=0;
      }
    }

    textSize(40);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    text(points1, x, y);
    text(points2, x2, y2);
    text("Pong (trust it's totally balanced)", width/2-100, 100);
    if (random(0, 500)<1) {
      green=!green;
      if (!green) {

        vy*=random(4, 8);
        vx*=random(4, 8);
      } else {
        vy=0;
        vx=0;
        ballx=width/2;
        bally=height/2;
      }
    }
    if (random(0, 1000)<1) {
      orange=!orange;
      aKey=false;
      sKey=false;
      wKey=false;
      dKey=false;
      a2Key=false;
      s2Key=false;
      w2Key=false;
      d2Key=false;
    }  
    if (x<d/2) {
      x=d/2;
    }  
    if (y<d/2) {
      y=d/2; 
    }
    if (x>width-d/2) {
      x=width-d/2;
    }
    if (y>height-d/2) {
      y=height-d/2;
    }
    if (x2<d/2) {
      x2=d/2;
    }
    if (y2<d/2) {
      y2=d/2;
    }
    if (x2>width-d/2) {
      x2=width-d/2;
    }
    if (y2>height-d/2) {
      y2=height-d/2;
    }
  }
}
void keyPressed() {
  if(orange){
    if (key=='d') {
      aKey=true;
    }
    if (key=='a') {
      dKey=true;
    }
    if (key=='s') {
      wKey=true;
    }
    if (key=='w') {
      sKey=true;
    }
    if (keyCode==RIGHT) {
      a2Key=true;
    }
    if (keyCode==LEFT) {
      d2Key=true;
    }
    if (keyCode==DOWN) {
      w2Key=true;
    }
    if (keyCode==UP) {
      s2Key=true;
    }
  }
  else{
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
    if (keyCode==LEFT) {
      a2Key=true;
    }
    if (keyCode==RIGHT) {
      d2Key=true;
    }
    if (keyCode==UP) {
      w2Key=true;
    }
    if (keyCode==DOWN) {
      s2Key=true;
    }
  }
}
void keyReleased() {
  if(orange){
    if (key=='d') {
      aKey=false;
    }
    if (key=='a') {
      dKey=false;
    }
    if (key=='s') {
      wKey=false;
    }
    if (key=='w') {
      sKey=false;
    }
    if (keyCode==RIGHT) {
      a2Key=false;
    }
    if (keyCode==LEFT) {
      d2Key=false;
    }
    if (keyCode==DOWN) {
      w2Key=false;
    }
    if (keyCode==UP) {
      s2Key=false;
    }
  }
  else{
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
    if (keyCode==LEFT) {
      a2Key=false;
    }
    if (keyCode==RIGHT) {
      d2Key=false;
    }
    if (keyCode==UP) {
      w2Key=false;
    }
    if (keyCode==DOWN) {
      s2Key=false;
    }
  }
  if(key=='1'){
    mode=1;
    points1=0;
    points2=0;
    d=100;
    d2=100;
    orange=false;
    background(color1);
    ballx=width/2;
    bally=height/2;
    x=width/2;
    y=height/2-200;
    x2=width/2;
    y2=height/2+200;
  }
}
