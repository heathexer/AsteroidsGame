class Asteroid extends Floater {
    int myRotSpeed;
    Asteroid() {
        myCenterX = width/2;
        myCenterY = width/2;
        myColor = 0;
        corners = 6;
        xCorners = new int[] {10, 12, 9, -5, -12, -10};
        yCorners = new int[] {13, -8, -13, -5, 0, 12};
        myRotSpeed = (int)((Math.random()-0.5)*10);
        myDirectionX = (Math.random()-0.5)*10;
        myDirectionY = (Math.random()-0.5)*10;
    }
    public void move() {
        super.move();
        rotate(myRotSpeed);
        if(dist(getX(), getY(), ship.getX(), ship.getY()) < 20) {
            asteroids.remove(this);
        }
    }
    public void setX(int x) {
        myCenterX = x;
    }
    public int getX() {
        return (int)myCenterX;
    }
    public void setY(int y) {
        myCenterY = y;
    }
    public int getY() {
        return (int)myCenterY;
    }
    public void setDirectionX(double x) {
        myDirectionX = x;
    }
    public double getDirectionX() {
        return myDirectionX;
    }
    public void setDirectionY(double y) {
        myDirectionY = y;
    }
    public double getDirectionY() {
        return myDirectionY;
    }
    public void setPointDirection(int degrees) {
        myPointDirection = degrees;
    }
    public double getPointDirection() {
        return myPointDirection;
    }
}
