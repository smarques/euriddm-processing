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
	public static final int NOISE = 1;
	public static final int SINE = 2;
	public static final int SAW = 3;
	public static final int TRIANGLE = 5;
	public static final int SQUARE = 4;
    int generator;
    int volume = 100;
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
	public RhythmPlayer()
	{

	}
	public void setGenerator(int g)
	{
		this.generator = g;
	}
	public void setVolume(int v)
	{
		this.volume = v;
	}
	public void setFrequency(float freq)
	{
		this.freq = freq;
	}

	public Buffer getBuffer()
	{
		if(this.generator == this.SINE)
		{
			return Buffer.SINE;
		}
		if(this.generator == this.SQUARE)
		{
			return Buffer.SQUARE;
		}
		if(this.generator == this.SAW)
		{
			return Buffer.SAW;
		}
		if(this.generator == this.NOISE)
		{
			return Buffer.NOISE;
		}
		if(this.generator == this.TRIANGLE)
		{
			return Buffer.TRIANGLE;
		}
		
		return Buffer.SINE;
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
	     float theVolume = volume * 0.3 / 100;
	     
		 Buffer buf = this.getBuffer();
         WavePlayer wp = new WavePlayer(audioContext, this.freq , buf);
          Gain g = new Gain(audioContext, 1, new Envelope(audioContext,theVolume * percLevel));
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