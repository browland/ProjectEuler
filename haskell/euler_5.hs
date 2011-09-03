-- Euler Project Problem 5.
--
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 
-- without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the numbers 
-- from 1 to 20?

nextPrime :: Integer -> Integer
nextPrime currentPrime = searchForPrime (currentPrime + 1)
	where
		searchForPrime try 
			| isPrime try = try
			| otherwise   = searchForPrime (try + 1)

factors :: Integer -> [Integer]
factors i = facsUpToSqrt ++ facsAfterSqrt
	where 
		facsUpToSqrt = filter (\x -> mod i x == 0) [1 .. truncate (sqrt (fromInteger i))]
		facsAfterSqrt = reverse (map (\x -> truncate (fromInteger i / fromInteger x)) facsUpToSqrt)

isPrime :: Integer -> Bool
isPrime i = i == 1 || length (factors i) == 2