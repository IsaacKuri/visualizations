class Dot{
  PVector pos = new PVector();
  float angle = 0;
  int len;
  float devx;
  float devy;
  Dot(float angle_, int len_){
    angle = angle_;
    len = len_;
  }
  void cpos(){
    //from http://mathworld.wolfram.com/HeartCurve.html
    pos.x = 16 * pow(sin(angle),3);
    pos.y = 13*cos(angle) - 5*cos(2 * angle) -2*cos(3*angle) -cos(4 *angle);
    pos.x = pos.x * len;
    pos.y = -1*pos.y * len;
    pos.x = width/2 + pos.x;
    pos.y = height/2 + pos.y;
  }
  void inside(Vecmatrix temp_){
    if  (((pos.x > temp_.pos.x - temp_.len) && (pos.x < temp_.pos.x + temp_.len))
    && ((pos.y > temp_.pos.y - temp_.len) && (pos.y < temp_.pos.y + temp_.len))){
      temp_.wind();
      devx = temp_.wind.x;
      devy = temp_.wind.y;
    }
    else{
      devx = 0;
      devy = 0;
    }
  }
  
  void plusangle(float inc_){
    angle = angle + inc_;
  }
  
  void render(){
    //No effect just the hearth
    cpos();
    noStroke();
    fill(255);
    circle(pos.x,pos.y, 1);
  }

  void dev(Vecmatrix temp_){
    cpos();
    //temp_.wind();
    inside(temp_);
    noStroke();
    fill(255,0,0);
    if((devx != 0)&&(devy != 0)){
    circle(pos.x,pos.y + devy, 2);
    }
  }
}
