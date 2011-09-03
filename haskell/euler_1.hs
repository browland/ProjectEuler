-- Project Euler Problem 1.
--
-- If we list all the natural numbers below 10 that are multiples 
-- of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
-- 
-- Find the sum of all the multiples of 3 or 5 below 1000.

-- Space Complexity: N (input list is lazily initialized, but filter must generate
--                      a list upfront for sum to operate on.
-- Time Complexity: N (must iterate over ints from 1 to 999 to determine if it is
--                     a multiple of 3 or 5).
solution = sum (filter (\x -> ((mod x 3 == 0) || (mod x 5 == 0))) [1 .. 999])
