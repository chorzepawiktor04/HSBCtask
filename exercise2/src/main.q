\l ./src/VWAP.q
\l ./src/TWAP.q

data: ("DSJF"; enlist ",") 0: "../data/input.csv"

show vwap[data; 2025.01.01; 2025.07.01; `PLNGBP`CHFPLN];
show twap[data; 2025.01.01; 2025.07.01; `USDPLN`GBPCHF];
