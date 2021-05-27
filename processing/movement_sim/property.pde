class Property{
    int ofwho = 0;
    // 1: Anger, 
    /* float[4][1] effects = {
        {random(0,1)},
        {random(0,1)},
        {random(0,1)},
        {random(0,1)}
    }; */
    float food = 0;
    boolean occupied = true;

    Property(int ofwho_){
        ofwho = ofwho_;
        food = random(0,1);
    }
    float eat(){
        checkresources();
        if (food > 0){
            food -= 0.1;
            return 0.2;
        } 
        else{
            return 0;
        }
    }
    void checkresources(){
        if (food < 0.05){ 
        food = 0;
        }
    }
}