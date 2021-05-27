//Ref https://mikeash.com/pyblog/fluid-simulation-for-dummies.html & https://www.youtube.com/watch?v=alhpH6ECFvQ

final int N = 300;
final int iter = 2;
final int SCALE = 2;
Fluid fluid;

void settings(){
  size(N*SCALE,N*SCALE);
}

void setup(){
  fluid = new Fluid(0.1, 0, 0);
}
void mouseDragged(){
  fluid.addDensity(mouseX/SCALE,mouseY/SCALE, 1000);
  float amtX = mouseX - pmouseX;
  float amtY = mouseY - pmouseY;
  fluid.addVelocity(mouseX/SCALE, mouseY/SCALE, amtX, amtY);
}
void draw(){
  background(0);
  fluid.step();
  fluid.renderD();
  fluid.fadeD();
}
