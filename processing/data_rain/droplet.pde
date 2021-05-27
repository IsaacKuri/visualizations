class Droplet{
    //Data structure of the droplet
    PVector pos = new PVector();
    PVector vel = new PVector(0,0.1);
    PVector accel = new PVector(0,0);
    char[] byteArray = {'0','0','0','0','0','0','0','0'}; 
    int delayTimer = 0; //<---- to update the value 60 == 1s
    
    int maxSize = 30;
    int textSize;
    int tone;

    float offset = 0;
    
    
    Droplet(){
        textSize = int(random(1,maxSize));
        tone = int(map(textSize, 1, maxSize, 40, 255));
        //Spawn
        pos.x = random(0,width);
        pos.y = -textSize*8 -random(0, 100);
        upt_byte();
    }

    //Updates random text
    void upt_byte(){
        for(int i = 0; i < 8 ; i++){
            if(coin_flip()){
                byteArray[i] = '1';
            } 
            else {
                byteArray[i] = '0';
            }
            
        }
    }
    //Sadness
    boolean coin_flip(){
        if(random(0,100) >= 50){
            return true;
        }
        else {
            return false;
        }
    }
    //Moves the relative position of each byte
    void upt_movement(){
        pos.add(vel);
        vel.add(accel);
        accel.y += 0.0001;
        offset = map(accel.y, 0, 0.09, 0, textSize);
    }
    //Determines a change of state
    void state_change(){
        delayTimer++;
        if(delayTimer == 30){
            upt_byte();
            delayTimer = 0;
        }
    }
    //Checks if the particle is in view
    boolean onView(){
        if(pos.y > height){
            return false;
        }
        else {
            return true;
        }
    }

    void render(){
        state_change();
        //Rendering bs
        pushMatrix();
        translate(pos.x, pos.y);
        fill(0,tone,0);
        textFont(digital);
        textSize(textSize);
        for(int i = 0; i < 8; i++){
            text(byteArray[i],0 ,textSize*i +  offset*i);
        }
        popMatrix();
        upt_movement();
    }

}