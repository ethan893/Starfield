class ship {
  float x;
  float y;
  float dx;
  float dy;
}
int [] Xpos = {482, 126, 422, 294, 162};
int [] M = new int[5];
void spaceShip(int x, int y, int h) {
noStroke();
fill(50);
ellipse(ball.x, ball.y, h/3, h/3);
ellipse(ball.x, ball.y+h/10, h/1.3, h/3.3);
}
ship ball = new ship();
Particle[] parts = new Particle [1000];
void setup () {
  size(700,700);
  ball.x = 250;
  ball.y = 250;
  restart();
}
void restart() {
  for (int i = 0; i < parts.length; i++)
  parts[i] = new Particle();
 parts[0] = new OddballParticle();
}
void draw() {
background(0);
for (int i = 0; i < parts.length; i++) {
  parts[i].show();
  parts[i].move();
}
spaceShip(Xpos[0]+M[0], 159, 223);
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
    myX = myY = 350;
    myAngle = Math.random()*3*Math.PI;
    mySpeed = Math.random()*10;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void move () {
        myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);

}
void show () {
fill(myColor);
ellipse((float)myX,(float)myY,(float)myAngle,(float)mySpeed);
}
}
class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = myY = 350;
    myAngle = Math.random()*5*Math.PI;
    mySpeed = Math.random()*20+10;
    myColor = color(255,255,255);
  }
  void move()
  {
    myX = myX + (int)(Math.random()*5)-3;
    myY = myY + (int)(Math.random()*5)-3;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY,(float)mySpeed,(float)myAngle);
  }
}
void mousePressed() {
  restart();
}
void mouseDragged() {
  if (pointInCircle(mouseX, mouseY, ball.x, ball.y)) {
    ball.x = mouseX;
    ball.y = mouseY;
  }
}

boolean pointInCircle(float x, float y, float a, float b) {
  if (dist(x, y, a, b) <= 250) {
    return true;
  } else {
    return false;
  }
}
