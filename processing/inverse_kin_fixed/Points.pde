class Point{
  PVector pos;
  Point(float x, float y){
    pos = new PVector(x, y);
  }
  void render(){
    ellipse(pos.x,pos.y,5,5);
  }

};
