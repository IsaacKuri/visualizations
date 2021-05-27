Segment end;
Segment start;
PVector base;
int counter = 0;
ArrayList<Point> points = new ArrayList<Point>();

Coordinate[] cords = {
new Coordinate(250,180),
new Coordinate(275,180)
}; //Aqui mentan los puntos separenlos con una coma.


void setup() {
  size(600, 400);
  start = new Segment(300, 200, 150, 0);
  Segment current = start;

  for (int i = 0; i < 1; i++) { //Este for define la cantidad de brazos
    Segment next = new Segment(current, 150, i);
    current.child = next;
    current = next;
  }
  end = current;
  base = new PVector(width/2, height); 
}

void draw() {
  background(51);
  if (counter < cords.length){
    end.follow(cords[counter].pos.x,cords[counter].pos.y);
    if (counter != cords.length -1){
    cords[counter].movto(cords[counter + 1],1);
    }
    points.add(new Point(cords[counter].pos.x,cords[counter].pos.y));
    if (cords[counter].ready){
      counter++;
    }
  }
  end.update();
    for(Point part : points){
      part.render();
    } 
  Segment next = end.parent;
  while (next != null) {
    next.follow();
    next.update();
    next = next.parent;
  }


  start.setA(base);
  start.calculateB();
  next = start.child;
  while (next != null) {
    next.attachA();
    next.calculateB();
    next = next.child;
  }

  end.show();

  next = end.parent;
  while (next != null) {
    next.show();
    next = next.parent;
  }
  
}
