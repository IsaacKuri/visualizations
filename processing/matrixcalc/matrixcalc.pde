//Adding matrices

float[][] matrix1 = {
{1,2,3,3},
{4,5,6,3},
{7,8,9,3}
};
float[][] matrix2 = {
{11,2,3,3},
{4,52,6,3},
{7,8,93,3},
};

Operator sup = new Operator(3,4);
void setup(){
  size(800,400);
  //fullScreen();
}

void draw(){
  background(0);
  sup.addition(matrix1,matrix2);
}
