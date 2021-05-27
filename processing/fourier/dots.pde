class Dot{
  float size = 2;
  float posx;
  float posy;
  Dot(){
  }
  void imat(Vecdir me_, float loc_){
    posx = loc_;
    posy = me_.resv.y;
    rope(me_,loc_);
  }
  void imat(Vecdir me_){
    posx = me_.resv.x;
    posy = me_.resv.y;
  }
  void render(){
    noStroke();
    fill(0,255,0);
    circle(posx,posy,size);
  }
  void time(float time){
    posx = posx + time;
  }
  void rope(Vecdir me_,float loc_){
    line(me_.resv.x, me_.resv.y, loc_, me_.resv.y);
  }
}
