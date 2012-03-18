# Lambdas to generate a, b, and c, given m and n
aGen = lambda m,n: 2 * m * n
bGen = lambda m,n: abs(m*m - n*n)
cGen = lambda m,n: m*m + n*n

# Yields a Pythagorean Triple, given m and n
pt = lambda m,n: (aGen(m,n), bGen(m,n), cGen(m,n))

# Determines whether the terms of the Pythagorean Triple add up to 1000
check = lambda a,b,c: a + b + c == 1000

# Try values: 1 <= (m,n) <= 1000
for m in range(1, 100):
	for n in range(1, 100):
		(a, b, c) = pt(m, n)
		if(check(a, b, c)):
			print "*** YAY!", a, b, c
			exit()
