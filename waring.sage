import threading       # Library used for the threads and its functions in the program.

def waring(p, d):
    finite_field = GF(p) # Create finite field
    solutions = [] # Holds the solutions
    waring_number = 1
    BUFFER = []
    critical = threading.Lock()
    threads = []

    # Solution Class Thread
    class Solution_thread (threading.Thread):

        # Initialization of the thread
        def __init__(self, name, num):
            threading.Thread.__init__(self)
            self.name = name

        # Define what the thread is to do
        def run(self, num):
            for i in range (0, len(solutions)):
                res = solutions[i] + num
                if not (res in solutions):
                    critical.acquire()
                    BUFFER.append(res)
                    critical.release() 

    for k in finite_field:
    	current = (k^d)%p
    	if not (current in solutions):
    		solutions.append(current)
    		
    BUFFER = solutions

    while not len(solutions) == p:
    	for i in range (0, len(solutions)):
    		threads[i] = Solution_thread("S")
    	solutions = BUFFER
    	BUFFER = []
    	waring_number += 1

    if len(solutions) == p:
    	print solutions
    	print waring_number

waring(5, 2)