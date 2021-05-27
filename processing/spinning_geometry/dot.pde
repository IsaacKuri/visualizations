class Dot{
  float spin;
  float len = random(1,height/2);
  float angle = random(0,2*PI);
  PVector origin;
  PVector loc = new PVector();
  
  Dot(float spin_, float centrex_, float centrey_){
    spin = spin_;
    origin = new PVector(centrex_,centrey_);
    caloc();
  }
  void ranor(){
    origin.x = origin.x + random(0,4);
    origin.y = origin.y + random(0,4);
  }
  void movor(){
  }
  void caloc(){
    loc.x = origin.x + len*cos(angle);
    loc.y = origin.y + len*sin(angle);
    angle = angle + spin;
  }
  void connect(Dot node_){
    strokeWeight(3);
    stroke(0);
    line(loc.x,loc.y,node_.loc.x,node_.loc.y);   
  }
  void render(){
    circle(loc.x,loc.y,10);
  }
}
