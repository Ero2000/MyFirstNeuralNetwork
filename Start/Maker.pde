class Maker {
  int[][] commands;
  color[] colors;
  
  Maker(){
    commands = new int[10][500];
    colors = new color[25];
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
  }
  
  Testee[] startBuild(){
    for (int i = 0; i < commands[0].length; i++){
      for (int j = 0; j < commands.length; j++){
        commands[j][i] = (int)random(3);
      }
    }
    
    Testee[] testees = new Testee[commands.length];
    for (int t = 0; t < testees.length; t++){
      testees[t] = new Testee(spawnX,spawnY,3,colors[t]);  
    }
    return testees;
  }
  
  void nextGeneration(int alpha){
    print("\nWinner: " + alpha);
    print("\nEnd Points: " + testees[alpha].x + ", " + testees[alpha].y);
    
    float howMuchMutate = (int)(10*width/distance(testees[alpha].x,testees[alpha].y,goalx+goalw/2,goaly+goalh/2));
    //the first value now = to the best testee
    //print(commands[0].length);
    //print(commands[grading()].length);
    for (int i = 0; i < commands.length; i++){
      if (i != alpha){
        for (int a = 0; a < commands[i].length; a++){
          if (random(howMuchMutate) > 1){
            commands[i][a] = commands[alpha][a];  
          }
          else {
            commands[i][a] = (int)random(3);
          }
        }
      }
    }
  }
  
  float distance(float x1, float y1, float x2, float y2){
    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));  
  }
}
