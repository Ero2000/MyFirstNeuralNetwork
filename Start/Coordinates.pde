class Coordinates {
  boolean isObstacle;
  boolean isGoal;
  
  Coordinates(boolean obstacle, boolean goal){
    
    if (obstacle){
      isObstacle = true;
    }
    else if (goal){
      isGoal = true;
    }
    
  }
  
}
