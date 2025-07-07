\l "src/VWAP.q"
\l "src/TWAP.q"
\l "tests/tests.q"

data: ("DFJS"; enlist ",") 0: `:"data/input.csv"


vwap[data; 2025.01.01; 2025.07.01; `PLNGBP`CHFPLN];
twap[data; 2025.01.01; 2025.07.01; `USDPLN`GBPCHF];
