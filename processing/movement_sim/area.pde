class Area{
    //[posy*lenx + pos x] Index bases
    int size_x = 1;
    int size_y = 1;
    int who = 0;
    int r = 0;
    int g = 0;
    int b = 0;
    //Area space
    int bywho = 0;
    boolean occupied = false;
    PVector pos = new PVector();
    //Properties contain effects and resources.
    Property prop;

    Area(int size_x_,int size_y_,int who_){
        size_x = size_x_;
        size_y = size_y_;
        who = who_;
        prop = new Property(who_);
        identity();
    }
    void identity(){
        //Indexes the area
        if (who == 0){
            pos.x = 0;
            pos.y = 0;
        }
        else{
            for(int x = 0; x < size_x; x ++){
                for(int y = 0; y < size_y; y++){
                    if(((y*size_x + x)- who) == 0){
                        pos.x = x;
                        pos.y = y;
                        break;
                    }
                }
            }
        }
    }
    //Functions to support occupation of entities
    boolean occupied(){
        return occupied;
    }
    void state_occupied(boolean state, int who_){
        occupied = state;
        bywho = who_;
    }
    //Functions that support the state of resources
    boolean resources(){
        if (prop.food == 0){
            return false;
        }
        else{
            return true;
        }
    }
    void show(){
        //Renders the area and ponderates the values signifying a color.
        if(occupied){
            r = 255;
        }
        else{
            r = 0;
        }
        g = int(map(prop.food,0,1,0,255));
        fill(r,g,b);
        noStroke();
        rect(pos.x * width/size_x, pos.y * height/size_y , width/size_x, height/size_y);
    }
}