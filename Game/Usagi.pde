class Usagi extends Tower{
  private PImage sprite;
  private ArrayList<Food> listFood;
  private PImage foodSprite;
  private int cd;
  private int totalCD;
  
  public Usagi(ArrayList<Enemy> listE, Block cell, int cost, int damage, int attackSpeed, int range, int level, PImage sprite, PImage foodSprite, int totalCD){
    super(listE, cell, cost, damage, attackSpeed, range, level);
    this.sprite = sprite;
    this.foodSprite = foodSprite;
    this.listFood = new ArrayList<Food>();
    this.totalCD = totalCD;
    cd = 0;
  }
  
  public void build(){
    super.build(sprite);
  }
  
  public void attack(){
    print(cd);
    if (cd > 0)
    {
      cd--;
    }
    else
    {
      for (int i = 0; i < super.listE.size(); i++)
      {
        if (this.inRange(super.listE.get(i)))
        {
          listFood.add(new Food(foodSprite, 
          new PVector(super.cell.getx()+ Block.blockSize / 2, super.cell.gety() + Block.blockSize / 2),
          super.damage,
          Block.blockSize / 4,
          new PVector(listE.get(i).sPtEnemy().x + Block.blockSize / 2, listE.get(i).sPtEnemy().y + Block.blockSize / 2)));
          // center of tower as initial position and center of first enemy in list as enemyPos
          cd = totalCD;
          break;
        }
      }
    }
  }
  
  public void foodCheck(){
    for (int i = listFood.size() - 1; i >= 0; i--) //start at back so it's less complicated to remove foods
    {
      listFood.get(i).move();
      for (int e = 0; e < super.listE.size(); e++)
      {
        if (listFood.get(i).enemyHit(super.listE.get(e).sPtEnemy()))
        {
          listFood.remove(i);
          //add enemies taking dmg here
          break;
        }
        if ((listFood.get(i).position.x > width) || (listFood.get(i).position.y > height) || (listFood.get(i).position.x < 0) || (listFood.get(i).position.y < 0))
        {
          //if food goes outside screen, remove from foodlist
          listFood.remove(i);
          break;
        }
      }
    } 
  }
}
