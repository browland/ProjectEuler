-- Project Euler Problem 3.
--
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?

val :: Integer
val = 600851475143

solution = largestPrimeFactor val

-- Space Complexity: Sqrt N (need to iterate over values up to Sqrt N to find factors)
-- Time Complexity: Sqrt N (due to iterations as per Space Complexity)

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor x = last (filter isPrime (factors x))

factors :: Integer -> [Integer]
factors i = facsUpToSqrt ++ facsAfterSqrt
	where 
		facsUpToSqrt = filter (\x -> mod i x == 0) [1 .. truncate (sqrt (fromInteger i))]
		facsAfterSqrt = reverse (map (\x -> truncate (fromInteger i / fromInteger x)) facsUpToSqrt)

isPrime :: Integer -> Bool
isPrime i = i == 1 || length (factors i) == 2
