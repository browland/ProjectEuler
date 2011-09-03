/**
 * Project Euler Problem 4.
 * 
 * A palindromic number reads the same both ways. The largest palindrome made from the product 
 * of two 2-digit numbers is 9009 = 91  99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *
 * Space Complexity: Constant
 * Time Complexity: N^2 / 2 (Basically N^2 but the inner loop iterations decrease by 1 for each 
 *                           outer loop)
 */
public class Euler4 {

    public static void main(String[] args) {
        int currentBest = 0;

        for(int i=999; i>=100; i--) {
            for(int j=i;j>=100;j--) {
                int product = i*j;
                if(isPalindrome(product)) {
                    if(product > currentBest) currentBest = product;
                }
            }
        }
        System.out.println(currentBest);
    }

    static boolean isPalindrome(int val) {
        String s = Integer.toString(val);
        int i = 0;  int j = s.length() - 1;
        while (i <= j) {
            if(s.charAt(i) != s.charAt(j)) return false;
            i++; j--;
        }
        return true;
    }
}
