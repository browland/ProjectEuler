{- Euler Project Problem 7.

   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

   What is the 10 001st prime number?
-}

-- Approx linear time with respect to tries ... brute-force approach ... took 23 seconds.

solution = nthPrime 10001

nthPrime :: Integer -> Integer
nthPrime n = searchPrime n 0 1
	where
		searchPrime countLimit currCount try
			| isPrime try = if (currCount + 1) == countLimit then try
				else searchPrime countLimit (currCount + 1) (try + 1)
			| otherwise = searchPrime countLimit currCount (try + 1)

isPrime :: Integer -> Bool
isPrime i = i /= 1 && length (factors i) == 2

factors :: Integer -> [Integer]
factors i = facsUpToSqrt ++ facsAfterSqrt
	where 
		facsUpToSqrt = filter (\x -> mod i x == 0) [1 .. truncate (sqrt (fromInteger i))]
		facsAfterSqrt = reverse (map (\x -> truncate (fromInteger i / fromInteger x)) facsUpToSqrt)