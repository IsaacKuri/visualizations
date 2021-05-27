class Entity{
    //Presetup
    int size_x,size_y = 0;
    int xdir = 1;
    int ydir = 1;
    int id = 0;
    int r,g,b = 0;
    //Resources
    float hunger = 0.5;
    float energy = 1;
    //This is the chance of movement.
    float move;
    boolean moved = false;
    //Temporary implementation of non-food avoidment.
    int not_moved = 0;
    boolean avoid = false;
    //Position vectors, as interactions require future and current states.
    PVector pos;
    int tempx,tempy = 0;
    Entity(int size_x_, int size_y_, int id_, int amount_){
        //Spawn
        size_x = size_x_;
        size_y = size_y_;
        pos = new PVector(int(random(0,size_x)),int(random(0,size_y)));
        id = id_;
        r = int(map(id,0,amount_,0,255));
        g = int(map(id,0,amount_,150,0));
        b = int(map(id,0,amount_,40,255));
    }
    
    void status_update(){
        //Updates status
        if (hunger < 1){
            hunger += 0.01;
        }
        if (hunger > random(0.2,0.9)){
            if(energy >= 0){
            energy -= 0.01;
            }
        }
        if (hunger < 0.15){
            energy += 0.15;
        }
    }    
    void calc_move(){
        //Takes the factor of movmenet
        move = energy*100;
    }
    //General Functions
    
    int get_index_temp(){
        //Gets the index of the future movement.
        return int(tempy*size_x + tempx);
    }
    
    int get_index(){
        //Gets the index of the current position.
        return int(pos.y*size_x + pos.x);
    }
    //Related to the event of moving.
    boolean action_move_event(){
        //Event that triggers an attempt to move.
        moved = false;
        tempx = int(pos.x);
        tempy = int(pos.y);
        calc_move();
        status_update();
        //x movement
        if( 20 > random(0,100)){
            xdir = -xdir;
        }
        if(move > random(0,100)){
            tempx += xdir;
            moved = true;
        }
        //y movement
        if( 20 > random(0,100)){
            ydir = -ydir;
        }
        if(move > random(0,100)){
            tempy += ydir;
            moved = true;
        }
        check_boundries();
        avoid_no_food(moved);
        return moved;
    }

    void action_move(boolean occupied, boolean resources){
        //After confirming that the area is not occupied it can move.
        resources = resources && !avoid;
        if (!occupied && resources){
            pos.x = tempx;
            pos.y = tempy;
            //reseting avoidance
            not_moved = 0;
            avoid = false;
        }
    }

    void check_boundries(){
        //Related to movement, checks if they went around the map.
        if(pos.x < 0){
            pos.x = size_x - 1;
        }
        if(pos.x == size_x){
            pos.x = 0;
        }
        if(pos.y < 0){
            pos.y = size_y - 1;
        }
        if(pos.y == size_y){
            pos.y = 0;
        }
        //check for temp pos
        if(tempx < 0){
            tempx = size_x - 1;
        }
        if(tempx == size_x){
            tempx = 0;
        }
        if(tempy < 0){
            tempy = size_y - 1;
        }
        if(tempy == size_y){
            tempy = 0;
        }
    }
    //Related to eating event
    boolean action_eat_event(){
        //Chance of eating
        if(hunger > random(0.3,0.9)){
            return true;
        }
        else{
            return false;
        }
    }
    void action_eat(float eat){
        //Action of eating
        hunger -= eat;
    }
    //Function related to the avoidence of empty areas
    void avoid_no_food(boolean movement){
        if(movement){
            not_moved++;
            avoid = true;
        }
        if(not_moved >= 2){
            avoid = false;
        }
    }
    void show(){
        //Renders and updates the movement.
        fill(r,g,b);
        ellipse(pos.x * width/size_x + width/(2*size_x), pos.y * height/size_y + height/(2*size_y) , width/(2*size_x), height/(2*size_y));
    }
}