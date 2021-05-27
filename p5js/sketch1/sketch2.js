var x = 250;
var y = 250;
var spd = 0;
var dirr;
var accy;
var spdy = 0;
var dirry;
var xrandom;
var yrandom;
var gravity = 0.05;
var colorx = 0;
var colory = 0;
var go = 0;
function setup() {
  createCanvas(500,500);
  spd = random(20)
  background(150,150,150);
  //x = random(499);
  //y = random(499);
  xrandom = random(50);
  //yrandom = random(100);
  if (xrandom < 50){
    dirr = 1;
  }
  else {
    dirr = -1;
  };
  //if (yrandom < 50){
  //  dirry = 1;
  //}
  //else {
  //  dirry = -1;
  //};
}

function draw(){


  noStroke();
  fill(colorx,colory,0)
  ellipse(x, y, 20, 20);

  if (go == 0 ){
    x = mouseX;
    y = mouseY;
  }
  else{
    if (x > width - 10 || x < 10){
      dirr = dirr*-1;
      colorx = random(255)
      if (spd >= 0) {
        spd = spd - spd*0.05
      }
      else {
        spd = 0;
      }
    }
  //  x += spd*dirr
    x += spd*dirr;
    spd = spd - spd*0.01;
    if (y > height - 10 || y < 0){
      dirry = dirry*-1;
      spdy = spdy - spdy*(0.05*random(5))
      spdy = spdy*-1;
      colory = random(255)
    }
    y += spdy
    spdy += gravity
    print(spdy)
  }
}

function  mouseClicked(){
    go = 1;
  }
