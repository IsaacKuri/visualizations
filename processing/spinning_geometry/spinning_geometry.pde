//libraries
import com.hamoid.*;
VideoExport videoExport;
/*
Spinning geometries by Isaac Kuri c:
*/
ArrayList<Dot> Dots = new ArrayList();
ArrayList<Raya> Rayas = new ArrayList();
float naisu;
Dot temp;

//User Input for later revision :)


void setup(){
  size(600,600);
  //fullScreen();
  //VideoExport
  videoExport = new VideoExport(this);
  videoExport.startMovie();
  for(int i = 0; i < 6; i++){
    if (50 < random(0,100)){
    naisu = random(0.005,0.04);
    }
    else{
    naisu = -1*random(0.005,0.04);
    }
    Dots.add(new Dot(naisu,width/2,height/2));
  }
}

void draw(){
  background(255);
  for(int i = 0; i < Dots.size(); i++){
  //Dots.get(i).ranor();
  Dots.get(i).caloc();
  }
  for(int i = 0; i < Dots.size(); i++){
    for (int j = i;j < Dots.size(); j++){
        temp = Dots.get(j);
        //Dots.get(i).render();
        //Dots.get(i).connect(temp);
        Rayas.add(new Raya(Dots.get(i).loc.x, Dots.get(i).loc.y,temp.loc.x,temp.loc.y));
    }
  }
  for(int i = 0; i < Rayas.size();i++){
  Rayas.get(i).show();
    if(Rayas.get(i).amIdeath()){
      Rayas.remove(i);
    }
  }
  videoExport.saveFrame();
}

void connect(){
  for(int i = 0; i < Dots.size(); i++){
    if (i == Dots.size() - 1){
      temp = Dots.get(0);
      Dots.get(i).connect(temp);
    }
    else{
      temp = Dots.get(i + 1);
      Dots.get(i).connect(temp);
    }
  }
}


void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
