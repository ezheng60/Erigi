public abstract class Tower{
  private float damage, speed, initialCost, range, x, y;
  
  public float getDamage(){
    return damage;
  }
  public void setDamage(float x){
    damage = x;
  }

  public float getSpeed(){
    return speed;
  }
  public void setSpeed(float x){
    speed = x;
  }
  
  public float getRange(){
    return range;
  }
  public void setRange(float x){
    range = x;
  }
  
  public float getInitial(){
    return initialCost;
  }
  
}
