class player{
  public float x, y, vx, vy, size;
  int lives;
  player(){
    x=width/2;
    y=height/2;
    size=100;
    
  }
  public void show(){
    fill(77, 132, 217);
    circle(x, y, size);
    //println(x+" "+y);
  }
  public void move(int changeX, int changeY){
    x+=changeX;
    y+=changeY;
  }
}
