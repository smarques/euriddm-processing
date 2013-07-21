


import java.util.Arrays;

import beads.*;


ColorScheme[] colorSchemes;
BeatKeeper beatKeeper;
RhythmPlayer[] players;
int trackNumber = 3;
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

 

  RhythmPlayer player1 = new RhythmPlayer();
  player1.setFrequency(3500);
  RhythmPlayer player2 = new RhythmPlayer();
   player2.setFrequency(5000);
  RhythmPlayer player3 = new RhythmPlayer();
   player3.setFrequency(1200);
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
  gui.keyPressed(keyCode);
  
}



