class player extends GameObject{
  public float hitbox;
  int lives;
  player(){
    x=width/2;
    y=height/2;
    size=50;
    hitbox=30;
  }
  public void show(){
    fill(77, 132, 217);
    circle(x, y, size);
    //println(x+" "+y);
  }
  @Override
  public void move(int changeX, int changeY){
    x+=changeX;
    y+=changeY;
    if(x<size/2){
      x=size/2;
    }
    if(x>width-size/2){
      x=width-size/2;
    }
    if(y<size/2){
      y=size/2;
    }
    if(y>height-size/2){
      y=height-size/2;
    }
  }
}
