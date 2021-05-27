//Objeto operador, que tome las matrices y utilice el grid para mostrarlos.
class Operator{
  float[][] data1;
  float[][] data2;
  float[][] result;
  Grid A;
  Grid B;
  Grid C;
  int sizex;
  int sizey;
  Operator(int sizex_, int sizey_){
    A = new Grid(sizex_,sizey_);
    B = new Grid(sizex_,sizey_);
    C = new Grid(sizex_,sizey_);
    result = new float[sizex_][sizey_];
    sizex = sizex_;
    sizey = sizey_;
  }
  void addition(float[][] A_, float[][] B_){
    data1 = A_;
    data2 = B_;
    for(int i = 0; i < sizex; i++){
      for(int j = sizey - 1; j >= 0; j--){
        result[i][j] = data1[i][j] + data2[i][j];
      }
    }
    symbol('+');
    symbol('=');
    render();
  }
  void substraction(float[][] A_, float[][] B_){
    data1 = A_;
    data2 = B_;
    for(int i = 0; i < sizex; i++){
      for(int j = sizey - 1; j >= 0; j--){
        result[i][j] = data1[i][j] - data2[i][j];
      }
    }
    symbol('-');
    symbol('=');
    render();
  }
  //Function that renders the screen
  void render(){
      A.pos(1*width/6,height/2);
      A.getmatrix(data1);
      B.pos(3*width/6,height/2);
      B.getmatrix(data2);
      C.pos(5*width/6,height/2);
      C.getmatrix(result);
  }
  //Prints a symbol
  void symbol(char a_){
    int size = A.len/3;
    if(a_ == '+'){
        stroke(255);
        strokeWeight(2);
        line(2*width/6 -size,height/2,2*width/6 + size,height/2);
        line(2*width/6,height/2 -size,2*width/6,height/2 + size);
    }
    if(a_ == '-'){
        stroke(255);
        strokeWeight(2);
        line(2*width/6 -size,height/2,2*width/6 + size,height/2);
    }
    if(a_ == '*'){
        stroke(255);
        strokeWeight(2);
        circle(2*width/6,height/2, size*2/3);
    }
    if(a_ == '/'){
        stroke(255);
        strokeWeight(2);
        circle(2*width/6,height/2 -size, size*1/3);
        circle(2*width/6,height/2 + size, size*1/3);
        line(2*width/6 -size,height/2,2*width/6 + size,height/2);
    }
    if(a_ == '='){
        stroke(255);
        strokeWeight(2);
        line(4*width/6 -size,height/2 - size,4*width/6 + size,height/2 - size);
        line(4*width/6 -size,height/2 + size,4*width/6 + size,height/2 + size);
    }
  
  }



}
