class Bar{
    constructor(bot, maxv){
        this.base = bot;
        this.maxv = maxv
        this.color = [random(0,255),random(0,255),random(0,255)];
    }
    render(pos,numv){
        this.altura = map(numv, 0, this.maxv , 0, height);
        rect(pos * this.base, height ,this.base, this.altura * -1);
        fill(this.color[0], this.color[1], this.color[2])
    }
}
var howmany = 1500;
var numbers = [];
var bars = [];
var xratio;
var upperlimit;
var tempstor;
function setup(){
    createCanvas(1000,700);
    for (i = 0; i < howmany; i++) {
        numbers.push(random(1, 5000));
    }
    xratio = width / howmany;
    upperlimit = Math.floor(max(numbers));

    for (i = 0; i < howmany; i++) {
        bars.push(new Bar(xratio, upperlimit));
    } 
    noStroke();
    frameRate();
}

function draw(){
    background(150);
    text("Amount of numbers: " + numbers.length, 0, 10)
    for (i = 0; i < numbers.length -1; i++){
        for(j = i ; j < numbers.length -i -1; j++){
                if(numbers[j] > numbers[j+1]){
                    tempstor = numbers[j]
                    numbers[j] = numbers[j+1]
                    numbers[j+1] = tempstor
                    // for (i = 0; i < numbers.length; i++) {
                    //     bars[i].render(i, Math.floor(numbers[i]));
                    // }
                }
            }
        for (i = 0; i < numbers.length; i++) {
             bars[i].render(i, Math.floor(numbers[i]));
            }
        }
    for (i = 0; i < numbers.length; i++) {
        bars[i].render(i, Math.floor(numbers[i]));
    }
    
}