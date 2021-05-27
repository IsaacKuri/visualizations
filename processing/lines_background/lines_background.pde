//libraries
import com.hamoid.*;
VideoExport videoExport;

ArrayList<Obline> lines = new ArrayList();
int amnt = 200;
int count = 0;
int pos = 0;
void setup(){
videoExport = new VideoExport(this);
videoExport.startMovie();
//size(2560,1440);
fullScreen();
background(255);
/*
for(int i = 0; i < amnt; i ++){
  lines.add(new Obline(i,amnt));
} 
*/
}

void draw(){
  background(255);
  if(count == 0 && pos < amnt){
  lines.add(new Obline(pos,amnt,0,height/2,width,height/2));
  pos++;
  }
  for(int i = 0; i < lines.size(); i++){
  lines.get(i).render();
  }
  if (count <= 10){
  count++;
  }
  else{ count = 0;}
  //println(test.dot_1);
  videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
  if (key == 's') {
    saveFrame("lines-####.png"); 
  }
}
/*
Known parameters
-----------------
Walking illusion
lines.add(new Obline(pos,amnt,0,0,width,height));
if (count <= 30){
-----------------
Wavy effect
lines.add(new Obline(pos,amnt,0,height/2,width,height/2));
if (count <= 10){
*/
