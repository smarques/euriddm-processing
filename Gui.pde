import controlP5.*;

public class Gui implements ControlListener 
{

	ControlP5 cp5;
	Knob knobBpm;
    PApplet mainApp;
    int maxBeats = 16;
    int bpmMin = 20;
    int bpmMax = 240;
    int freqMin = 30;
    int freqMax = 3000;
	public Gui(PApplet p)
	{
        mainApp = p;
		cp5 = new ControlP5(p);
		 this.addControls();
	}

	public void addControls()
	{

	knobBpm = cp5.addKnob("BPM")
               .setRange(this.bpmMin,this.bpmMax)
               .setValue(90)
               .setPosition(320,330)
               .setRadius(30)
               .setDragDirection(Knob.VERTICAL).setDecimalPrecision(0)
               ;
    cp5.addBang("randomize")
     .setPosition(20, 375)
     .setSize(15, 15)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("randomize!")
     ;
     cp5.addToggle("play")
     .setPosition(80, 375)
     .setSize(15, 15)
     .setLabel("play [spacebar]").addListener(this)
     ;
    
    cp5.getController("BPM").addListener(new BpmListener(this.mainApp));
    cp5.getController("randomize").addListener(this);
    for(int track = 0; track < trackNumber; track++)
        {
            this.addTrackControls(track);
        }
    
    }
    
    public void addTrackControls(int track)
    {
        int oneBasedIndex = track + 1;
        int controlsWidth = 80;
        int controlsLeftMargin = 5;
        ChannelListener chListener = new ChannelListener(track);
        Group g = cp5.addGroup("ch"+track)
                .setPosition(10 + 100*track,10)
                .setBackgroundHeight(300)
                .setBackgroundColor(color(colorSchemes[track].getR(),colorSchemes[track].getG(),colorSchemes[track].getB(),50))
                .setColorBackground(color(colorSchemes[track].getR(),colorSchemes[track].getG(),colorSchemes[track].getB(),150))
                .setColorActive(color(colorSchemes[track].getR(),colorSchemes[track].getG(),colorSchemes[track].getB(),250))
                .close().setCaptionLabel("CH"+oneBasedIndex);
                ;
        cp5.addToggle("ch"+track+"mute")
         .setPosition(controlsLeftMargin,15)
         .setSize(10,10).setValue(false).setCaptionLabel("mute")
         .setGroup(g).addListener(chListener)
         ;

         cp5.addToggle("ch"+track+"solo")
         .setPosition(controlsLeftMargin+45,15)
         .setSize(10,10).setValue(false).setCaptionLabel("solo")
         .setGroup(g).addListener(chListener)
         ;
        //random initial values
        int randomBeat = (int)random(3,maxBeats) ;

        int randomAcc = (int)random(1,randomBeat -1 ) ;
        cp5.addNumberbox("ch"+track+"beats")
             .setPosition(controlsLeftMargin,90)
             .setSize(controlsWidth,14).setDecimalPrecision(0)
             .setScrollSensitivity(0).setRange(1,maxBeats).setCaptionLabel("BEATS")
             .setValue(randomBeat).setGroup(g).addListener(chListener)
             ;
        cp5.addNumberbox("ch"+track+"accents")
             .setPosition(controlsLeftMargin,50)
             .setSize(controlsWidth,14).setDecimalPrecision(0)
             .setScrollSensitivity(0).setRange(1,maxBeats).setCaptionLabel("ACCENTS")
             .setValue(randomAcc).setGroup(g).addListener(chListener)
             ;
       
        players[track].setStructure( new EuclideanPattern(randomAcc,randomBeat).getPattern());

        cp5.addKnob("ch"+track+"volume")
               .setRange(0,100)
               .setValue(50).setGroup(g).addListener(chListener)
               .setPosition(controlsLeftMargin+20,230)
               .setRadius(20).setCaptionLabel("volume")
               .setDragDirection(Knob.VERTICAL).setDecimalPrecision(0)
               ;

        int randomFreq = (int)random(100,5000);
        cp5.addKnob("ch"+track+"freq")
               .setRange(this.freqMin,this.freqMax)
               .setValue(randomFreq).setGroup(g).addListener(chListener)
               .setPosition(controlsLeftMargin+20,130)
               .setRadius(20).setCaptionLabel("freq")
               .setDragDirection(Knob.VERTICAL).setDecimalPrecision(0)
               ;
        players[track].setFrequency(randomFreq);
        DropdownList dl = cp5.addDropdownList("ch"+track+"generator")
          .setPosition(controlsLeftMargin, 210).setGroup(g).addListener(chListener)
          .setWidth(controlsWidth).setCaptionLabel("SOUND")
          
          ;
        dl.addItem("NOISE", RhythmPlayer.NOISE);
        dl.addItem("SINE", RhythmPlayer.SINE);
        dl.addItem("SAW", RhythmPlayer.SAW);
        dl.addItem("SQUARE", RhythmPlayer.SQUARE);
        dl.setIndex(1);

         
        
    }

public void controlEvent(ControlEvent theEvent) 
    {   
        String c = (theEvent.getController().getName());
        if(c.equals("randomize"))
        {
          this.randomizePars();
        }
        else if( c.equals("play") )
        {
            if(audioContext.isRunning())
            {
                audioContext.stop();
            }
            else{
                audioContext.start();
            }
        }
    }

public void randomizePars()
      {

         int randomBpm = (int)random(this.bpmMin,this.bpmMax) ;
         cp5.getController("BPM").setValue(randomBpm);
        for(int track = 0; track < trackNumber; track++)
        {
            //create a random pattern
            int randomBeat = (int)random(3,maxBeats) ;
            int randomAcc = (int)random(1,randomBeat -1 ) ;
            cp5.getController("ch"+track+"beats").setValue(randomBeat);
            cp5.getController("ch"+track+"accents").setValue(randomAcc);
            cp5.getController("ch"+track+"volume").setValue((int)random(100));
            cp5.getController("ch"+track+"freq").setValue((int)random(this.freqMin,this.freqMax));
            DropdownList dl = (DropdownList)cp5.getGroup("ch"+track+"generator");
            int gen = (int)random(1,4);
            dl.setValue(gen);
            players[track].setGenerator(gen);
        }

            
      }

    public void keyPressed(int keyCode) {
         //println(keyCode);
      switch(keyCode){
        case 82://r
           this.randomizePars();break;
        case 32:
            Toggle play = (Toggle)cp5.getController("play");
            play.toggle();
            
            
        break;
       
      }
    }

}


