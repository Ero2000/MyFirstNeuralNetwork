//Grid
Coordinates[][] grid;
Testee[] testees;
Obstacles[] obstacles;
Tester Teacher;
Maker Builder;

//Properties
int goalx = 800;
int goaly = 280;
int goalw = 40;
int goalh = 40;
//Center of goal for comparer, goalx+goalw/2, goaly+goalh/2

int spawnX = 200;
int spawnY = 300;

int currentFrame;
int currentGeneration;

void setup() {
  size(1000, 600);
  background(200);
  frameRate(60);
  
  Teacher = new Tester();
  Builder = new Maker();
  testees = Builder.startBuild();
  
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
  createObstacle(obstacles[0].x,obstacles[0].y,obstacles[0].wide,obstacles[0].high);
  
  //Create Goal
  createGoal(goalx,goaly,goalw,goalh);
}

void draw(){
  background(200); //Refreshes the screen
  
  update(currentFrame);
  text("Current Generation: " + currentGeneration + "\nCurrent Frame: " + currentFrame + "/" + Builder.commands[0].length, 10, 20);
  
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
  
  currentFrame++;
  if (currentFrame == Builder.commands[0].length){
    Builder.nextGeneration(Teacher.grading(testees));
    resetTestees();
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
  int wingding = -1;
  boolean winner = false;
  for (int i = 0; i < Builder.commands.length; i++){
    if (zoneDetection(testees[i]) == 1){
      done++;
    }
    else if (zoneDetection(testees[i]) == 2){
      wingding = i;
      i = Builder.commands.length;
      winner = true;
    }
    else {
      if (Builder.commands[i][f] == 1){
        testees[i].angle+=5;
      }
      if (Builder.commands[i][f] == 2){
        testees[i].angle-=5;  
      }
      testees[i].x += testees[i].speed * cos(radians(testees[i].angle));
      testees[i].y += testees[i].speed * sin(radians(testees[i].angle));
      testees[i].timeOfDeath++;
    }
  }
  if (winner){
    Builder.nextGeneration(wingding);
    resetTestees();
    currentFrame = 0;
    currentGeneration++;
  }
  else if (done == testees.length){
    Builder.nextGeneration(Teacher.grading(testees));
    resetTestees();
    currentFrame = 0;
    currentGeneration++;
  }
}


void resetTestees(){
  for (int i = 0; i < testees.length; i++){
    testees[i].x = spawnX;
    testees[i].y = spawnY;
    testees[i].angle = 0;
    testees[i].timeOfDeath = 0;
  }
}
  
int zoneDetection(Testee t){
  //Checks if it's at the boundaries of the world
  if (t.x <= 0 || t.x >= width){
    return 1;  
  }
  if (t.y <= 0 || t.y >= height){
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
