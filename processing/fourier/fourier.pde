int spd = 1;
float time = 0.5;
Vecdir dad; 
Vecdir current;
//Dad's config
float dadlen = 4/PI;
float dadfreq = 1;
//If childsize and childfreq length are not equal then the program wont function.
float[] childsize = {50 * 4/(PI),50 * 4/(3*(PI)),50 * 4/(5*(PI))};
float[] childfreq = {1,3,5};

ArrayList<Dot> dots = new ArrayList<Dot>();
ArrayList<Vecdir> children = new ArrayList<Vecdir>();

void setup(){
  size(1500,500);
  //Set the origin
  dad = new Vecdir(200, height/2, dadlen, dadfreq);
  for(int i = 0; i < childsize.length;i++){
    children.add(new Vecdir(childsize[i],childfreq[i]));
  }
}

void draw(){
  for(int i = 0; i < 1; i++){
    background(255);
    dad.res();
    dad.rendercircle();
     for(int j = 0;j < childsize.length ; j++){
      if (j == 0){
        current = children.get(j);
        children.get(j).childof(dad);
      }
      else {
        children.get(j).childof(current);
        current = children.get(j);
      }
    }
    dots.add(new Dot());
    dots.get(dots.size()-1).imat(children.get(children.size()-1), 450);
    
    for(Vecdir j: children){
      j.rendercircle();
    }
    for(Dot j : dots){
      j.render();
      j.time(time);
    }
    if (dots.get(0).posx > width){
      dots.remove(0);
    }
    //println(children.get(2).orv);
    //println(children.get(2).resv);
  }
}
