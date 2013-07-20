class BpmListener implements ControlListener 
{

  PApplet mainApp;
  public BpmListener(PApplet p)
  {
    mainApp = p;
  }
  
  
  public void controlEvent(ControlEvent theEvent) 
  {   
          beatKeeper.setBpm((int) theEvent.getController().getValue());
  }
}