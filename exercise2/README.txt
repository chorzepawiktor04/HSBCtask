Exercise2 contains the solution to the mini-project.

1. data - contains a csv file, that is a result of exporting a table created in q. It was created using
a sequence of code: 
	dates: 2025.01.01 + til 365
	symbols: `USDPLN`GBPCHF`CHFPLN`PLNGBP`USDCHF
	t: ([] data: raze 5#/: dates; price: 1825?((200 + til 300)%100); size: 1825?1000 + til 99000; currency: 1825#symbols)
The table contains 4 columns and 1825 rows. The columns are "data" which holds each day of the year 2025(from
January 1st till December 31st). Each day is repeated 5 times, so that there is a record for each
currency exchange every day(mainly for TWAP calculation purposes). The second row contains the exchange
price, that is a random float number in range(2,5). The third row is the quantity(size) of the exchange
and it is a random long integer in range(1000,100000). The last row contains one of the 5 arbitrarily
chosen exchange symbols in format 'currency1currency2'.

2. src - contains 3 files.
	a) VWAP.q - contains a function that calculates the volume-weighted average price and returns
	the value for each exchange(if given as an argument) as a table.

	b) TWAP.q - contains a function that calculates the time-weighted average price and returns
	the value for each exchange(if given as an argument) as a table.

	c) main.q - this file uses the \l command to read both above-mentioned functions, as well as
	the tests.q file which will be described in the next step. It also reads the input.csv file and
	creates two examples to show how the functions work.

3. tests - contains a q-file with basic tests to ensure the code runs as intended. It defines a function
for asserting equality, which is then used throughout the tests. A small table is created for the test
purposes and after that 4 tests are defined: 2 of them check the mathematical correctness of the VWAP and
TWAP functions and the other two check whether no arguments given results in an empty output.



The code is intended to be run from the level of HSBCtaks/exercise2. 
Run formula: \l "src/main.q"
The above-given formula should run this code from the q console. 