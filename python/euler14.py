import time

def genSequence(n):
    seq = [n]
    while True:
        if n % 2 == 0:
            n /= 2
        else:
            n = 3*n + 1
        seq.append(n)
        if n == 1: break
    return seq

start = int(round(time.time() * 1000))
longest = 0
startingN = 1
for n in range(1, 1000000):
    seq = genSequence(n)
    length = len(seq)
    if length > longest:
        longest = length
        startingN = n

end = int(round(time.time() * 1000))
print "time taken (ms): ", end-start
print longest
print genSequence(startingN)