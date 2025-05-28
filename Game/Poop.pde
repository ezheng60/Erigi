class Poop{
 PImage sprite;
 PVector position;
 PVector v;
 int damage, radius;
 
 public Poop(PImage sprite, PVector position, int damage, int radius, PVector enemyPos){
   this.sprite = sprite;
   this.position = position.copy();
   this.damage = damage;
   this.radius = radius;
   PVector dir = PVector.sub(enemyPos, position); //slope
   float distance = sqrt(dir.x * dir.x + dir.y * dir.y); //distance from initial pt to enemy
   v = new PVector(dir.x / distance, dir.y / distance); //each change in x and change in y becomes a length of 1 unit now
   
 }
 
 public void move(){
   position.add(v);
   image(sprite, position.x - radius, position.y - radius, 2*radius, 2*radius);
 }
 
 public boolean enemyHit(PVector sPt)
 {
   //check if distance between sPt and current food position is less than radius
   if (sqrt((sPt.x + (Block.blockSize / 2) - position.x)*(sPt.x + (Block.blockSize / 2) - position.x) + (sPt.y + (Block.blockSize / 2) - position.y)*(sPt.y + (Block.blockSize / 2) - position.y)) <= radius)
   {
     return true;
   }
   return false;
 }
 
}
