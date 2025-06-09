abstract class GameObject{
  public float x, y, vx, vy, size;
  GameObject(){
  }
  public void move(int changeX, int changeY){
    x+=changeX;
    y+=changeY;
  }
}
