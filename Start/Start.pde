//Grid
Coordinates[][] grid;
Testee[] testees;
Obstacles[] obstacles;
Tester Teacher;

//Properties
int goalx = 800;
int goaly = 280;
int goalw = 40;
int goalh = 40;
//Center of goal for comparer, goalx+goalw/2, goaly+goalh/2

int currentFrame;
int currentGeneration;

void setup() {
  size(1000, 600);
  background(200);
  frameRate(60);
  
  Teacher = new Tester();
  Teacher.initialTest();
  
  currentFrame = 0;
  currentGeneration = 1;
  
  grid = new Coordinates[width][height];
  for (int i = 0; i < width; i++){
    for (int j = 0; j < height; j++){
      grid[i][j] = new Coordinates();  
    }
  }
  
  //Create Obstacles
  obstacles = new Obstacles[10];
  for (int i = 0; i < 10; i++){
    obstacles[i] = new Obstacles();  
  }
  obstacles[0].x = 500;
  obstacles[0].y = 50;
  obstacles[0].wide = 50;
  obstacles[0].high = 500;
  //createObstacle(obstacles[0].x,obstacles[0].y,obstacles[0].wide,obstacles[0].high);
  
  //Create Goal
  createGoal(goalx,goaly,goalw,goalh);
}

void draw(){
  background(200); //Refreshes the screen
  
  update(currentFrame);
  text("Current Generation: " + currentGeneration + "\nCurrent Frame: " + currentFrame + "/1000", 10, 20);
  
  //Draws each testee
  for (int i = 0; i < Teacher.testees.length; i++){
    Teacher.testees[i].display();  
  }
  
  //Obstacles
  fill(100);
  for (int o = 0; o < obstacles.length; o++){
    rect(obstacles[o].x,obstacles[o].y,obstacles[o].wide,obstacles[o].high);
  }
  //Goals
  fill(255);
  rect(goalx,goaly,goalw,goalh);
  
  currentFrame++;
  if (currentFrame == 1000){
    print("New Test");
    Teacher.resetTestees();
    Teacher.nextTest();
    currentFrame = 0;
    currentGeneration++;
  }
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


/*
//Used to move the initial testee
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP) {
      //print("Key pressed");
      testees[0].x += testees[0].speed * cos(radians(testees[0].angle));
      testees[0].y += testees[0].speed * sin(radians(testees[0].angle));
    }
    if (keyCode == LEFT) {
      testees[0].angle++;
      //print("Key pressed");
      if (testees[0].angle == 360){
        testees[0].angle = 0;
      }
    }
    if (keyCode == RIGHT) {
      testees[0].angle--;
      //print("Key pressed");
      if (testees[0].angle == 0){
        testees[0].angle = 360;  
      }
    }
  }
}
*/

void update(int f){
  int done = 0;
  for (int i = 0; i < Teacher.commands.length; i++){
    if (zoneDetection(Teacher.testees[i]) == 1){
      if (done < 15){
        Teacher.testees[i].diedFirst = true;
      }
      done++;
    }
    else if (zoneDetection(Teacher.testees[i]) == 2){
      done = Teacher.testees.length;
      i = Teacher.commands.length;
    }
    else {
      //print(Teacher.commands[i][f]);
      if (Teacher.commands[i][f] == 1){
        Teacher.testees[i].angle+=5;
      }
      if (Teacher.commands[i][f] == 2){
        Teacher.testees[i].angle-=5;  
      }
      Teacher.testees[i].x += Teacher.testees[i].speed * cos(radians(Teacher.testees[i].angle));
      Teacher.testees[i].y += Teacher.testees[i].speed * sin(radians(Teacher.testees[i].angle));
    }
  }
  if (done == Teacher.testees.length){
    Teacher.nextTest();
    Teacher.resetTestees();
    currentFrame = 0;
    currentGeneration++;
  }
}

int zoneDetection(Testee t){
  //Checks if it's at the boundaries of the world
  if (t.x <= 0){
    return 1;  
  }
  else if (t.x >= width){
    return 1;
  }
  if (t.y <= 0){
    return 1;
  }
  else if (t.y >= height){
    return 1;  
  }
    
  if (grid[(int)t.x][(int)t.y].isObstacle){
    return 1;
  }
  else if (grid[(int)t.x][(int)t.y].isGoal){
    return 2;  
  }
  return 0;
}
