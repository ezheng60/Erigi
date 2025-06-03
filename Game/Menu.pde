class Menu{
  private Button start, rules;
  private color border = color(176,207,255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(216,225,232);
  private color backgroundOn = color(152,186,213);
  private String text = "Play";
  private String head = "Chiikawa's Awesome Tower Defense";
  PImage chiikawa = loadImage("chiikawa.png");
  PImage background = loadImage("menuBG.PNG");

  public Menu(){
    start = new Button(new PVector(50, 300), new PVector(300, 100), 75, 5, border,backgroundOff, backgroundOn, textColor, text);
    rules = new Button(new PVector(50, 450), new PVector(300, 100), 75, 5, border,backgroundOff, backgroundOn, textColor, "Rules");
    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void menuDraw(){
    background(background);
    textAlign(LEFT);
    text(head, 50, 50, 1000, 400);
    image(chiikawa, 425, 125, 500, 500);
    rules.drawButton();
    rules.isOn();
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
