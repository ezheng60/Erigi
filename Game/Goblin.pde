class Goblin extends Enemy{
  private PImage sprite;
  
  public Goblin(Map map, PImage sprite){
    super(map); 
    this.sprite = sprite;
  }
  
  public void move(){
    super.move(sprite);
  }
  
}
