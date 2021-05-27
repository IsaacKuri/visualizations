class Line{
    constructor(){
        this.xo
        this.yo
        this.xt
        this.yt
        this.color 
    };
    render(){
        stroke(this.color);
        strokeWeight(random(55));
        beginShape(LINES);
        vertex(this.xo, this.yo);
        vertex(this.xt, this.yt);
        endShape();
    }
};
var lines = [];
var i = 0;
var lastx;
var lasty;
function setup(){
    frameRate();
    createCanvas(500,500);
    
};

function draw(){
    background(200,100,255);
    lines.push(new Line());
    lines[i].xt = random(500);
    lines[i].yt = random(500);
    if (lines.length > 1){
        lastx = lines[i - 1].xt;
        lasty = lines[i - 1].yt;
    }
    else {
        lastx = random(500);
        lasty = random(500);
    };

    lines[i].xo = lastx;
    lines[i].yo = lasty;
    for (j = 0; j < lines.length;j++){
        lines[lines.length-1].color = random(255);
        lines[j].render();
    }
    i++;
    text(i,10,10)
};