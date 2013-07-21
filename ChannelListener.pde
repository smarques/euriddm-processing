class ChannelListener implements ControlListener
{
	int channel;
	int currBeats, currAccents;

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
		if (theEvent.isGroup()) {
			String c = (theEvent.getGroup().getName().substring(3));
			if(c.equals("generator"))
			{
				this.setGenerator( theEvent );
			}
		}
		else 
		{
			
		
	         String c = (theEvent.getController().getName().substring(3));
	         
	         if(c.equals("mute"))
	         {
	         	this.setMute( theEvent );
	         }
	         if(c.equals("solo"))
	         {
	         	this.setSolo( theEvent );
	         }
	         else if(c.equals("beats"))
	         {
	         	this.setBeats( theEvent );
	         }
	         else if(c.equals("accents"))
	         {
	         	this.setAccents( theEvent );
	         }
	          else if(c.equals("freq"))
	         {
	         	this.setFrequency( theEvent );
	         }
	         else if(c.equals("volume"))
	         {
	         	this.setVolume( theEvent );
	         }
	    }
	}

	public void setVolume(ControlEvent theEvent)
	{
		float v = theEvent.getController().getValue();
		this.getCurrentPlayer().setVolume((int) v);
	}
	public void setGenerator(ControlEvent theEvent)
	{
		
		float v = theEvent.getGroup().getValue();
		this.getCurrentPlayer().setGenerator((int) v);
	}

	public void setFrequency(ControlEvent theEvent)
	{
		this.getCurrentPlayer().setFrequency(theEvent.getController().getValue());
	}

	public void setMute(ControlEvent theEvent)
	{

		int val = (int) theEvent.getController().getValue();

	         	if(val == 1)
         		{
         			println(val);
         			this.getCurrentPlayer().setActive(false);
         		}
	         	else  
	         	{
	         		println(val);
	         		this.getCurrentPlayer().setActive(true);
	         	}
	}


	public void setSolo(ControlEvent theEvent)
	{

		int val = (int) theEvent.getController().getValue();

	         	if(val == 1)
         		{
         			for(int i = 0; i < trackNumber;i++)
         			{
         				players[i].setActive((i == this.channel));
         				if(i!=this.channel)
         				{
         				gui.cp5.getController("ch"+i+"solo").setValue(0);
         				}
         			}
         		}
	         	else  
	         	{
	         		for(int i = 0; i < trackNumber;i++)
         			{
         				if(i!=this.channel && (int)gui.cp5.getController("ch"+i+"solo").getValue()==1)
         				{
         					return;
         				}
         				
         			}
         			for(int i = 0; i < trackNumber;i++)
         			{
         				
         				players[i].setActive((int)gui.cp5.getController("ch"+i+"mute").getValue()==0);
         			}
	         	}
	}
	public void setBeats(ControlEvent theEvent)
	{
		this.updatePattern();
		
	}
	public void setAccents(ControlEvent theEvent)
	{
		this.updatePattern();
		
	}

	public Controller getAccentsController()
	{
		return gui.cp5.getController("ch"+channel+"accents");
	}

	public Controller getBeatsController()
	{
		return gui.cp5.getController("ch"+channel+"beats");
	}

	public void updatePattern()
	{
		int beats = (int) this.getBeatsController().getValue();
		int acc = (int) this.getAccentsController().getValue();
		if (beats == this.currBeats && acc == this.currAccents)
		{
			return;
		}
		this.currBeats = beats;
		this.currAccents = acc;

		if(acc > beats )
		{
			this.getAccentsController().setValue(beats);
		}
		this.getAccentsController().setMax(beats);
		this.getCurrentPlayer().setStructure( new EuclideanPattern(acc,beats).getPattern());
	}




}