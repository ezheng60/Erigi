class Waves{
  private ArrayList<Enemy> listE;
  private Map map;
  private PImage spriteGoblin;
  private int spawnTime = 1000;
  private int wave = 1;
  
  public Waves(ArrayList<Enemy> listE, Map map, PImage goblin){
    this.listE = listE;
    this.map = map;
    this.spriteGoblin = goblin;
  }
  
  public void update(){
     int m = millis();
     int countGoblin = 0;
     int countSecond = 0; // keep track of 2nd level enemy
     int countThird = 0; // keep track of 3rd level enemy
     Goblin goblin = new Goblin(map, 100, 100, 10, 20, 5, true, spriteGoblin); //map, HP, maxHP, damage, bounty, speed, alive, sprite
     if (wave == 1 && m > spawnTime){
       listE.add(goblin); 
       spawnTime += 1000;
       countGoblin++;
       println(countGoblin);
       if (countGoblin == 10){
          wave = 2; 
       }
     }
  }
  
}
