/**
 * Runs in 246ms.  NB: This same algorithm was horrifically slow in Python (due to the tight inner loop
 * where the factoring takes place.
 */
public class Euler12 {
    public static void main(String[] args) {
        long start = System.currentTimeMillis();
        int n = 1, triNum = 1;
        while(true) {
            int sqrt = (int)Math.sqrt(triNum);
            int numFacts = 2;  // 1 and triNum are always factors
            int possFactor = 2;
            while(possFactor <= sqrt) {
                if (triNum % possFactor == 0) {
                    numFacts+=1;
                }
                possFactor+=1;
            }
            numFacts *= 2;  // include factors above sqrt
            if(numFacts >= 500) {
                long end = System.currentTimeMillis();
                System.out.println(triNum);
                System.out.println("Runtime: " + (end - start));
                System.exit(0);
            }
            n++;
            triNum = n * (n+1) / 2;
        }
    }
}
