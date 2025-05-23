class Enemy{
  private boolean[][] passed;
  private PVector sPt, mPt, ePt;
  private int speed = 5;
  private PVector[] dir = {new PVector(0, 1),
                   new PVector(0, -1),
                   new PVector(1, 0),
                   new PVector(-1, 0)};

  public Enemy(Map map){
    Block[][] temp = map.grid();
    sPt = map.sPt().copy();
    mPt = map.sPt().copy();
    ePt = map.ePt().copy();
    passed = new boolean[temp.length][temp[0].length];
    for (int a = 0; a < temp.length; a++){
      for (int b = 0; b < temp[0].length; b++){
        if (temp[a][b].getPath()){
          passed[a][b] = false;
        }
        else{
          passed[a][b] = true;
        }
      }
    }
  }
  
  public void move(){
    PVector sPt1 = sPt.copy(); // THIS IS IN HTE MIDDLE OF SPT AND MPT
    if(sPt.equals(ePt)){
      return; 
    }
    if (sPt.equals(mPt)){
      println("HI");
      for (int i = 0; i < dir.length; i++){
        PVector temp = sPt.copy().add(PVector.mult(dir[i], Block.blockSize));
        temp.x = (int)(constrain(temp.x, 0, 1000)/Block.blockSize);
        temp.y = (int)(constrain(temp.y, 0, 800)/Block.blockSize);
        if (!(passed[(int)temp.y][(int)temp.x])){ // remmeber Pvectors x is the colums for array
          passed[(int)sPt.y/Block.blockSize][(int)sPt.x/Block.blockSize] = true;
          mPt = temp;
          break;
        }
      }
    }
    ////
    else{
      for (int i = 0; i < dir.length; i++){
        PVector temp = sPt.copy().add(PVector.mult(dir[i], Block.blockSize));
        temp.x = (int)(constrain(temp.x, 0, 1000)/Block.blockSize);
        temp.y = (int)(constrain(temp.y, 0, 800)/Block.blockSize);
        if (!(passed[(int)temp.y][(int)temp.x])){ // remmeber Pvectors x is the colums for array
          sPt.add(PVector.mult(dir[i], speed));
          break;
        }
      }
    }

    circle(sPt1.x+Block.blockSize/2, sPt1.y+Block.blockSize/2, 100);
  }
  
}
