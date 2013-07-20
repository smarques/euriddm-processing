class Pattern
{
	int[] structure;
	int max;
	int pointer = 0;

	public void Pattern(int[] structure)
	{
		this.structure = structure;
		int locmax = 0;
		for(int i = 0; i <  structure.length; i++)
		{
			if(structure[i] > locmax)
			{
				locmax = structure[i];
			}

		}
		this.max = locmax;
	}

	public int[] getPattern()
	{
		return this.structure;
	}

	public int getPointer()
	{
		return this.pointer;
	}

	public int getNextPointer()
	{
		if(this.pointer == this.structure.length - 1)
		{
			return 0;
		}
		return this.pointer + 1;
	}

	public int getPatternLength()
	{
		return this.structure.length;
	}


	public int getMax()
	{
		return this.max;
	}

	public int advance()
	{
		this.pointer ++;
		if(this.pointer >= this.structure.length)
		{
			this.pointer = 0;
		}

		return this.structure[this.pointer];
	}
}