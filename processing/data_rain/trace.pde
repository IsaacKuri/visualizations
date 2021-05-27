class Trace{
    PVector pos = new PVector();
    ArrayList<TracePixel> dots = new ArrayList<TracePixel>();
    int dirx = 2;
    int bodyTrack = 0;
    boolean moveX = true;
    boolean onView = true;
    Trace(){
        pos.x = random(0,width);
    }
    boolean onView(){
        return onView;
    }
    void move(){
        if (moveX){
            pos.x += dirx;
            if (pos.x < 0){
                pos.x = width;
            }
            if (pos.x > width){
                pos.x = 0;
            }
        }
        else{
        pos.y += 2;
        if (random(0,100) < 5){
            dirx = -dirx;
        }
        }
        if (random(0,100) < 5){
            moveX = !moveX;
        }
    }
    void render(){
        move();
        dots.add(new TracePixel(pos.x,pos.y));
        for(int i = 0; i < dots.size(); i++){
            dots.get(i).render();
        }
        //Remove innecesary dots.
        for(int i = 0; i < dots.size(); i++){
            if(!dots.get(i).alive()){
                dots.remove(i);
            }
        }
        //Check if all the dots are on the screen.
        for(int i = 0; i < dots.size(); i++){
            if(!dots.get(i).onView()){
                bodyTrack++;
            }
        }
        //Condition to realease from memory.
        if(bodyTrack == dots.size()){
            onView = false;
        }
        else{
            bodyTrack = 0;
        }
        
    }
}