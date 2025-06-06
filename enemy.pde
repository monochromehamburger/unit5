class enemy{
  public float x, y, vx, vy, size;
  boolean alive;
  int lives;
  enemy(){
    x=random(0,width);
    y=-100;
    size=100;
    alive=true;
  }
  public void show(){
    fill(255, 255, 255);
    circle(x, y, size);
    //println(x+" "+y);
  }
  public void move(int changeX, int changeY){
    x+=changeX;
    y+=changeY;
  }
}
