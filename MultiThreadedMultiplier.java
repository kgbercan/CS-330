import java.util.ArrayList;

public class MultiThreadedMultiplier {

  private static class DigitMultiplier extends Thread {
  
    private int iNum1;
    private int iThisDigit;
    public int iResult;
    
    public DigitMultiplier(int iNum1, int iThisDigit) {
      this.iNum1 = iNum1;
      this.iThisDigit = iThisDigit;
    }
    
    public void run() {
      this.iResult = iNum1 * iThisDigit;
    }
    
  }
  
  public static void main(String[] args) throws InterruptedException {
    // arraylist of digit multiplier objects
    ArrayList<DigitMultiplier> alDM = new ArrayList<DigitMultiplier>();
    // num1 is 5280
    int iNum1 = 5280;
    // num2 is 1200
    int iNum2 = 1200;
    // remaining is 1200
    int iRemaining = iNum2;
    // for digits starting 1 while remaining is > 0, mulitply digit by 10
    for (int iDigitValue = 1; iRemaining > 0; iDigitValue *= 10) {
      // this digit is 1200 mod 10 = 0
      int iThisDigit = iRemaining % (iDigitValue*10);
      // remaining is 1200 - 0
      iRemaining = iRemaining - iThisDigit;
      // add new digit multiplier using num1 and thisdigit
      alDM.add(new DigitMultiplier(iNum1, iThisDigit));
    }
    for (DigitMultiplier dm : alDM)
      dm.start();
    for (DigitMultiplier dm : alDM)
      dm.join();
    int iResult = 0;
    for (DigitMultiplier dm : alDM)
      iResult += dm.iResult;
    System.out.println(iNum1+" x "+iNum2+" = "+iResult);
  }
}