

public class BeatKeeper extends Bead
{
	/*protected int bpm = 60;
	int tempo = 1000; // how long a sixteenth note is in milliseconds
	int clock; // the timer for moving from note to note
	long previousTime;
    boolean isActive=true;*/
    float interval;

	ArrayList<BeatClient> clients;
	
	Clock clock;


	public  BeatKeeper (int bpm)
	{
		
		 interval = 1000.0 / (bpm * 4/ 60.0); 
    	 clock = new Clock(audioContext, interval);
		clock.setClick(false);
		 clock.addMessageListener(this);
		 audioContext.out.addDependent(clock);
 		
		this.clients = new ArrayList<BeatClient>(); 
		
	}

	public void setBpm(int bpm)
	{
		 interval = 1000.0 / (bpm * 4/ 60.0); 
		 clock.getIntervalEnvelope().setValue(interval);
	}

	public void registerClient( BeatClient bc )
	{
		//print(this.clients);
		this.clients.add(bc);
		bc.registerBeatKeeper(this);
	}

	public void sendBeat()
	{
		for(int i = 0; i < this.clients.size(); i++)
		{
			this.clients.get(i).beat();
		}
	}

	public void messageReceived(Bead message) {
        Clock c = (Clock)message;
        if(c.isBeat()) {
          this.sendBeat();
       }
     }

}