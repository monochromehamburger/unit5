class spinningEnemy extends GameObject{
  boolean alive;
  int lives;
  float moveX, moveY;
  spinningEnemy(float angle){
    x=width/2;
    y=-100;
    size=100;
    alive=true;
    moveX=cos(angle*PI/180);
    moveY=sin(angle*PI/180);
    if(spinningRight){
      spinningEnemyAngle+=10;
      if(spinningEnemyAngle>=180){
        spinningRight=false;
      }
    }
    else{
      spinningEnemyAngle-=10;
      if(straightEnemyX<=-90){
        spinningRight=true;
      }
    }
  }
  public void show(){
    fill(255, 255, 255);
    circle(x, y, size);
    //println(x+" "+y);
  }
  public void move(){
    x+=moveX*10;
    y+=moveY*10;
  }
}
