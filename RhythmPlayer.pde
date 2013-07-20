//import ddf.minim.*;
//import ddf.minim.ugens.*;

public class RhythmPlayer  extends Pattern implements BeatClient
{
	//AudioPlayer player;
	BeatKeeper beatKeeper;
	//AudioSample kick;
	boolean active = true;
	float freq;
	int currentLevel;

	//Minim minim;
	//AudioOutput out;

	//Sampler     kick;
	public RhythmPlayer(int[] pattern, float freq )
	{
		 this.Pattern(pattern);
		 this.freq = freq;
	}
	public RhythmPlayer(int[] pattern)
	{
		 this.Pattern(pattern);
		 this.freq = 3000;
	}

	public void beat()
	{
		
		 if(!this.active)
		 {
		 	return;
		 }
	     currentLevel= this.advance();
	   
	     if(true || currentLevel > 0)
	     {
	     	  //println(level + "/" + this.getMax());
	     float percLevel =(float)currentLevel/(float)this.getMax();
	     //println(percLevel);
	     
		/* WavePlayer wp = new WavePlayer(audioContext, (float)Math.random() * 3000 + 100, Buffer.SINE);
          Gain g = new Gain(audioContext, 1, new Envelope(audioContext, 0.05));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          audioContext.out.addInput(g);	*/

         WavePlayer wp = new WavePlayer(audioContext, this.freq * ( 1 - percLevel) + 500, Buffer.NOISE );
          Gain g = new Gain(audioContext, 1, new Envelope(audioContext, 0.05 * percLevel));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          audioContext.out.addInput(g);
      	}
		
		
	}

	public void registerBeatKeeper(BeatKeeper bk )
	{
		this.beatKeeper = bk;
	}
	public int getCurrentLevel()
	{
		return this.currentLevel;
	}

	public void setActive(boolean b )
	{
		this.active = b;
		
	}
	public boolean isActive()
	{
		return this.active;
	}
}