class Food{
 private PImage sprite;
 private PVector position, end;
 int damage, radius;
 
 public Food(PImage sprite, PVector position, PVector end, int damage, int radius){
   this.sprite = sprite;
   this.position = position;
   this.end = end;
   this.damage = damage;
   this.radius = radius;
 }
 
 public void collide(Enemy enemy){
   
 }
 
}
