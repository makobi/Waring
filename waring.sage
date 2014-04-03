r"""
Waring numbers over finite fields of the form 'Zp'

Waring's number is the minimum amount of variables needed such that the 
diagonal equation of the form x_1^d + ... + x_n^d has solution for every
element nin Z_p. That is x_1^d + ... + x_n^d = {0, ... , p-1}.
...

AUTHORS:

- Alex D. Santos Sosa (2013-11-24): initial version
...

Examples:

Waring number for p = 5 and d = 2::

sage: waring(5, 2)
2

sage: waring(5, 3)
1

sage: waring(7, 3)
3

"""

#*****************************************************************************
#       Copyright (C) 2010 Alex D. Santos Sosa < alex.santos.sosa@gmail.com >
#
#  Distributed under the terms of the GNU General Public License (GPL)
#  as published by the Free Software Foundation; either version 2 of
#  the License, or (at your option) any later version.
#                  http://www.gnu.org/licenses/
#*****************************************************************************

# Waring Numbers Module

from fractions import gcd

def waring(p, d):

    finite_field = GF(p) # Create finite field
    
    solutions = [] # Holds the solutions
    
    waring_number = 1 # This is the waring number for (p,d)
    
    BUFFER = [] # Holds the new solutions while 'solutions' is in use

    if gcd(p-1,d) == 1:
        print 1

    elif d == (p -1):
        print p-1

    elif d == (p-1)/2:
        print (p-1)/2

    else:
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
        	print waring_number
