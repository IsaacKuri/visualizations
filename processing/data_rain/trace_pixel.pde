class TracePixel{
    PVector pos;
    int alpha = 255;
    int l = 2;
    TracePixel(float x_, float y_){
        pos = new PVector(x_,y_);
    }
    void updateAlpha(int alpha_){
        alpha -= alpha_;
    }
    void position(float x_, float y_){
        pos.x = x_;
        pos.y = y_;
    }
    boolean alive(){
        if(alpha > 0){return true;}
        else {return false;}
    }
    boolean onView(){
        if(pos.y > height){
            return false;
        }
        else {return true;}
    }
    void render(){
        fill(0,150,0,alpha);
        noStroke();
        pushMatrix();
        translate(pos.x - l/2 ,pos.y -l/2);
        rect(0,0,l,l);
        popMatrix();
        updateAlpha(1);
    }
}