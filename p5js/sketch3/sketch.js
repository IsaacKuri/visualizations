class Dot{
    constructor(){
        this.vec = createVector(random(0, width),random(0, height)); //random spawn
        this.color = [random(0,255), random(0,255), random(0,255)];   
    }
    velo(velx,vely){
        this.vecspd = createVector(velx, vely); //velocity vector;
    }
    addv(addx,addy){
        this.addvec = createVector(addx, addy); //Adds velocity to the particle
        this.vecspd.add(this.addvec);
    }
    gravity(){
        //Condition to work with gravity
        if(this.vec.y < height - radius){
            this.grav = createVector(0, 0.2);
            this.vecspd.add(this.grav);
        }
    }
    normal(){
        // Tendency to go up when underground
        if (this.vec.y > height + radius) {
            this.norm = createVector(0, -0.2);
            this.vecspd.add(this.norm);
        }
    }
    mov(){
        //Adds all vel vectors
        this.vec.add(this.vecspd);
        this.futvec = createVector(this.vec.x, this.vec.y);
        this.futvec.add(this.vecspd);
    }
    mmag(mmag){
        //Option to multiply the magnitud
        this.vec.setMag(this.vec.mag()*mmag);
    }
    draw(){
        //Renders the balls
        fill(this.color[0], this.color[1], this.color[2]);
        ellipse(this.vec.x,this.vec.y, diameter ,diameter);
        ellipse(this.futvec.x,this.futvec.y,diameter/3,diameter/3);
    }
}
// Global variables.

//Dots variables
var amount = 100;
var diameter = 10;
var radius = diameter / 2;
var dots = [];
//Collisions variables
var crashes = 0;
var colmag = -0.999;
var rubber = false;
var bounce = true;
var bouncemag = -0.999; // Colision loss/gain.
function setup(){
    createCanvas(1500,850);
    //This generates the balls; Gives them a random velocity.
    for (i = 0; i < amount; i++) {
        dots.push(new Dot());
        dots[i].velo(random(-4, 4), random(-4, 4));
    }
}

function draw(){
    background(0, 150, 150);
    // The following loop renders and applies general forces.
    for (i = 0; i < dots.length; i++){
        dots[i].mov();
        dots[i].gravity();
        dots[i].normal();
        //This loop handles the colission's of i's object.
        for (j = 0; j < dots.length; j++) {
            if (j == i) {
            }
            else {
                if(dots[i].vec.dist(dots[j].vec) < diameter){
                    tempmag = colmag*dots[i].vecspd.mag();
                    dots[i].vecspd.setMag(dots[j].vecspd.mag()*colmag);
                    dots[j].vecspd.setMag(tempmag);
                    crashes++
                }
            }
        }
        //Wall crash condition; Can be either pushed in frame or bounce.
        if(rubber){
            if (dots[i].vec.x > width) {
                dots[i].addv(random(-1, -2), 0);
            }
            if (dots[i].vec.y > height) {
                dots[i].addv(0, random(-1, -2));
            }
            if (dots[i].vec.x < 0) {
                dots[i].addv(random(+1, +2), 0);
            }
            if (dots[i].vec.y < 0) {
                dots[i].addv(0, random(+1, +2));
            }
        }
        if(bounce){
            if ((dots[i].vec.x > width - radius) || (dots[i].vec.x < 0 + radius)) {
                dots[i].velo(dots[i].vecspd.x * bouncemag, dots[i].vecspd.y);
            }
            if ((dots[i].vec.y > height - radius) || (dots[i].vec.y < 0 + radius)) {
                dots[i].velo(dots[i].vecspd.x, dots[i].vecspd.y * bouncemag);
            }
        }
        dots[i].draw();
    }
    fill(255);
    text("balls: " + dots.length, 10, 10);
    text("collisions: " + crashes, 150, 10);
}
