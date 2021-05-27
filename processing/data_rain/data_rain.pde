//libraries
import com.hamoid.*;
VideoExport videoExport;

/*
Attempting to code a digital rain
Features
    To-do
    
        Black background %
        Falling bytes [8 bits]
        Lines following a path, resembling a motherboard might add dual traces on later rev.
*/
Trace test;
ArrayList<Droplet> droplets = new ArrayList<Droplet>();
ArrayList<Trace> traces = new ArrayList<Trace>();
PFont digital;

void setup(){
    fullScreen();
    digital = createFont("digital.ttf", 32);
    //VideoExport Stuff
    videoExport = new VideoExport(this);
    videoExport.startMovie();
}

void draw(){
    background(0);
    //Spawn
    if(random(0,100) < 15 ){
        droplets.add(new Droplet());
    }
    if(random(0,100) < 3 ){
        traces.add(new Trace());
    }
    //Render Handler
    for(int i = 0; i < droplets.size(); i++){
        droplets.get(i).render();
    }
    for(int i = 0; i < droplets.size(); i++){
        if (!droplets.get(i).onView()){
            droplets.remove(i);
        }
    }

    for(int i = 0; i < traces.size(); i++){
        traces.get(i).render();
    }
    for(int i = 0; i < traces.size(); i++){
        if (!traces.get(i).onView()){
            traces.remove(i);
        }
    }
    //Video Export Stuff
    videoExport.saveFrame();
}
//For video use
void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
  if (key == 's') {
    saveFrame("lines-####.png"); 
  }
}