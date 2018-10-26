//Grid
Coordinates[][] grid;
Testee[] testees;

//Properties
int width = 1000;
int height = 600;

void setup() {
  size(1000, 600);
  background(200);
  frameRate(60);
  
  grid = new Coordinates[width][height];
  testees = new Testee[1];
  testees[0] = new Testee();
}

void draw(){
  background(200); //Refreshes the screen
  
  //Draws each testee
  for (int i = 0; i < testees.length; i++){
    testees[i].display();  
  }
}

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
