{- Euler Project Problem 7.

   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

   What is the 10 001st prime number?
-}

-- Approx linear time with respect to tries ... brute-force approach ... but greatly optimised with
-- respect to number of tries.  Took ~ 3 seconds.

solution = nthPrime 10001

nthPrime :: Int -> Int
nthPrime n = searchPrime n 0 1
	where
		searchPrime countLimit currCount try
			| isPrime try = if (currCount + 1) == countLimit then try
				else searchPrime countLimit (currCount + 1) (try + 1)
			| otherwise = searchPrime countLimit currCount (try + 1)

{- Greatly optimised version of isPrime, based on the following facts:

   1 is not a prime.
   All primes except 2 are odd.
   All primes greater than 3 can be written in the form  6k+/-1.
   Any number n can have only one primefactor greater than sqrt n .
   The consequence for primality testing of a number n is: if we cannot find a number f less than 
     or equal to sqrt n that divides n then n is prime: the only primefactor of n is n itself
-}
isPrime :: Int -> Bool
isPrime n = if n == 1 then False 
	else if n < 4 then True
		else if n `mod` 2 == 0 then False
			else if n < 9 then True
				else if n `mod` 3 == 0 then False
					else isPrime' n (floor $ sqrt $ fromIntegral n) 5
					where
						isPrime' n r f
							| ( f <= r ) = if n `mod` f == 0 then False
								else if n `mod` (f + 2) == 0 then False
								else isPrime' n r (f + 6)
							| otherwise = True
