class Testee {
  float x, y; //Current coordinate
  float angle; //Direction facing
  int speed;
  color c;
  
  //Default Constructor
  Testee() {
    x = 100;
    y = 300;
    angle = 0;
    speed = 10;
    c = color(255, 0, 0);
  }
  
  //Custom Constructor
  Testee(float Cx, float Cy, int howFast, int red, int green, int blue){
    x = Cx;
    y = Cy;
    speed = howFast;
    c = color(red, green, blue);
    angle = 0;
  }
  
  void display(){
    pushMatrix();
      translate(x,y);
      rotate(radians(angle));
      beginShape();
        vertex(0, 0);
        vertex(-20,7);
        vertex(-15,0);
        vertex(-20,-7);
        fill(c);
      endShape(CLOSE);
    popMatrix();
  }
 
  //x+(15*cos(angle))/sqrt((x+(15*cos(angle)))*(x+(15*cos(angle)))), 
  //y+(15*sin(angle))/sqrt((y+(15*sin(angle)))*(y+(15*sin(angle))))
  
}
