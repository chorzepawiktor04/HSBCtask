The script in solution.q reads the current time(local) and creates a list of 2-second increments from the 
saved time until 12 hours later(2*21600=43200 seconds - exactly how much there are in 12 hours).
It then uses the where clause, to only leave the elements that point to a time, at least 20,000 seconds 
from the original time.