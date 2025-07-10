\l VWAP.q
\l TWAP.q

\cd ../
\cd data

data: ("DFJS"; enlist ",") 0: `:input.csv

\cd ../
\cd tests

\l tests.q

show vwap[data; 2025.01.01; 2025.07.01; `PLNGBP`CHFPLN];
show "----------------------------"
show twap[data; 2025.01.01; 2025.07.01; `USDPLN`GBPCHF];
