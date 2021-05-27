class Grid{
  float[][] data;
  int sizex;
  int sizey;
  int len = 60;
  int tranx = 0;
  int trany = 0;
  Grid(int sizex_,int sizey_){
    sizex = sizex_;
    sizey = sizey_;
  }
  //Determine a position to render offset to center
  void pos(int x_, int y_){
    tranx = x_ - (len*sizex)/2;
    trany = y_ - (len*sizey)/2;
  }
  
  //Render a frame
  void frame(){
    //Vertical Lines
    for(int i = 1; i < sizex; i++){
        stroke(255);
        strokeWeight(2);
        line(i*len + tranx,0 + trany,i*len + tranx,sizey*len + trany);
    }
    //Horizontal Lines
    for(int i = 1; i < sizey; i++){
        stroke(255);
        strokeWeight(2);
        line(0 + tranx,i*len + trany,sizex*len + tranx,i*len + trany);
    }
    

  }
  //Update numbers
  void getmatrix(float[][] test_){
    data = test_;
    dispnum();
    frame();
  }
  //Display numbers
  void dispnum(){
    for(int i = 0; i < sizex; i++){
      for(int j = sizey - 1; j >= 0; j--){
        float x_temp = i*len + len/2 + tranx;
        float y_temp = j*len + len/2 + trany;
        textAlign(CENTER,CENTER);
        textSize(len/4);
        text(nfp(data[i][j],0,1),x_temp,y_temp,5);
      }
    }
  }
}
