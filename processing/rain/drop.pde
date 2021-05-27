class Drop{
  PVector pos = new PVector(random(0,width), -1*random(10,50));
  PVector vel = new PVector(0,8);
  PVector accel = new PVector(0,0);
  PVector gravity = new PVector(0,0.005);
  float len;
  float ancho = random(1,10);
  
  Drop(){
  }
  
  void render(){
  gravity();
  move();
  len = map(vel.mag(),1,10,12,25);
  noStroke();
  fill(0,0,255);
  rect(pos.x,pos.y,ancho,len);
  }
  
  void gravity(){
    accel.add(gravity);
  }
  void move(){
    vel.add(accel);
    pos.add(vel);
  }
  boolean shine(){
     if (pos.y > height){
       return true;
     }
     else{
       return false;
     }
  }
}
