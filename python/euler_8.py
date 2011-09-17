import sys

## Project Euler - Problem 8.
## Find the greatest product of five consecutive digits in the 1000-digit number.

## Solved in linear time, constant space.

## 1000-digit value within which to find the greatest product of 5 consecutive digits.
NUM_STR = "73167176531330624919225119674426574742355349194934" \
          "96983520312774506326239578318016984801869478851843" \
          "85861560789112949495459501737958331952853208805511" \
          "12540698747158523863050715693290963295227443043557" \
          "66896648950445244523161731856403098711121722383113" \
          "62229893423380308135336276614282806444486645238749" \
          "30358907296290491560440772390713810515859307960866" \
          "70172427121883998797908792274921901699720888093776" \
          "65727333001053367881220235421809751254540594752243" \
          "52584907711670556013604839586446706324415722155397" \
          "53697817977846174064955149290862569321978468622482" \
          "83972241375657056057490261407972968652414535100474" \
          "82166370484403199890008895243450658541227588666881" \
          "16427171479924442928230863465674813919123162824586" \
          "17866458359124566529476545682848912883142607690042" \
          "24219022671055626321111109370544217506941658960408" \
          "07198403850962455444362981230987879927244284909188" \
          "84580156166097919133875499200524063689912560717606" \
          "05886116467109405077541002256983155200055935729725" \
          "71636269561882670428252483600823257530420752963450"

## No. of consecutive digits to calculate products of.
LEN = 5

def calc(s):
	# Starting values of indices and product
	startIx = 0; endIx = startIx + LEN-1; product = 0; best = 0;
	
	# Loop through start/end indices, increasing each one at a time	
	while endIx < len(s):
		product = findProduct(s, product, startIx, endIx)
		
		if product > best:
			best = product
		
		startIx = startIx + 1
		endIx = endIx + 1
		
	print "best: " + str(best)
	
def productInRange(s, i, j):
	"""Find product of consecutive digits in string from index i to j inclusive."""
	product = 1
	
	for ix in range(i, j+1):
		product = product * int(s[ix])
	return product
	
def findProduct(s, product, i, j):
	"""Calculate the next product, based on the entire string, the current product,
		and the start/end indices of the current product."""

	# If the digit at the previous start index is not '0' and the previous product is
	# non-zero, then we can use an optimisation by dividing by the digit at the previous 
	# start index, and multiplying by the digit at the end index.
	if int(s[i-1]) != 0 and product != 0:
		return product / int(s[i-1]) * int(s[j])
	
	# Otherwise use a more expensive method by simplying calculating the
	# product of the 5 digits represented by the start/end indices.
	else:
		return productInRange(s, i, j)

if __name__ == '__main__':
        calc(NUM_STR)
