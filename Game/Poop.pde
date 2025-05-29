class Poop{
 private PImage sprite;
 private PVector position;
 private PVector v;
 private int damage, speed, radius;
 
 public Poop(PImage sprite, PVector position, int damage, int speed, int radius, PVector enemyPos){
   this.sprite = sprite;
   this.position = position.copy();
   this.damage = damage;
   this.speed = speed;
   this.radius = radius;
   PVector dir = PVector.sub(enemyPos, position); //slope
   float distance = sqrt(dir.x * dir.x + dir.y * dir.y); //distance from initial pt to enemy
   v = new PVector(dir.x / distance, dir.y / distance); // NORMALiZES VECTOR TO ONE 
   v.mult(speed);
 }
 
 public void move(){
   position.add(v);
   square(position.x, position.y, 50);   
   image(sprite, position.x, position.y, 2*radius, 2*radius);
 }
 
 public boolean enemyHit(PVector sPt){ // TAKES SPT OF THE ENEMY
   //check if distance between sPt and current food position is less than radius
   PVector distance = new PVector(abs((position.x + radius)-(sPt.x+Block.blockSize/2)),
                                  abs((position.y + radius)-(sPt.y+Block.blockSize/2))); // THIS IS TO CENTER THE HITBOXES OF THE PROJECTILE AND ENEMY
   //if (distance.x < (radius+Block.blockSize/2) && distance.y < (radius+Block.blockSize/2)) THIS IS TO CHECK FOR INTERSECTION OF THE HITBOXES 
   if (distance.x < (Block.blockSize/2) && distance.y < (Block.blockSize/2)) // ENDED UP USING THIS BC THE HITBOX FOR GOLBIN IS WAY LARGER BC OF IMAGE 
   {
     return true;
   }
   return false;
 }
 
}
