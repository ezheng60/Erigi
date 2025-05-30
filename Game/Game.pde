PImage grass, dirt, house, cave, usagi, goblin, chiikawa, hachiware, food, poop;
Map map1;
Waves wave;
PGraphics combineMap;
ArrayList<Tower> listT = new ArrayList<Tower>();
ArrayList<Enemy> listE = new ArrayList<Enemy>();
ArrayList<Food> listF = new ArrayList<Food>();
ArrayList<Poop> listP = new ArrayList<Poop>();
House houseClass;

void setup(){
   size(1000, 800, P2D); // 10 columns, 8 rows
   frameRate(60);
   grass = loadImage("grass.jpg"); 
   dirt = loadImage("dirt.png");
   house = loadImage("house.PNG");
   cave = loadImage("cave.png");
   goblin = loadImage("goblin.PNG");
   goblin.resize(100, 100);
   usagi = loadImage("usagi.png");
   usagi.resize(100, 100);
   food = loadImage("food.png");
   poop = loadImage("poop.PNG");
   hachiware = loadImage("hachiware.png");
   chiikawa = loadImage("chiikawa.png");
   map1 = new Map();
   combineMap = createGraphics(width, height); // this makes all the images into one
   combineMap.beginDraw(); // so that our game doesnt lage
   map1.mapDraw(combineMap, grass, dirt, house, cave);
   combineMap.endDraw();
   wave = new Waves(listE, map1, goblin);
   houseClass = new House(100, map1.ePtMap());
   delay(1000);
}

void draw(){
  image(combineMap, 0, 0);
  mouseCheck();
  wave.update(); // WAVE SYSTEM
  for (Tower part: listT){
    if (part instanceof Usagi){
      ((Usagi)part).build();
      part.attack();
      part.foodCheck();
    }
    if (part instanceof Hachiware){
      ((Hachiware)part).build();
      part.attack();
      part.poopCheck();
    }
    if (part instanceof Chiikawa){
      ((Chiikawa)part).build(chiikawa);
    }
  }
  
  for (int i = listE.size() - 1; i >= 0; i--){
    if (listE.get(i) instanceof Goblin){
      ((Goblin)listE.get(i)).move(); // MOVES GOBLIN
      if (listE.size() > 0)
      {
        listE.get(i).attack(); // WHEN REACH HOUSE DRAIN HOUSE HP
      }
      if (listE.get(i).getAlive() == false)
      {
        listE.remove(i); // REMOVE ENEMIES
      }
    }
  }
  
  for (int i = listF.size()-1; i >= 0; i--){
    listF.get(i).move();
    if ((listF.get(i).position.x + 2 * listF.get(i).radius > width) || (listF.get(i).position.y + 2 * listF.get(i).radius > height) || (listF.get(i).position.x < 0) || (listF.get(i).position.y < 0))
    {
      listF.remove(i); //if food goes outside screen, remove from foodlist
      break;
    }  
  }
  
  for (int i = listP.size()-1; i >= 0; i--){
    listP.get(i).move();
    if ((listP.get(i).position.x + 2 * listP.get(i).radius > width) || (listP.get(i).position.y + 2 * listP.get(i).radius > height) || (listP.get(i).position.x < 0) || (listP.get(i).position.y < 0))
    {
      listP.remove(i); //if food goes outside screen, remove from foodlist
      break;
    }  
  }
  
  houseClass.checkHealth();
  houseClass.healthBar();
  if (houseClass.getAlive() != true)
  {
    exit();
    print("YOU LOST HAHAHHAHAHAH");
  }
}

void mouseCheck(){
  int x = constrain(mouseX, 0, 900)/Block.blockSize;
  int y = constrain(mouseY, 0, 700)/Block.blockSize;
  if (map1.grid[y][x].buildable() && mousePressed){
    if (keyPressed)
    {
      if (key == '1')
      {
        Tower temp = new Usagi(listE, map1.grid[y][x], 10, 10, 150, 1, 2, 60, listF, usagi, food); //listE, cell, cost, damage, range, level, speed, totalcd
        for (Tower part: listT){
           if (part instanceof Chiikawa){
             part.buff(temp);
           }
        }
        listT.add(temp);
      }
      
      if (key == '2')
      {
        Tower temp = new Hachiware(listE, map1.grid[y][x], 10, 10, 150, 1, 5, 60, listP, hachiware, poop); //listE, cell, cost, damage, range, level, speed, totalcd
        for (Tower part: listT){
           if (part instanceof Chiikawa){
             part.buff(temp);
           }
        }
        listT.add(temp);
      }
      if (key == '3')
      {
        Tower temp = new Chiikawa(listE, map1.grid[y][x], 10, 10, 10000, 1, 5, 60, chiikawa, listT); //listE, cell, cost, damage, range, level, speed, totalcd, sprite, listT
        temp.buff(); // ADDING BUFF HERE SO THAT IT DOESNT KEEP LOOPING IN DRAW
        listT.add(temp);
      }
    }
  }
  if (keyPressed){
    if (key == '4'){ //remove towers
      for (int i = listT.size() - 1; i >= 0; i--){
        if ((listT.get(i).getCell().getx() == x*Block.blockSize) && (listT.get(i).getCell().gety() == y*Block.blockSize)){
          listT.get(i).getCell().setOccupied(false);
          if (listT.get(i) instanceof Chiikawa){
            listT.get(i).removeBuff(); 
          }
          listT.remove(i);
          //refund some currency when we implement it
          break;
        }
      }
    }
   }
}
