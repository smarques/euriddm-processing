import controlP5.*;

public class Gui
{

	ControlP5 cp5;
	Knob knobBpm;
    PApplet mainApp;

	public Gui(PApplet p)
	{
        mainApp = p;
		cp5 = new ControlP5(p);
		 this.addControls();
	}

	public void addControls()
	{

	knobBpm = cp5.addKnob("BPM")
               .setRange(30,220)
               .setValue(90)
               .setPosition(320,70)
               .setRadius(30)
               .setDragDirection(Knob.VERTICAL)
               ;
    cp5.getController("BPM").addListener(new BpmListener(this.mainApp));
    ChannelListener ch1Listener = new ChannelListener(0);
    Group g1 = cp5.addGroup("ch1")
                .setPosition(10,10)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(colorSchemes[0].getR(),colorSchemes[0].getG(),colorSchemes[0].getB(),50))
                .setColorBackground(color(colorSchemes[0].getR(),colorSchemes[0].getG(),colorSchemes[0].getB(),150))
                .setColorActive(color(colorSchemes[0].getR(),colorSchemes[0].getG(),colorSchemes[0].getB(),250))
                .close()
                ;
    cp5.addToggle("ch1play")
     .setPosition(15,15)
     .setSize(10,10).setValue(true).setCaptionLabel("PLAY")
     .setGroup(g1).addListener(ch1Listener);
     ;
     cp5.addNumberbox("ch1beats")
     .setPosition(15,50)
     .setSize(50,14).setDecimalPrecision(0)
     .setScrollSensitivity(1.1).setRange(1,10).setCaptionLabel("ACCENTS")
     .setValue(10).setGroup(g1)
     ;

   Group g2 = cp5.addGroup("ch2")
                .setPosition(110,10)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(colorSchemes[1].getR(),colorSchemes[1].getG(),colorSchemes[1].getB(),50))
                .setColorBackground(color(colorSchemes[1].getR(),colorSchemes[1].getG(),colorSchemes[1].getB(),150))
                .setColorActive(color(colorSchemes[1].getR(),colorSchemes[1].getG(),colorSchemes[1].getB(),250))
                .close()
                ;
    ChannelListener ch2Listener = new ChannelListener(1);
    cp5.addToggle("ch2play")
     .setPosition(15,15)
     .setSize(10,10).setValue(true).setCaptionLabel("PLAY")
     .setGroup(g2).addListener(ch2Listener)
     ;

     Group g3 = cp5.addGroup("ch3")
                .setPosition(210,10)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(colorSchemes[2].getR(),colorSchemes[2].getG(),colorSchemes[2].getB(),50))
                .setColorBackground(color(colorSchemes[2].getR(),colorSchemes[2].getG(),colorSchemes[2].getB(),150))
                .setColorActive(color(colorSchemes[2].getR(),colorSchemes[2].getG(),colorSchemes[2].getB(),250))
                .close()
                ;
    ChannelListener ch3Listener = new ChannelListener(2);
    cp5.addToggle("ch3play")
     .setPosition(15,15)
     .setSize(10,10).setValue(true).setCaptionLabel("PLAY")
     .setGroup(g3).addListener(ch3Listener)
     ;
	}


}


