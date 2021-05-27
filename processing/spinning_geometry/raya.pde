class Raya{
  PVector Or = new PVector();
  PVector Re = new PVector();
  float alpha = 20.0; //20
  float decay = 0.1; //0.5
  
  Raya(float ax_, float ay_, float bx_, float by_){
        Or.x = ax_;
        Or.y = ay_;
        Re.x = bx_;
        Re.y = by_;
  }
  void show(){
        strokeWeight(2);
        stroke(0,alpha);
        line(Or.x,Or.y,Re.x,Re.y);
        fade();
  }
  
  void fade(){
    alpha -= decay; 
  }
  boolean amIdeath(){
    if(alpha < 0){
      return true;
    }
    else{
      return false;
    }
  }

}
