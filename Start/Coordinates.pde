class Coordinates {
  boolean isObstacle;
  boolean isGoal;
  
  Coordinates(){
    isObstacle = false;
    isGoal = false;
  }
  
  Coordinates(boolean obstacle, boolean goal){
    
    if (obstacle){
      isObstacle = true;
      isGoal = false;
    }
    else if (goal){
      isGoal = true;
      isObstacle = false;
    }
    
  }
  
}
