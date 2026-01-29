//Number of population samples (demes)
2
//Population effective sizes (number of genes)
NCF
NCJ
//Sample sizes
20
22
//Growth rates: negative growth implies population expansion
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0
0	0	  	
0  	0
//Migration matrix 1
0       MIG1
MIG2    0
//Migration matrix 2
0	0   
0       0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
2 historical event
CHANGM 0 0 0 1 0 1
TDIV 0 1 1 NANC 0 2 absoluteResize
//Number of independent loci [chromosome]
1 0
//Per chromosome: Number of linkage blocks
1
//per Block: data type, num loci, rec. rate and mut rate + optional parameters
FREQ 1 0 2e-9 OUTEXP
