class Tester {
  int[][] commands;
  color[] colors;
  /*
  0 = stay straight
  1 = turn left
  2 = turn right
  */
  Testee[] testees;
  
  Tester(){
    commands = new int[25][1000];
    colors = new color[25];
    colors[0] = color (255,0,0);
    colors[1] = color (255,255,0);
    colors[2] = color (255,0,255);
    colors[3] = color (0,255,0);
    colors[4] = color (0,255,255);
    colors[5] = color (0,0,255);
    colors[6] = color (200,0,0);
    colors[7] = color (200,200,0);
    colors[8] = color (200,0,200);
    colors[9] = color (0,200,0);
    colors[10] = color (0,200,200);
    colors[11] = color (0,0,200);
    colors[12] = color (150,0,0);
    colors[13] = color (150,150,0);
    colors[14] = color (150,0,150);
    colors[15] = color (0,150,0);
    colors[16] = color (0,150,150);
    colors[17] = color (0,0,150);
    colors[18] = color (100,0,0);
    colors[19] = color (100,150,0);
    colors[20] = color (100,0,150);
    colors[21] = color (100,250,0);
    colors[22] = color (100,0,250);
    colors[23] = color (250,200,100);
    colors[24] = color (100,200,250);

    testees = new Testee[25];
    for (int i = 0; i < testees.length; i++){
      testees[i] = new Testee(100,300,5,colors[i]);  
    }
  }
  
  Tester(Testee[] testers){
    this();
    
    testees = testers;
  }
  /*
  void resetTestees(){
    for (int i = 0; i < testees.length; i++){
      testees[i].x = 100;
      testees[i].y = 300;
      testees[i].angle = 0;
      testees[i].diedFirst = false;
    }
  }
  */
  /*
  void initialTest(){
    for (int i = 0; i < commands[0].length; i++){
      for (int j = 0; j < commands.length; j++){
        commands[j][i] = (int)random(3);
      }
    }
  }
  */
  /*
  int[] mutateCommands(int[] orders){
    int[] ret = new int[orders.length];
    for (int i = 0; i < orders.length; i++){
      if ((int)random(10) > 0){ //10% chance of mutation
        ret[i] = orders[i];
        //print("same");
      }
      else {
        ret[i] = (int)random(3);
        //print("mutate");
      }
    }
    return ret;
  }
  */
  int grading(Testee[] testees){
    int ret = 0;
    for (int i = 1; i < testees.length; i++){
      if (testees[i].timeOfDeath/distance(testees[i].x, testees[i].y, goalx+(goalw/2), goaly+(goalh/2)) > 
      testees[ret].timeOfDeath/distance(testees[ret].x, testees[ret].y, goalx+(goalw/2), goaly+(goalh/2))
      ){
        ret = i;
      }
    }
    return ret;
  }
  
  /*
  void nextTest(){
    print("Winner: " + grading());
    commands[0] = commands[grading()]; //the first value now = to the best testee
    //print(commands[0].length);
    //print(commands[grading()].length);
    for (int i = 1; i < testees.length; i++){
      //print(commands[0].length);
      commands[i] = mutateCommands(commands[0]);
    }
  }
  */
  
  float distance(float x1, float y1, float x2, float y2){
    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));  
  }
}
