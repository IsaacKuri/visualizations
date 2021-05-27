ArrayList<Drop> drops = new ArrayList(); 

void setup(){
  fullScreen();
}

void draw(){
  /* Probabilidad de spawnear */
  if(random(0,100) <= 80){
    drops.add(new Drop());
    drops.add(new Drop());
  }
  background(0);
  for(int i = 0; i < drops.size(); i++){
    drops.get(i).render();
    if(drops.get(i).shine()){
      drops.remove(i);
    }
  }

}
