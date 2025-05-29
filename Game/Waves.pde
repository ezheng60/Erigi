class Waves{
  private ArrayList<Enemy> listE;
  private Map map;
  private PImage spriteGoblin;
  private int timer = 60; // how long each wave lasts
  private int spawnTime = 1000;
  private int wave = 1;
  private int countGoblin = 0;
  private int countSecond = 0; // keep track of 2nd level enemy
  private int countThird = 0; // keep track of 3rd level enemy
  
  public Waves(ArrayList<Enemy> listE, Map map, PImage goblin){
    this.listE = listE;
    this.map = map;
    this.spriteGoblin = goblin;
  }
  
  public void update(){
     int m = millis();
     Goblin goblin = new Goblin(map, 100, 100, 1, 20, 2, true, spriteGoblin); //map, HP, maxHP, damage, bounty, speed, alive, sprite
     if (m > spawnTime){ // umm so right now speed can only be factors of 100
       if (wave == 1){
         listE.add(goblin); 
         countGoblin++;
         if (countGoblin == 5){
            //wave = 2;
            wave = 0;
            countGoblin = 0;
         }
       }
       else if (wave == 2){
         listE.add(goblin); 
         countGoblin++;
         if (countGoblin == 15){
            wave = 3;
            countGoblin = 0;
         }
       }
       spawnTime += 1000;
     }
  }
  
}
