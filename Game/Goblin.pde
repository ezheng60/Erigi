class Goblin extends Enemy{
  private PImage sprite;
  
  public Goblin(Map map, int HP, int maxHP, int damage, int bounty, int speed, boolean alive, PImage sprite){
    super(map, HP, maxHP, damage, bounty, speed, alive); 
    this.sprite = sprite;
  }
  
  public void move(){
    super.move(sprite);
  }
  
  public PImage getSprite(){
    return sprite;
  }
}
