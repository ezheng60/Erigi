class Chiikawa extends Tower{
  private PImage sprite, upgradedSprite, upgraded2Sprite;
  private ArrayList<Tower> listT;
  
  public Chiikawa(ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd, PImage sprite, ArrayList<Tower> listT, PImage upgradedSprite, PImage upgraded2Sprite){
    super(listE, cell, cost, damage, range, level, speed, totalcd); // ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd
    this.sprite = sprite;
    this.upgradedSprite = upgradedSprite;
    this.upgraded2Sprite = upgraded2Sprite;
    this.listT = listT;
  }
  
  public void build(){
    super.build(sprite);
  }
  
  public boolean inRange(Tower tower){
    if (PVector.dist(new PVector(this.getCell().getx(), this.getCell().gety()), new PVector(tower.getCell().getx(), tower.getCell().gety())) < this.getRange()){
      return true;
    }
    return false;
  }
  
  public void buff(){
    for (Tower tower: listT){
      if (!(tower instanceof Chiikawa) && inRange(tower)){
        tower.setRange(tower.getRange()+this.getRange());
        tower.setDamage(tower.getDamage()+this.getDamage());
        tower.setSpeed(tower.getSpeed()+this.getSpeed());
      } 
    }
  }
  
  public void buff(Tower tower){
    if (!(tower instanceof Chiikawa) && inRange(tower)){
      tower.setRange(tower.getRange()+this.getRange());
      tower.setDamage(tower.getDamage()+this.getDamage());
      tower.setSpeed(tower.getSpeed()+this.getSpeed());
    } 
  }
  
  public void removeBuff(){
    for (Tower tower: listT){
      if (!(tower instanceof Chiikawa) && inRange(tower)){
        tower.setRange(tower.getRange()-this.getRange());
        tower.setDamage(tower.getDamage()-this.getDamage());
        tower.setSpeed(tower.getSpeed()-this.getSpeed());
      } 
    }
  }
  
  public void upgrade(){
    if (super.getLevel() == 1)
    {
      sprite = upgradedSprite;
    }
    if (super.getLevel() == 2)
    {
      sprite = upgraded2Sprite;
    }
    super.upgrade();
  }
  
  public PImage getSprite(){
    return sprite;
  }
  
  
  
}
