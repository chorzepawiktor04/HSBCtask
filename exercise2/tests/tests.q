\cd ../
\cd src
\l VWAP.q
\l TWAP.q


assertEqual: { [x; y; msg]
  if[x~y; 
    show "pass: ", msg; 
    :()
  ]};


t: ([] 
  data: 2025.01.01 2025.01.01 2025.01.01 2025.01.01 2025.01.02;
  price: 4.68 2.17 2.32 4.47 3.32;
  size: 8075 31883 20591 11916 94857;
  currency: `USDPLN`GBPCHF`CHFPLN`PLNGBP`USDPLN);


vwapTest: value vwap[t; 2025.01.01; 2025.01.01; `PLNGBP][;`vwap];
expected1: (4.47 * 11916) % 11916;  
show assertEqual[expected1; first vwapTest; "VWAP test"];

twapTest: value twap[t; 2025.01.01; 2025.01.02; `USDPLN][;`twap];
expected2: (4.68+3.32)%2;
show assertEqual[expected2; first twapTest; "TWAP test"];

vwapEmpty: value vwap[t; 2024.01.01; 2024.01.02; `PLNGBP][;`vwap];
show assertEqual[0; count vwapEmpty; "VWAP empty test"];

twapEmpty: value twap[t; 2024.01.01; 2024.01.03; `USDCHF];
show assertEqual[0; count twapEmpty; "TWAP empty test"][;`twap];

vwapTwoCurrencies: value vwap[t; 2025.01.01; 2025.01.01; `PLNGBP`GBPCHF][;`vwap];
expected3: (((2.17 * 31883) % 31883), ((4.47 * 11916) % 11916)); 
show assertEqual[expected3; vwapTwoCurrencies; "VWAP two currencies test"];







