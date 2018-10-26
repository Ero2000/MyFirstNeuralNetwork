//Grid
Coordinates[][] grid;
Testee[] testees;
Obstacles[] obstacles;

//Properties
int goalx = 800;
int goaly = 280;
int goalw = 40;
int goalh = 40;


void setup() {
  size(1000, 600);
  background(200);
  frameRate(60);
  
  grid = new Coordinates[width][height];
  for (int i = 0; i < width; i++){
    for (int j = 0; j < height; j++){
      grid[i][j] = new Coordinates();  
    }
  }
  
  obstacles = new Obstacles[10];
  for (int i = 0; i < 10; i++){
    obstacles[i] = new Obstacles();  
  }
  obstacles[0].x = 500;
  obstacles[0].y = 50;
  obstacles[0].wide = 50;
  obstacles[0].high = 500;
  
  testees = new Testee[1];
  testees[0] = new Testee();
  
  //Create Obstacles
  //Create Goal
  createGoal(goalx,goaly,goalw,goalh);
}

void draw(){
  background(200); //Refreshes the screen
  
  //Draws each testee
  for (int i = 0; i < testees.length; i++){
    testees[i].display();  
  }
  
  //Obstacles
  fill(100);
  for (int o = 0; o < obstacles.length; o++){
    rect(obstacles[o].x,obstacles[o].y,obstacles[o].wide,obstacles[o].high);
  }
  //Goals
  fill(255);
  rect(goalx,goaly,goalw,goalh);
}

//Creates rectangles from top left corner
//Obstacle
void createObstacle(int Cx, int Cy, int wide, int high){
  for (int x = Cx; x < Cx+wide; x++){
    for (int y = Cy; y < Cy+high; y++){
      grid[x][y].isObstacle = true;
      grid[x][y].isGoal = false;
    }
  }
  fill(200);
  rect(Cx,Cy,wide,high);
}
//Goal
void createGoal(int Cx, int Cy, int high, int wide){
  for (int a = Cx; a < Cx+wide; a++){
    for (int b = Cy; b < Cy+high; b++){
      grid[a][b].isGoal = true;
      grid[a][b].isObstacle = false;
    }
  }
}


//Used to show that moving works
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP) {
      print("Key pressed");
      testees[0].x += testees[0].speed * cos(radians(testees[0].angle));
      testees[0].y += testees[0].speed * sin(radians(testees[0].angle));
    }
    if (keyCode == LEFT) {
      testees[0].angle++;
      print("Key pressed");
      if (testees[0].angle == 360){
        testees[0].angle = 0;
      }
    }
    if (keyCode == RIGHT) {
      testees[0].angle--;
      print("Key pressed");
      if (testees[0].angle == 0){
        testees[0].angle = 360;  
      }
    }
  }
}
