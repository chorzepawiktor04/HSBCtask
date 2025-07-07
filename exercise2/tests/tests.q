\l "src/VWAP.q"
\l "src/TWAP.q"


assertEqual: { 
  if[x~y; 
    show "pass:", msg; 
    :(); 
  ]; 
  show "fail:", msg, " | expected: ", string x, " got: ", string y;
};


t: ([] 
  data: 2025.01.01 2025.01.01 2025.01.01 2025.01.01 2025.01.02;
  price: 4.68 2.17 2.32 4.47 3.32;
  size: 8075 31883 20591 11916 94857;
  currency: `USDPLN`GBPCHF`CHFPLN`PLNGBP`USDPLN
);


vwapTest: vwap[t; 2025.01.01; 2025.01.01; `PLNGBP];
expected1: (4.47 * 11916) % 11916;  / VWAP = (price * size) / sum size = 4.47
assertEqual[expected1; vwapTest; "VWAP test"];

twapTest: twap[t; 2025.01.01; 2025.01.02; `USDPLN];
expected2: (4.68+3.32)%2;
assertEqual[expected2; twapTest; "TWAP test"];

vwapEmpty: vwap[t; 2024.01.01; 2024.01.02; `PLNGBP];
assertEqual[::; vwapEmpty; "VWAP empty test"];

twapEmpty: twap[t; 2024.01.01; 2024.01.03; `USDCHF];
assertEqual[::; twapEmpty; "TWAP empty test"];






