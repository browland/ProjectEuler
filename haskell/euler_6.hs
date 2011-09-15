{- Euler Project Problem 6.

   The sum of the squares of the first ten natural numbers is,

   1^2 + 2^2 + ... + 10^2 = 385
   The square of the sum of the first ten natural numbers is,

   (1 + 2 + ... + 10)^2 = 55^2 = 3025
   Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

   Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
-}

-- Calculated in constant time and space for n.
solution = ( sqSumNatNums n ) - ( sumSqNatNums n )
	where n = 100

-- Sum of squares of the natural numbers from 1 to n.
-- Can be calculated in constant time via ( n . (n + 1) . (2n + 1) ) / 6
sumSqNatNums :: Int -> Int
sumSqNatNums n = floor ( ( fromIntegral ( n * (n + 1) * (2 * n + 1) ) ) / ( fromIntegral 6 ) )

-- Square of sum of natural numbers from 1 to n.
-- Sum of natural numbers from 1 to n can be calculated in constant time as n (n + 1) / 2,
-- then just take the square.
sqSumNatNums :: Int -> Int
sqSumNatNums n = square (floor ( fromIntegral ( n * (n + 1 ) ) / fromIntegral 2 ) )

-- Calculates the square of n.
square :: Int -> Int
square n = n * n