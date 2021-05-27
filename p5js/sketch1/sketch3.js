class Ball {
  constructor(){
    this.x = 0;
    this.y = 300;
    this.pi = 0;
    this.wv = 0;
  }
  movey(){
    this.pi = this.pi + 0.03
    this.y = 300 + 33*Math.sin(this.pi);
    if (this.pi > 360){
      this.pi = 0;
    }
  }
  movex(){
    this.x = this.x + this.wv;
    this.wv += 0.001;
  }
  draw(){
    fill(255,255,255)
    ellipse(100 + this.x,this.y,3,3);
  }
};

var balls = [];
var up = 0;
var pi = 0;

function setup(){
  createCanvas(600,600);
};

function draw(){
  background(155,155,155)
  noStroke()
  fill(0,0,0)
  rect(298,0,2,600)
  rect(0,298,600,2)
  balls.push(new Ball())

  for (var i = 0; i < balls.length-1; i++) {
      balls[i].movey()
      balls[balls.length-1].movex()
      balls[i].draw()
    }
  if (balls[balls.length-1].x > width){
      balls.pop();
    }
};
