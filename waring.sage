def waring(p, d):
    finite_field = GF(p) # Create finite field
    solutions = [] # Holds the solutions
    waring_number = 1
    BUFFER = []

    for k in finite_field:
    	current = (k^d)%p
    	if not (current in solutions):
    		solutions.append(current)
    		
    BUFFER = solutions

    while not len(solutions) == p:
    	for i in range (0, len(solutions)):
    		for j in range (0, len(solutions)):
    			res = solutions[i] + solutions[j]
    			if not (res in solutions):
    				BUFFER.append(res)
    	solutions = BUFFER
    	BUFFER = []
    	waring_number += 1

    if len(solutions) == p:
    	print solutions
    	print waring_number

waring(5, 2)