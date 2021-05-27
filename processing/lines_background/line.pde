class Obline{
  PVector dot_1 = new PVector();
  PVector dot_2 = new PVector();
  int dir_1_x = 1;
  int dir_1_y = 1;
  int dir_2_x = 1;
  int dir_2_y = 1;
  float grosor = 1;
  int alpha = 1;
  //Constructor determinista
  Obline(int gros_, int size,int dot1x, int dot1y, int dot2x, int dot2y){
  grosor = map(gros_,1,size,1,20);
  alpha = int(map(gros_,1,size,1,255));
  dot_1.x = dot1x;
  dot_1.y = dot1y;
  dot_2.x = dot2x;
  dot_2.y = dot2y;
  }
  //Constructor random
  Obline(int gros_, int size){
    grosor = map(gros_,1,size,1,20);
    alpha = int(map(gros_,1,size,1,255));
    if(random(0,100) >= 50){
      if(random(0,100) >= 50){
      dot_1.x = 0;
      }
      else {
      dot_1.x = width;
      }
      dot_1.y = int(random(0,height));
    }
    else{
      if(random(0,100) >= 50){
      dot_1.y = 0;
      }
      else {
      dot_1.y = height;
      }
      dot_1.x = int(random(0,width));
    }
    
    if(random(0,100) >= 50){
      if(random(0,100) >= 50){
      dot_2.x = 0;
      }
      else {
      dot_2.x = width;
      }
      dot_2.y = int(random(0,height));
    }
    else{
      if(random(0,100) >= 50){
      dot_2.y = 0;
      }
      else {
      dot_2.y = height;
      }
      dot_2.x = int(random(0,width));
    }
  }
  void path_following(){
    //(x = 0, y = 600)
    if((dot_1.x == 0 && dot_1.y == 0) 
    || (dot_1.x == 0 && dot_1.y == height) 
    || (dot_1.x == width && dot_1.y == height) 
    || (dot_1.x == width && dot_1.y == 0)){
      if(dot_1.x == 0 && dot_1.y == 0){
        dir_1_y = 1;
        dot_1.y += dir_1_y;
      }
      if(dot_1.x == 0 && dot_1.y == height){
        dir_1_x = 1;
        dot_1.x += dir_1_x;
      }
      if (dot_1.x == width && dot_1.y == height){
        dir_1_y = -1;
        dot_1.y += dir_1_y;
      }
      if (dot_1.x == width && dot_1.y == 0){
        dir_1_x = -1;
        dot_1.x += dir_1_x;
      }
    }
    else{
      if (dot_1.x == 0 || dot_1.x == width){
       dot_1.y += dir_1_y; 
      }
      else if (dot_1.y == 0 || dot_1.y == height){
       dot_1.x += dir_1_x;       
      }
    }
    
    if((dot_2.x == 0 && dot_2.y == 0) 
    || (dot_2.x == 0 && dot_2.y == height) 
    || (dot_2.x == width && dot_2.y == height) 
    || (dot_2.x == width && dot_2.y == 0)){
      if(dot_2.x == 0 && dot_2.y == 0){
        dir_2_y = 1;
        dot_2.y += dir_2_y;
      }
      if(dot_2.x == 0 && dot_2.y == height){
        dir_2_x = 1;
        dot_2.x += dir_2_x;
      }
      if (dot_2.x == width && dot_2.y == height){
        dir_2_y = -1;
        dot_2.y += dir_2_y;
      }
      if (dot_2.x == width && dot_2.y == 0){
        dir_2_x = -1;
        dot_2.x += dir_2_x;
      }
    }
    else{
      if (dot_2.x == 0 || dot_2.x == width){
       dot_2.y += dir_2_y; 
      }
      else if (dot_2.y == 0 || dot_2.y == height){
       dot_2.x += dir_2_x;       
      }
    }
  }
  void render(){
    path_following();
    stroke(0,alpha);
    strokeWeight(grosor);
    line(dot_1.x,dot_1.y,dot_2.x,dot_2.y);
  }
}
