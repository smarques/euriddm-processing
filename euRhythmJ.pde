


import java.util.Arrays;

import beads.*;


ColorScheme[] colorSchemes;
BeatKeeper beatKeeper;
RhythmPlayer[] players;
AudioContext audioContext;
CirclesVisualizer circleVisualizer; 
Gui gui; 

void setup()
{
  audioContext = new AudioContext();
  size(400, 600);
    smooth();
  frameRate(60);
 
 
  
  //frameRate(99999);
  beatKeeper = new BeatKeeper(90);

  //beatKeeper.setBpm(120);
 //  maxim = new Maxim(this);
  //EuclideanPattern euclides = new EuclideanPattern(7,10);
  EuclideanPattern euclides2 = new EuclideanPattern(2,5);
  EuclideanPattern euclides3 = new EuclideanPattern(3,7);


  

  RhythmPlayer player1 = new RhythmPlayer(new EuclideanPattern(7,10).getPattern(),3500);
  RhythmPlayer player2 = new RhythmPlayer(euclides2.getPattern(),5000);
  RhythmPlayer player3 = new RhythmPlayer(euclides3.getPattern(),1200);
  //players = new RhythmPlayer[];
  RhythmPlayer[] players = {player1, player2, player3 };
  this.players = players;
//players[0].setActive(false);
  beatKeeper.registerClient(player1);
  beatKeeper.registerClient(player2);
  beatKeeper.registerClient(player3);
  //audioContext.start();
  this.circleVisualizer = new CirclesVisualizer(players,400,400 );

  ColorScheme[] colorSchemes = {new ColorScheme(255,50,160),new ColorScheme(50,200,70),new ColorScheme(80,220,220)};
  this.colorSchemes = colorSchemes;
 
  gui = new Gui(this);
 

}



void draw()
{
  background(0);
 /*int xCenter = width/2 ;
		int  yCenter = height/2;
		pushMatrix();
		 translate( xCenter, yCenter );*/
		 circleVisualizer.draw();
		/* popMatrix();*/
 
  
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

void keyPressed() {
  switch(keyCode){
  	case 32:
  		if(audioContext.isRunning())
  		{audioContext.stop();}
  		else{
  			audioContext.start();
  		}
  		
  	break;
  }
}



