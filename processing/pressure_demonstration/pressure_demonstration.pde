//Keep it simple boy
void setup(){
  fullScreen();
}

void draw(){
  noStroke();
  fill(0);  
  rect(0,0,width,height);
  
  fill(64,164,223);  
  rect(5,0,width - 10,height - 5);
  
  fill(255);  
  rect(5,0,width - 10, height/4);
  
  pressure();
}

void pressure(){
   float altura = (mouseY - height/4)/50.0;
   float gravedad = 9.81;
   float densidad = 997;
   float pressure;
   fill(0);
   stroke(0);
   strokeWeight(5); 
   line(0,mouseY,width,mouseY);
   noStroke();
   fill(0);
   circle(mouseX,mouseY,10);
   if(mouseY < height/4){
   pressure = 0;
   }
   else{
   pressure = gravedad * altura * densidad;
   }
   textSize(25);
   text("Pressure: " + pressure + "Pa",5,height/6);
   textSize(15);
   text("Height: " + altura + "m",5,mouseY - 5);
}
