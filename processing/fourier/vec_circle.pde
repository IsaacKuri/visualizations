class Vecdir{
  int size = 4;
  float refill = 0;//random(0,150);
  //Origin constructor
  PVector orv = new PVector();
  float angle = 0;
  float afq = 0;
  float len;
  Vecdir dad = null;
    
  //Resultant function
  PVector resv = new PVector();
  Vecdir(){
  };
  Vecdir(float x, float y,float len_, float afq_){
      orv.x = x;
      orv.y = y;
      len = len_;
      afq = radians(afq_);
      res();
  }
  //Constructor for a child.
  Vecdir(float len_, float afq_){
     len = len_;
     res();
     afq = radians(afq_);
  }
  void childof(Vecdir dad_){
     dad = dad_;
     orv = dad.resv.copy();
     res();
  }
  void res(){
    resv.x = orv.x + len*cos(angle);
    resv.y = orv.y + len*sin(angle);
    angle = angle + afq;
  }
  void render(){
    noStroke();
    fill(refill);
    circle(resv.x,resv.y,size);
  }
  void rendercircle(){
    noStroke();
    fill(refill);
    circle(resv.x,resv.y,size);
    noFill();
    stroke(2);
    circle(orv.x,orv.y,2*len);
  }
}
