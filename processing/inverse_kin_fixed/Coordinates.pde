class Coordinate{
  Boolean ready = false;
  PVector pos;
  Coordinate(float x, float y){
    pos = new PVector(x, y);
  }
  void movto(Coordinate to,float spd){
    if (pos.x < to.pos.x){
        pos.x = pos.x + spd;
    }
    else if (pos.x > to.pos.x){
        pos.x = pos.x - spd;
    }

    if (pos.y < to.pos.y){
        pos.y = pos.y + spd;
    }
    else if (pos.y > to.pos.y){
        pos.y = pos.y - spd;
    }
    
    if ((pos.y == to.pos.y)&&(pos.x == to.pos.x)){
      ready = true;
    }
  }
};
