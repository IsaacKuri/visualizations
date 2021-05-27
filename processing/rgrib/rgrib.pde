/*
Filtro RGB-Grid
Hecho por: Isaac Kuri
Algoritmo de indexado (loc) hecho por Daniel Shiffman
Dentro del calculo del area utilizar <= rellena los vacios con anomalias, mientras que < deja un vacio negro.
*/

PImage image;
float r,g,b = 0;
int grid = 64;

void setup(){
  size(200, 200);
  image = loadImage("ppl.png");
  image.resize(200,200);
}
void draw(){
  loadPixels();
  image.loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int loc = x + y * width ;
      r = 0;
      g = 0;
      b = 0;
      
      //Optimization
      for (int i = -grid - 2; i <= grid ; i += 3 ) {
        for (int j = 0; j <= grid ; j += 1 ){
          int temp = i + j;
          // Checa el area
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            r = red(image.pixels[loc]);
          }
          temp = (i + 1) + j;
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            r = red(image.pixels[loc]);
          }
          temp = (i + 2) + j;
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            g = green(image.pixels[loc]);
          }
          //updatePixels();
        }
      }
      
      /*
      for (int i = -grid - 2; i <= grid ; i += 3 ) {
        for (int j = 0; j <= grid ; j += 1 ){
          int temp = i + j;
          // Checa el area
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            r = red(image.pixels[loc]);
          }
        }
      }
      for (int i = -grid - 1;i <= grid ; i += 3) {
        for (int j = 0; j <= grid ; j += 1 ){
          int temp = i + j;
          // Checa el area
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            b = blue(image.pixels[loc]);
          }
        }
      }
      for (int i = -grid;i <= grid ; i += 3) {
        for (int j = 0; j <= grid ; j += 1 ){
          int temp = i + j;
          // Checa el area
          if ( ( ((temp-1)*width/grid < x ) && ( x < temp*width/grid) ) && ( ((j-1)*height/grid < y ) && ( y < j*height/grid) ) ){
            g = green(image.pixels[loc]);
          }
        }
      }
      */
      pixels[loc] = color(r,g,b);
      
    }
  }
  updatePixels();
  noLoop();
  save("resultant2.jpg");
}
