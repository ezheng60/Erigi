class Map{
  private Block[][] grid;
  private PVector sPt; // spawning point
  private PVector ePt; // house

  // CHANGE TEMP TO CHANGE MAP; 0 means grass; -1 is start; 1 is path; -2 is house
  int[][] temp = new int[][]{{0, 0, 0, -1, 0, 0, 0, 0, 0, 0}, // 8 rows 10 columns
                             {0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
                             {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
                             {0, 1, 0, 0, 0, 0, 1, 1, 1, 0},
                             {0, 1, 0, 0, 0, 0, 1, 0, 1, 0},
                             {0, 1, 1, 1, 1, 1, 1, 0, 1, 0},
                             {0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
                             {0, 0, 0, 0, 0, 0, 0, 0, 1, -2}}; 
 
 public Map(){
    grid = new Block[height/Block.blockSize][width/Block.blockSize];
    for (int a = 0; a < temp.length; a++){
      for (int b = 0; b < temp[0].length; b++){
        if (temp[a][b] == 0){
            grid[a][b] = new Block(b*Block.blockSize, a*Block.blockSize, false, false);
        }
        else{ // count house and starting point as path and occupied?
          if (temp[a][b] == -1){
            sPt = new PVector(b*Block.blockSize, a*Block.blockSize);
          }
          if (temp[a][b] == -2){ // b is actaulyl the x coord, and a is actually y coord
            ePt = new PVector(b*Block.blockSize, a*Block.blockSize);
          }
          grid[a][b] = new Block(b*Block.blockSize, a*Block.blockSize, true, true);
        }
      }
    }  
 }
 
 public Block[][] grid(){
   return grid; 
 }
 public PVector sPtMap(){
   return sPt; 
 }
 public PVector ePtMap(){
   return ePt; 
 }
 
 public void mapDraw(PGraphics graphics, PImage grass, PImage dirt, PImage house, PImage cave){
   for (Block[] one: grid){ // THIS FUNCTIONS PUTS ALL THE IMAGES DOWN
     for (Block part: one){
       if(!part.getPath()){ // if block isnt path make grass
         graphics.image(grass, part.getx(), part.gety(), Block.blockSize, Block.blockSize);
       }
       else{ // else make dirt
         graphics.image(dirt, part.getx(), part.gety(), Block.blockSize, Block.blockSize); 
       }
     }
   }
   graphics.image(house, ePt.x, ePt.y, Block.blockSize, Block.blockSize); 
   graphics.image(grass, sPt.x, sPt.y, Block.blockSize, Block.blockSize); 
   graphics.image(cave, sPt.x, sPt.y, Block.blockSize, Block.blockSize);  
 }
 
}
