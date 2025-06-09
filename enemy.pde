class enemy extends GameObject{
  boolean alive;
  int lives;
  enemy(int x){
    this.x=x;
    y=-100;
    size=100;
    alive=true;
    if(goingRight){
      straightEnemyX+=150;
      if(straightEnemyX>=width){
        goingRight=false;
      }
    }
    else{
      straightEnemyX-=150;
      if(straightEnemyX<=0){
        goingRight=true;
      }
    }
  }
  public void show(){
    fill(255, 255, 255);
    circle(x, y, size);
    //println(x+" "+y);
  }
}
