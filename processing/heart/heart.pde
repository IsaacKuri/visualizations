//Video Export
import com.hamoid.*;
VideoExport videoExport;
//Glob vars
ArrayList<Dot> dots = new ArrayList<Dot>();
ArrayList<Vecmatrix> matrix = new ArrayList<Vecmatrix>();
int grid = 10;
void setup(){
 size(600,600);
 //Video Export
 videoExport = new VideoExport(this);
 //videoExport.setMovieFileName("test");
 videoExport.startMovie();
 for(int i = 0; i < width; i = i + width/grid){
   for(int j = 0; j < width; j = j + width/grid){
       matrix.add(new Vecmatrix(i ,j, (width/grid)/2));
   }
 }
}

void draw(){
  background(0,0,0);
  if (dots.size() < 600){
    dots.add(new Dot(random(360),15));
  }
   for (int i = 0; i < dots.size(); i++) {
    Dot get = dots.get(i);
    get.plusangle(0.01);
    for(int j = 0; j < matrix.size(); j++){
    get.dev(matrix.get(j));
    }
  }
  //Video Export
  videoExport.saveFrame();
}


void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
