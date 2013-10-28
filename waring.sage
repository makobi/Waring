# Waring Numbers Module

def waring(p, d):
    finite_field = GF(p) # Create finite field
    solutions = [] # Holds the solutions
    waring_number = 1 # This is the waring number for (p,d)
    BUFFER = [] # Holds the new solutions while 'solutions' is in use

    for k in finite_field: # Find the solutions for one variable
    	current = (k^d)%p
    	if not (current in solutions):
    		solutions.append(current)

    while not len(solutions) == p: # Find solutions for more than one variable
    	for i in range (0, len(solutions)):
    		for j in range (0, len(solutions)):
    			res = solutions[i] + solutions[j] # Sum all the solutions to find new solutions
    			if not (res in solutions):
    				BUFFER.append(res) # Save new solutions to BUFFER
    	solutions.extend(BUFFER) # Save new solutions 
    	BUFFER = []
    	waring_number += 1

    if len(solutions) == p:
    	print solutions
    	print waring_number

waring(5, 2)