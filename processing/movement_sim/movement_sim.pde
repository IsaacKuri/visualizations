Field test = new Field(250,250);

void setup(){
    //fullScreen();
    size(1000, 1000);
    frameRate(60);
}
void draw(){
    background(255);
    test.render();
}
