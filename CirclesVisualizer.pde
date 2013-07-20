class CirclesVisualizer
{
	int cvWidth,cvHeight;
	RhythmPlayer[] players;
	public  CirclesVisualizer( RhythmPlayer[] players, int width, int height)
	{
		this.players = players;
		this.cvWidth = width;
		this.cvHeight = height;
		
		  
	}


	void draw()
	{
		int xCenter = this.cvWidth/2 ;
		int  yCenter = this.cvHeight/2;
		pushMatrix();
		 translate( xCenter, yCenter );
		drawCircles();
		 popMatrix();
		
	}

	void drawCircles()
	{
		fill(255, 20); //noStroke();
		int xCenter = 0;//width/2 ;
		int  yCenter = 0;//height/2;
		int width = this.cvWidth;
		int height = this.cvHeight;
  		//ellipse( xCenter, yCenter, width* 0.9, height * 0.9);
  		//println("--------");
		for(int i = players.length -1; i >= 0; i--)
		{
			RhythmPlayer currPlayer = players[i];

			ColorScheme cs = colorSchemes[i];
			
			//float mcolor = map(i,0,players.length-1,40,200);

			//println(mcolor);
			int clevel = currPlayer.getCurrentLevel();
			
			//mcolor += 10 * currPlayer.getCurrentLevel();
			fill(cs.getR(),cs.getG(),cs.getB(),100); noStroke();
			//println(mcolor);
				//translate( xCenter,yCenter );
			float currPerc = map(i,0,players.length-1,0.4,0.8);
			//println(currPerc);
  			ellipse( xCenter, yCenter, width * 0.8 * currPerc, 0.8 * height * currPerc);
  			if(currPlayer.isActive())
  			{
  				//println(currPlayer.getPatternLength());
			float d = map(currPlayer.getPointer(), 0, currPlayer.getPatternLength(), 0, radians(360)) - radians(90);
			float dnext = map(currPlayer.getNextPointer(), 0, currPlayer.getPatternLength(), 0, radians(360)) - radians(90);
			
	  			float dx = cos(d)*(width*0.8*currPerc/2);
	 			float dy = sin(d)*(height*0.8*currPerc/2);
	 			float dnextx = cos(dnext)*(width*0.8*currPerc/2);
	 			float dnexty = sin(dnext)*(height*0.8*currPerc/2);

	 			 fill(120, map(i,0,players.length-1,40,200), map(i,0,players.length-1,40,200),map(clevel,0,currPlayer.getMax(),60,250));
	  			 if(clevel ==  currPlayer.getMax())
	  			 {
	  			 	stroke(255, 150);
	  			 }
	  			 else {
	  			 	 noStroke();
	  			 }
	  			
	  			 triangle(dx, dy, xCenter, yCenter,dnextx, dnexty);
	  			   /*line(dx, dy, xCenter, yCenter);
	  			   line(dnextx, dnexty, xCenter, yCenter);
	  			   line(dx, dy,dnextx, dnexty);*/
	  		}
		}
	}
}