-- Euler Project Problem 5.
--
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 
-- without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the numbers 
-- from 1 to 20?
--
-- This solution is based on the algorithm described here: 
-- http://en.wikipedia.org/wiki/Least_common_multiple#A_method_using_a_table
--
-- Time Complexity:  N.  Explanation: For each prime factor present in any element in the 
--                   input list, iterate over all elements and divide each by the prime 
--                   factor if possible.  Since a relatively small number of prime 
--                   factorisations will actually occur, a very small number (k) of 
--                   iterations over N would occur.
--
-- Space Complexity: N.  Explanation: We only need to keep the current list of N integers,
--                   performing successive prime factorisations in-place.  Small constant 
--                   overhead for accumulators etc.

import Data.List

solution = Main.lcm [1..20]

-- Calculates the Lowest Common Multiple of a list of Integers, by extracting prime factors 
-- from the list starting from the lowest primes and working up, while building a running 
-- product of the prime factors.
lcm :: [Integer] -> Integer
lcm vals = lcm' vals 1
	where
		lcm' xs accum
			| all ( == 1) xs = accum
			| otherwise      = lcm' (divByFac xs nextPf) (accum * nextPf)
				where
					nextPf = findLowestPrimeFac xs

-- Returns the lowest prime factor of any int in the list
findLowestPrimeFac :: [Integer] -> Integer
findLowestPrimeFac list = findLowestPrimeFac' list 2
	where
		findLowestPrimeFac' vals try
			| canFactorise vals try = try
			| otherwise             = findLowestPrimeFac' vals (nextPrime try)

-- Returns True if any value in the list can be factorised by the integer
canFactorise :: [Integer] -> Integer -> Bool
canFactorise list fac = any (\x -> mod x fac == 0) list

-- For every int in the list which has a factor fac, divides it by fac
divByFac :: [Integer] -> Integer -> [Integer]
divByFac vals fac = map (\x -> divByFac' x fac ) vals
	where
		divByFac' i f 
			| mod i f == 0 = div i f
			| otherwise    = i

-- Returns the next highest prime, after the Integer passed in
nextPrime :: Integer -> Integer
nextPrime currentPrime = searchForPrime (currentPrime + 1)
	where
		searchForPrime try 
			| isPrime try = try
			| otherwise   = searchForPrime (try + 1)

-- Returns all factors of an integer
factors :: Integer -> [Integer]
factors i = facsUpToSqrt ++ facsAfterSqrt
	where 
		facsUpToSqrt = filter (\x -> mod i x == 0) [1 .. truncate (sqrt (fromInteger i))]
		facsAfterSqrt = reverse (map (\x -> i `div` x) facsUpToSqrt)

isPrime :: Integer -> Bool
isPrime i = i == 1 || length (factors i) == 2