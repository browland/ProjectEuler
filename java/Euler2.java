import java.util.Iterator;

/**
 * Project Euler Problem 2.
 * 
 * Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
 * By starting with 1 and 2, the first 10 terms will be:
 *
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
 * find the sum of the even-valued terms.
 *
 * -------------------------------
 *
 * Space Complexity: Constant (only need the running total and vars to calculate the current 
 *                             Fibonacci term)
 * Time Complexity: N (must visit each term of the Fibonacci sequence until the termination 
 *                     condition is reached)
 *
 */
public class ProjectEuler2 {

    public static void main(String[] args) {
        FibGen gen = new FibGen();
        int runningTotal = 0;
        for(int fibTerm : gen) {
            if(fibTerm > 4000000) break;
            if(fibTerm % 2 == 0) runningTotal += fibTerm;
        }
        System.out.println(runningTotal);
    }

    /**
     * Lazily evaluates the next term in the Fibonacci Sequence, via an Iterator.
     */
    static class FibGen implements Iterable<Integer> {
        private int prevPrev = 0;
        private int prev = 1;
        private int term = 0;

        public Iterator<Integer> iterator() {
            return new Iterator<Integer>() {
                public boolean hasNext() {
                    return true;
                }

                public Integer next() {
                    term = prevPrev + prev;
                    prevPrev = prev;
                    prev = term;
                    return term;
                }

                public void remove() {
                    throw new UnsupportedOperationException("Cannot remove a term from a generated sequence");
                }
            };
        }
    }
}