PImage grass, dirt, house, cave, usagi, goblin, dekatsuyo, momonga, chiikawa, hachiware, backgroundMenu, 
food, poop, bill, usagi2, chiikawa2, hachiware2, toiletPaper, food2;
Map map1;
Waves wave;
PGraphics combineMap;
PFont font;
ArrayList<Tower> listT = new ArrayList<Tower>();
ArrayList<Enemy> listE = new ArrayList<Enemy>();
ArrayList<Food> listF = new ArrayList<Food>();
ArrayList<Poop> listP = new ArrayList<Poop>();
House houseClass;
Currency currency;
boolean menu, game, gameOver, win;
Menu mainMenu;
Gameover gameover;

void setup(){
   size(1000, 800, P2D); // 10 columns, 8 rows
   frameRate(60);
   backgroundMenu = loadImage("menuBG.jpeg");
   grass = loadImage("grass.jpg"); 
   dirt = loadImage("dirt.png");
   house = loadImage("house.PNG");
   cave = loadImage("cave.png");
   goblin = loadImage("goblin.PNG");
   goblin.resize(100, 100);
   dekatsuyo = loadImage("dekatsuyo.png");
   dekatsuyo.resize(100, 100);
   momonga = loadImage("momonga.png");
   momonga.resize(100, 100);
   usagi = loadImage("usagi.png");
   usagi.resize(100, 100);
   food = loadImage("food.png");
   poop = loadImage("poop.PNG");
   hachiware = loadImage("hachiware.png");
   chiikawa = loadImage("chiikawa.png");
   hachiware2 = loadImage("hachiware2.png");
   chiikawa2 = loadImage("chiikawa2.PNG");
   usagi2 = loadImage("usagi2.png");
   toiletPaper = loadImage("toiletPaper.PNG");
   bill = loadImage("bill.PNG");
   food2 = loadImage("food2.PNG");
   currency = new Currency(100, bill);
   map1 = new Map();
   combineMap = createGraphics(width, height); // this makes all the images into one
   combineMap.beginDraw(); // so that our game doesnt lage
   map1.mapDraw(combineMap, grass, dirt, house, cave);
   combineMap.endDraw();
   wave = new Waves(listE, map1, goblin, dekatsuyo, momonga, currency);
   houseClass = new House(100, map1.ePtMap());
   font = createFont("font.ttf", 100);
   textFont(font);
   menu = true;
   mainMenu = new Menu();
   gameover = new Gameover();
   //PVector position, PVector size, int borderSize, color border, color backgroundOff, color backgroundOn, String text
}

void draw(){
  if (menu){
    mainMenu.menuDraw();
    if (mainMenu.next()){
      menu = false;
      game = true;
    }
  }
  if (gameOver){
    gameover.overDraw(0);
    if (gameover.next()){
      gameOver = false;
      restart();
      game = true;
    }
  }
  if (win){
    gameover.overDraw(1);
    if (gameover.next()){
      win = false;
      restart();
      game = true;
    }
  }
  // BELOW IS GAME
  if (game){
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
        ((Chiikawa)part).build();
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
          if (listE.get(i).isAtHouse() == false)
          {
            currency.addMoney(listE.get(i).getBounty());
          }
          listE.remove(i); // REMOVE ENEMIES
        }
      }
    }
    
    for (int i = listF.size()-1; i >= 0; i--){
      listF.get(i).move();
      if ((listF.get(i).position.x + 2 * listF.get(i).radius > width) || (listF.get(i).position.y + 2 * listF.get(i).radius > height) || (listF.get(i).position.x < 0) || (listF.get(i).position.y < 0))
      {
        listF.remove(i); //if food goes outside screen, remove from foodlist
      }  
    }
    
    for (int i = listP.size()-1; i >= 0; i--){
      listP.get(i).move();
      if ((listP.get(i).position.x + 2 * listP.get(i).radius > width) || (listP.get(i).position.y + 2 * listP.get(i).radius > height) || (listP.get(i).position.x < 0) || (listP.get(i).position.y < 0))
      {
        listP.remove(i); //if food goes outside screen, remove from foodlist
      }  
    }
    
    houseClass.checkHealth();
    houseClass.healthBar();
    currency.drawMoney();
    if (houseClass.getAlive() != true)
    {
      game = false;
      gameOver = true;
    }
    if (wave.getWave() > 10 && listE.size() == 0){
      win = true;
      game = false;
    }
  }
}

void mouseCheck(){
  if (game){
    int x = constrain(mouseX, 0, 900)/Block.blockSize;
    int y = constrain(mouseY, 0, 700)/Block.blockSize;
    if (map1.grid[y][x].buildable() && mousePressed){
      if (keyPressed)
      {
        if (key == '1')
        {
          Tower temp = new Usagi(listE, map1.grid[y][x], 25, 10, 150, 1, 2, 60, listF, usagi, food, usagi2, food2); //listE, cell, cost, damage, range, level, speed, totalcd, listF, sprite, foodSprite, upgradedSprite, upgradedFood
          if (temp.getCost() <= currency.getMoney())
          {
            for (Tower part: listT){
               if (part instanceof Chiikawa){
                 part.buff(temp);
               }
            }
            listT.add(temp);
            currency.removeMoney(temp.getCost());
          }
        }
        
        if (key == '2')
        {
          Tower temp = new Hachiware(listE, map1.grid[y][x], 40, 10, 150, 1, 5, 60, listP, hachiware, poop, hachiware2, toiletPaper); //listE, cell, cost, damage, range, level, speed, totalcd, listP, sprite, upgradedSprite, toiletPaper
          if (temp.getCost() <= currency.getMoney())
          {
            for (Tower part: listT){
               if (part instanceof Chiikawa){
                 part.buff(temp);
               }
            }
            listT.add(temp);
            currency.removeMoney(temp.getCost());
          }
        }
        if (key == '3')
        {
          Tower temp = new Chiikawa(listE, map1.grid[y][x], 80, 10, 10000, 1, 5, 60, chiikawa, listT, chiikawa2); //listE, cell, cost, damage, range, level, speed, totalcd, sprite, listT, upgradedSprite
          if (temp.getCost() <= currency.getMoney())
          {
            temp.buff(); // ADDING BUFF HERE SO THAT IT DOESNT KEEP LOOPING IN DRAW
            listT.add(temp);
            currency.removeMoney(temp.getCost());
          }
        }
      }
    }
    
    if (keyPressed){
      if (key == '5'){ //remove towers
        for (int i = listT.size() - 1; i >= 0; i--){
          if ((listT.get(i).getCell().getx() == x*Block.blockSize) && (listT.get(i).getCell().gety() == y*Block.blockSize)){
            listT.get(i).getCell().setOccupied(false);
            if (listT.get(i) instanceof Chiikawa){
              listT.get(i).removeBuff(); 
            }
            currency.addMoney((int)(0.7*listT.get(i).getCost()));
            listT.remove(i);
            break;
          }
        }
      }
      if (key == '4'){
        for (int i = listT.size() - 1; i >= 0; i--)
        {
          if ((listT.get(i).getCell().getx() == x*Block.blockSize) && (listT.get(i).getCell().gety() == y*Block.blockSize))
          {
            if (listT.get(i).getCost()*1.5 <= currency.getMoney() && listT.get(i).getLevel() < 2) // upgrades cost 1.5x original amount
            {
              listT.get(i).upgrade();
              currency.removeMoney((int)(listT.get(i).getCost()*1.5));
            }
          } 
        }
      }
    }
  }
}

void restart(){
  map1 = new Map();
  listT.clear();
  listE.clear();
  listP.clear();
  listF.clear();
  currency = new Currency(100, bill);
  wave = new Waves(listE, map1, goblin, dekatsuyo, momonga, currency);
  houseClass = new House(100, map1.ePtMap());
}
