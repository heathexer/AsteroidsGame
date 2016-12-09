class Bullet extends Floater {
    Bullet(SpaceShip ship) {
        myCenterX = ship.getX();
        myCenterY = ship.getY();
        myPointDirection = ship.getPointDirection();
        myDirectionX = 5 * Math.cos(radians((float)ship.getPointDirection())) + ship.getDirectionX();
        myDirectionY = 5 * Math.sin(radians((float)ship.getPointDirection())) + ship.getDirectionY();
    }
    void show() {
        ellipse(getX(), getY(), 3, 3);
    }
    void move() {

        if(myCenterX > width ||
            myCenterX < 0 ||
            myCenterY > height ||
            myCenterY < 0) {
                bullets.remove(this);
        } else {
            myCenterX += myDirectionX;
            myCenterY += myDirectionY;
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
