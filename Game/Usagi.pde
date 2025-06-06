class Usagi extends Tower{
  private PImage sprite, upgradedSprite, upgraded2Sprite;
  private ArrayList<Food> listFood;
  private PImage foodSprite, upgradedFood;
  
  public Usagi(ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd, ArrayList<Food> listF, PImage sprite, PImage foodSprite, PImage upgradedSprite, PImage upgradedFood, PImage upgraded2Sprite){
    super(listE, cell, cost, damage, range, level, speed, totalcd); // ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd
    this.sprite = sprite;
    this.foodSprite = foodSprite;
    this.upgradedSprite = upgradedSprite;
    this.upgraded2Sprite = upgraded2Sprite;
    this.upgradedFood = upgradedFood;
    this.listFood = listF;
  }
  
  public void build(){
    super.build(sprite);
  }
  
  public void attack(){
    if (this.getcd() > 0) // every frame subtract cd
    {
      this.setcd(this.getcd()-1);
    }
    else
    {
      for (int i = 0; i < getlistE().size(); i++)
      {
        if (this.inRange(getlistE().get(i)))
        {
          listFood.add(new Food(foodSprite, new PVector(getCell().getx() + Block.blockSize/4, getCell().gety() + Block.blockSize/4), // WHATS ADDED SHOULD ALWAYS BE THE SAME AS RADIUS
          getDamage(), getSpeed(), Block.blockSize/4, new PVector(listE.get(i).sPtEnemy().x + Block.blockSize/2, listE.get(i).sPtEnemy().y + Block.blockSize / 2)));
          //PImage sprite, PVector position, int damage, int speed, int radius, PVector enemyPos
          // center of tower MINUS THE RADIUS as initial position and center of first enemy in list as enemyPos
          this.setcd(this.gettcd()); // so like totalCD = 60 would be like one second (60 fps)
          break;
        }
      }
    }
  }
  
  public void foodCheck(){
    for (int i = listFood.size() - 1; i >= 0; i--) //start at back so it's less complicated to remove foods TO NOT SKIP FOODS
    {
      for (int e = 0; e < getlistE().size(); e++)
      {
        if (listFood.get(i).enemyHit(getlistE().get(e).sPtEnemy())){
          listFood.remove(i);
          getlistE().get(e).takeDamage(getDamage());
          getlistE().get(e).checkHealth();
          break;
        }
      }
    } 
  }
  
  public void upgrade(){
    if (super.getLevel() == 1)
    {
      sprite = upgradedSprite;
      foodSprite = upgradedFood;
    }
    if (super.getLevel() == 2)
    {
      sprite = upgraded2Sprite;
      foodSprite = upgradedFood;
    }
    super.upgrade();
  }
}
