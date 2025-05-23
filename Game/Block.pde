class Block{
  private int x, y;
  private boolean path;
  private boolean occupied;
  static final int blockSize = 100; // hardcode
  
  public Block(int x, int y, boolean path, boolean occupied){
    this.x = x;
    this.y = y;
    this.path = path;
    this.occupied = occupied;
  }
  
  public int getx(){
    return x;
  }
  public int gety(){
    return y;
  }
  
  public boolean getPath(){
    return path;
  }
  public void setPath(boolean path){
    this.path = path;
  }
  public boolean getOccupied(){
    return occupied;
  }
  public void setOccupied(boolean occupied){
    this.occupied = occupied;
  }
}
