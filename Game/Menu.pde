class Menu{
  private Button start;
  private color border = color(176,207,255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(216,225,232);
  private color backgroundOn = color(152,186,213);
  private String text = "Start";
  private String head = "Chiikawa's Awesome Tower Defense Game";
  PImage chiikawa = loadImage("chiikawa.png");

  public Menu(){
    start = new Button(new PVector(300, 400), new PVector(400, 200), 100, 5, border,backgroundOff, backgroundOn, textColor, text);
    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void menuDraw(){
    background(color(249,201,226));
    text(head, 0, 0, 1000, 400);
    image(chiikawa, 0, 300, 300, 300);
    image(chiikawa, 700, 300, 300, 300);
    start.drawButton(); 
    start.isOn();
  }
  
  public boolean next(){
    if (start.clicked()){
      return true; 
    }
    return false;
  }
  
}
