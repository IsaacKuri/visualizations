class Vecmatrix{
PVector pos = new PVector();
PVector wind = new PVector();
float angle = 0;
float increment = noise(0.5);
float len;
  Vecmatrix(float x_, float y_, float len_){
    pos.x = x_;
    pos.y = y_;
    len = len_;
  }
  void wind(){
    wind = PVector.fromAngle(angle);
    wind.setMag(random(10));
    angle = angle + increment;
  }
}
