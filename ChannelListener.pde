class ChannelListener implements ControlListener
{
	int channel;
	public ChannelListener(int channel)
	{
		this.channel = channel;

	}
	public RhythmPlayer getCurrentPlayer()
    {
  	return players[this.channel];
    }
	public void controlEvent(ControlEvent theEvent) 
	{   
	         String c = (theEvent.getController().getName().substring(3));
	         
	         if(c.equals("play"))
	         {
	         	int val = (int) theEvent.getController().getValue();
	         	if(val == 1)
         		{
         			this.getCurrentPlayer().setActive(true);
         		}
	         	else  
	         	{
	         		this.getCurrentPlayer().setActive(false);
	         	}
	         }
	}
}