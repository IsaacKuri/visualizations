/*
Filtro RGB-Grid
Hecho por: Isaac Kuri
Algoritmo de indexado (loc) hecho por Daniel Shiffman
Dentro del calculo del area utilizar <= rellena los vacios con anomalias, mientras que < deja un vacio negro.
*/

/*
To use the algorithm place an image called "image.png" on the same folder for this project. And make the size function on setup() 
match the dimensions of your image, you can resize accordingly to set the grid resolution move the variable called grid to any value (works best with powers of two). 
After the filter is applied the resulting image will be saved as "result.png"
Warning: Move your results or rename them because the alogirthm will override results between excecutions.
*/

PImage image;
float r,g,b = 0;
int grid = 32;

void setup(){
  size(500, 500);
  image = loadImage("image.png");
  image.resize(500,500);
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
      
      /*
      //Alternative Filter (You need to comment the main filter to use this one).
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
      */
      //Main Filter
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
      
      pixels[loc] = color(r,g,b);
      
    }
  }
  updatePixels();
  noLoop();
  save("result.png");
}
