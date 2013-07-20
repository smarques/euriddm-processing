public interface BeatClient
{
	public void beat();
	public void registerBeatKeeper( BeatKeeper bp);
	public void setActive(boolean b );
}