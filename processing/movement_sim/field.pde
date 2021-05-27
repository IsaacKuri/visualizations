class Field{
    //Size
    int areas_x;
    int areas_y;
    int am_ent = 10;
    //Object structures
    ArrayList<Area> areas = new ArrayList<Area>();
    ArrayList<Entity> entities = new ArrayList<Entity>();
    Field(int areas_x_,int areas_y_){
        areas_x = areas_x_;
        areas_y = areas_y_;
        //Areas & entities spawn
        for(int i = 0; i < areas_x*areas_y; i++){
            areas.add(new Area(areas_x,areas_y,i));
        }
        for(int i = 0; i < am_ent; i++){
            entities.add(new Entity(areas_x,areas_y,i + 1,am_ent));
        }
    }
    void lines(){
        //This function generates the grid lines
        stroke(0);
        strokeWeight(1);
        for(int x = 0; x < areas_x; x++){
            line( (x*width)/areas_x + width/areas_x , 0, (x*width)/areas_x + width/areas_x , height);
        }
        for(int y = 0; y < areas_y; y++){
            line(0,(y*height)/areas_y + height/areas_y ,width,(y*height)/areas_y + height/areas_y);
        }
    } 
    void pipeline(){
        //This functions acts as a pipeline between areas and entities.
        for(int i = 0; i < entities.size(); i++){
            for(int j = 0; j < entities.size(); j++){
                //Mandatory state update of the occupation
                int area_check_state = entities.get(j).get_index();
                areas.get(area_check_state).state_occupied(true,entities.get(j).id);   
            }
            //Index of the current area being evaluated
            int area_check = entities.get(i).get_index();
            
            //Events to happen in areas
            if(entities.get(i).action_eat_event()){
                entities.get(i).action_eat(areas.get(area_check).prop.eat());
            }
            //The most complex event is the movement event
            if(entities.get(i).action_move_event()){
                int fut_ind = entities.get(i).get_index_temp();
                if(!areas.get(fut_ind).occupied() && areas.get(fut_ind).resources()){
                    areas.get(entities.get(i).get_index()).state_occupied(false,0);
                }
                entities.get(i).action_move(areas.get(fut_ind).occupied(), areas.get(fut_ind).resources());
            }
            else {
                areas.get(area_check).state_occupied(true,entities.get(i).id);
            }   
        }
    }
    void render(){
        //This function renders the position and state of the areas & entities, also updates pipelines.
        pipeline();
        for(int i = 0; i < areas.size(); i++){
            areas.get(i).show();
        }
        for(int i = 0; i < entities.size(); i++){
            entities.get(i).show();
        }
        lines();
        println(entities.get(0).energy + " " + entities.get(0).hunger + " " + entities.get(0).not_moved + " " + entities.get(0).avoid );
    }
}
