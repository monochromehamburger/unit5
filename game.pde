void game(){
  if(random(0,30)<1){
    enemies.add(new enemy());
  }
  ship.show();
  if(aKey) ship.move(-10, 0);
  if(dKey) ship.move(10, 0);
  if(wKey) ship.move(0, -10);
  if(sKey) ship.move(0, 10);
  for(int i=0;i<enemies.size();i++){
    if(enemies.get(i).alive==true){
      enemies.get(i).move(0,5);
      enemies.get(i).show();
      if(enemies.get(i).y>height+100){
        enemies.get(i).alive=false;
      }
    }
  }
}
