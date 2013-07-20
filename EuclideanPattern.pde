public class EuclideanPattern 
{
  protected int accents;
  protected int beats;
  public EuclideanPattern(int accents, int beats)
  {
    this.accents =  accents;
    this.beats = beats;
    
  }
  

  int[] getPattern()
  {
      int[] res = this.eucProcess();
      return res;
  }

int[] concat(int[] A, int[] B)
{
  int aLen = A.length;
   int bLen = B.length;
   int[] C= new int[aLen+bLen];
   System.arraycopy(A, 0, C, 0, aLen);
   System.arraycopy(B, 0, C, aLen, bLen);
   return C;
}

int[]  eucProcess()
{
  int silent = this.beats - this.accents;
  int[] U = {1}; 
  int[] Z = {0};
 // var alpha = hits; var beta = silent;
  int[] res = this.euclid(this.accents, U, silent, Z);
  return res;
}

int[]  euclid(int alpha, int U[], int beta, int[] Z)
{
 //int remainder = null;
  
  if( beta <= 1){ return eucMultiplyConcat(alpha, U, beta, Z);}
  if( alpha >= beta )
  {
   
    return euclid(beta, eucMultiplyConcat(1,U,1,Z), alpha-beta, U);
   // return euclid(beta, U.concat(Z), alpha-beta, U);
  }
  else
  {
     return euclid(alpha, this.concat(U,Z), beta - alpha, Z);
 //   return euclid(alpha, U.concat(Z), beta - alpha, Z);
    //return euclid(alpha, U.concat(Z), beta - alpha, Z);
  }
}

int[]  eucMultiplyConcat(int alpha, int U[], int beta, int[] Z)
{
  int[] ret = {};
 
  for(int i= 0; i< alpha; i++ )
  {
   // ret = ret.concat(U);
	  ret = this.concat(ret, U);
  }
  for(int i= 0; i< beta; i++ )
  {
    //ret = ret.concat(Z);
	  ret = this.concat(ret, Z);
  }
  ret[0]++;
  return ret;
  
}
  
  
  
}
