class Usagi extends Tower{
  private PImage sprite;
  
  public Usagi(ArrayList<Enemy> listE, Block cell, int cost, int damage, int attackSpeed, int range, int level, PImage sprite){
    super(listE, cell, cost, damage, attackSpeed, range, level);
    this.sprite = sprite;
  }
  
  public void build(){
    super.build(sprite);
  }
  
}
