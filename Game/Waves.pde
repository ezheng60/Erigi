class Waves{
  private ArrayList<Enemy> listE;
  private Map map;
  private PImage spriteGoblin, spriteDekatsuyo, spriteMomonga;
  private int timer = 60; // how long each wave lasts
  private int cd = 0;
  private int totalcd = 60;
  private int wave = 1;
  private int count1 = 0; // keep track fo goblin
  private int count2 = 0; // keep track of momonga
  private int count3 = 0; // keep track of dekatsuyo
  private Currency currency;
  private int gHP = 100;
  private int dHP = 500;
  private int mHP = 50;
  
  public Waves(ArrayList<Enemy> listE, Map map, PImage goblin, PImage spriteDekatsuyo, PImage spriteMomonga, Currency currency){
    this.listE = listE;
    this.map = map;
    this.spriteGoblin = goblin;
    this.spriteDekatsuyo = spriteDekatsuyo;
    this.spriteMomonga = spriteMomonga;
    this.currency = currency;
  }
  
  public void update(){
     if (cd > 0){ // umm so right now speed can only be factors of 100
       cd--;
     }
     else{
       Goblin goblin = new Goblin(map, gHP, gHP, 5, 20, 4, true, spriteGoblin); //map, HP, maxHP, damage, bounty, speed, alive, sprite
       Goblin dekatsuyo = new Goblin(map, dHP, dHP, 20, 20, 2, true, spriteDekatsuyo); //map, HP, maxHP, damage, bounty, speed, alive, sprite
       Goblin momonga = new Goblin(map, mHP, mHP, 5, 20, 10, true, spriteMomonga);  //map, HP, maxHP, damage, bounty, speed, alive, sprite
       if (wave == 1){
         listE.add(goblin); 
         count1++;
         if (count1 == 4){
            wave = 2;
            count1 = 0;
         }
       }
       else if (wave == 2){
         listE.add(goblin); 
         count1++;
         if (count1 == 7){
            wave = 3;
            count1 = 0;
         }
       }
       else if (wave == 3){
         if (count1  <= 5){
            listE.add(goblin);
            count1++; 
         }
         else if (count2 <= 3){
            listE.add(momonga);
            count2++;
         }
         if (count2 > 3 && count1 > 5){
            wave = 4;
            count1 = 0;
            count2 = 0;
         }
       }
       else if (wave == 4){
         gHP = 200;
         if (count1 <= 7){
            listE.add(goblin);
            count1++; 
         }
         else if (count2 <= 5){
            listE.add(momonga);
            count2++;
         }
         if (count2 > 5 && count1 > 7){
            wave = 5;
            count1 = 0;
            count2 = 0;
         }
       }
       else if (wave == 5){
         mHP = 150;
         if (count1  <= 5){
            listE.add(goblin);
            count1++; 
         }
         else if (count2 <= 9){
            listE.add(momonga);
            count2++;
         }
         if (count2 > 9 && count1 > 5){
            wave = 6;
            count1 = 0;
            count2 = 0;
         }
       }
       else if (wave == 6){
         if (count1  <= 5){
            listE.add(goblin);
            count1++; 
         }
         else if (count2 <= 12){
            listE.add(momonga);
            count2++;
         }
         else if (count3 <= 1){
            listE.add(dekatsuyo);
            count3++;
         }
         if (count3 > 1 && count2 > 12 && count1 > 5){
            wave = 7;
            count1 = 0;
            count2 = 0;
            count3 = 0;
         }
       }
       else if (wave == 7){
         mHP = 300;
         dHP = 750;
         if (count2 <= 10){
            listE.add(momonga);
            count2++;
         }
         if (count3 <= 3){
            listE.add(dekatsuyo);
            count3++;
         }
         if (count3 > 3 && count2 > 10){
            wave = 8;
            count2 = 0;
            count3 = 0;
         }
       }
       else if (wave == 8){
         if (count2 <= 15){
            listE.add(momonga);
            count2++;
         }
         if (count3 <= 5){
            listE.add(dekatsuyo);
            count3++;
         }
         if (count3 > 5 && count2 > 15){
            wave = 9;
            count2 = 0;
            count3 = 0;
         }
       }
       else if (wave == 9){
         if (count2 <= 10){
            listE.add(momonga);
            count2++;
         }
         if (count3 <= 10){
            listE.add(dekatsuyo);
            count3++;
         }
         if (count3 > 10 && count2 > 10){
            wave = 10;
            count2 = 0;
            count3 = 0;
         }
       }
       else if (wave == 10){
         dHP = 1000;
         if (count3 <= 20){
            listE.add(dekatsuyo);
            count3++;
         }
         if (count3 > 20){
            wave = 11;
            count3 = 0;
         }
       }
       this.cd = totalcd;
       println(wave);
     }
  }
  
  
}
