abstract class Enemy{
  private boolean[][] passed;
  private PVector sPt, mPt, ePt;
  private int speed = 5;
  private int index = 0;
  private PVector[] dir = {new PVector(0, 1), //down
                   new PVector(0, -1), //up
                   new PVector(1, 0), //right
                   new PVector(-1, 0)}; //left

  public Enemy(Map map){
    Block[][] temp = map.grid(); // starting, middle, end point
    sPt = map.sPtMap().copy();
    mPt = map.sPtMap().copy();
    ePt = map.ePtMap().copy();
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
  
  public void move(PImage pic){
    if(sPt.equals(ePt)){ // once enemy reaces house stop
      return; 
    }
    if (sPt.equals(mPt)){
      for (int i = 0; i < dir.length; i++){
        PVector temp = sPt.copy().add(PVector.mult(dir[i], Block.blockSize)); // CHECK SURROUNDING TILES
        temp.x = (int)(constrain(temp.x, 0, 900)); //CONSTRAINS SO THAT INDEX ISNTO UT OF BOUND
        temp.y = (int)(constrain(temp.y, 0, 700)); // this is like height-100
        if (!(passed[(int)temp.y/Block.blockSize][(int)temp.x/Block.blockSize])){ // remmeber Pvectors x is the colums for array
          passed[(int)sPt.y/Block.blockSize][(int)sPt.x/Block.blockSize] = true; // sets startingpoint as unpassable
          mPt = temp; // sets new destination
          index = i; // saves direction of destination
          break;
        }
      }
    }
    ////
    else{
      sPt.add(PVector.mult(dir[index], speed)); // go in the saved direction
    }
    image(pic, sPt.x, sPt.y);
  }
  
}
