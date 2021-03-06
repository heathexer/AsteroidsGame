SpaceShip ship;
Stars stars;
ArrayList asteroids, bullets;
public void setup() {
  ship = new SpaceShip();
  stars = new Stars();
  asteroids = new ArrayList();
  bullets = new ArrayList();
  for(int i = 0; i < 10; i++) {
      asteroids.add(new Asteroid());
  }
  size(800, 800);
}
public void draw() {
  background(255);
  stars.show();
  ship.move();
  ship.show();
  if(asteroids.size() > 0) for(int i = 0; i < asteroids.size(); i++) {
     Asteroid tempA = (Asteroid)asteroids.get(i);
     if(bullets.size() > 0) for(int j = 0; j < bullets.size(); j++) {
        Bullet tempB = (Bullet)bullets.get(j);
        if(dist(tempA.getX(), tempA.getY(), tempB.getX(), tempB.getY()) < 15) {
            bullets.remove(tempB);
            asteroids.remove(tempA);
        }
     }
     tempA.move();
     tempA.show();
  }
  if(bullets.size() > 0) for(int i = 0; i < bullets.size(); i++) {
     Bullet temp = (Bullet)bullets.get(i);
     temp.move();
     temp.show();
  }
}

public void keyPressed() {
  if(key == 'a') {
    ship.rotating = -5;
  }
  if(key == 'd') {
    ship.rotating = 5;
  }
  if(key == 'w') {
    ship.accelerating = true;
  }
  if(key == ' ') {
      bullets.add(new Bullet(ship));
  }
}
public void keyReleased() {
  if(key == 'a') {
    ship.rotating = 0;
  }
  if(key == 'd') {
    ship.rotating = 0;
  }
  if(key == 'w') {
    ship.accelerating = false;
  }
}

class Stars {
  int[] x, y;
  Stars() {
    int length = (int)(Math.random()*100+50);
    x = new int[length];
    y = new int[length];
    for(int i = 0; i < x.length; i++) {
      x[i] = (int)(Math.random()*800);
      y[i] = (int)(Math.random()*800);
    }
  }
  void show() {
    for(int i = 0; i < x.length; i++) {
      ellipse(x[i], y[i], 3, 3);
    }
  }
}
class SpaceShip extends Floater {
  boolean accelerating;
  int rotating;
  SpaceShip() {
    myColor = 0;
    corners = 3;
    xCorners = new int[] {-10, 10, -10};
    yCorners = new int[] {-6, 0, 6};
    accelerating = false;
    rotating = 0;
  }
  public void move() {
    super.move();
    rotate(rotating);
    if(accelerating) accelerate(.2);
    if(myDirectionX > 10) myDirectionX = 10;
    if(myDirectionX < -10) myDirectionX = -10;
    if(myDirectionY > 10) myDirectionY = 10;
    if(myDirectionY < -10) myDirectionY = -10;
  }
  public void setX(int x) {
    myCenterX = x;
  };
  public int getX() {
    return (int)myCenterX;
  };
  public void setY(int y) {
    myCenterY = y;
  };
  public int getY() {
    return (int)myCenterY;
  };
  public void setDirectionX(double x) {

  };
  public double getDirectionX() {
    return myDirectionX;
  };
  public void setDirectionY(double y) {

  };
  public double getDirectionY() {
    return myDirectionY;
  };
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  };
  public double getPointDirection() {
    return myPointDirection;
  };
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class
{
  protected int corners;  //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void rotate (int nDegreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
  }
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;

    //wrap around screen
    if(myCenterX >width)
    {
      myCenterX = 0;
    }
    else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if(myCenterY >height)
    {
      myCenterY = 0;
    }
    else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show ()  //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);
    //convert degrees to radians for sin and cos
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for(int nI = 0; nI < corners; nI++)
    {
      //rotate and translate the coordinates of the floater using current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated,yRotatedTranslated);
    }
    endShape(CLOSE);
  }
}
