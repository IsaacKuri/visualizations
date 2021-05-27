var x;
var y;
var acc = 0.0001;
var spd = 0;
var dirr;
var accy = 0.0001;
var spdy = 0;
var dirry;
var xrandom;
var yrandom;



function setup() {
  createCanvas(500,500);
  background(150,150,150);
  x = random(499);
  y = random(499)
  xrandom = random(100);
  yrandom = random(100);
  if (xrandom < 50){
    dirr = 1;
  }
  else {
    dirr = -1;
  };
  if (yrandom < 50){
    dirry = 1;
  }
  else {
    dirry = -1;
  };
}

function draw(){


  noStroke();
  fill(0,random(255),random(255),random(100))
  ellipse(x, y, random(20), random(20));
  if (x > width || x < 0){
    dirr = dirr*-1;
  }
  x += spd*dirr
  spd += acc*random(150);

  if (y > height || y < 0){
    dirry = dirry*-1;
  }
  y += spdy*dirry
  spdy += accy*random(150);
}
