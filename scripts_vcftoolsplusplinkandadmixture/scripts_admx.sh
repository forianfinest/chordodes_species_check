###full

for K in 1 2 3; \
do ../admixture32 --cv foradmixture.bed $K | tee logfull${K}.out; done

grep -h CV logfull*.out

###no 25% missing data

for K in 1 2 3; \
do ../admixture32 --cv lessind.bed $K | tee log${K}.out; done

grep -h CV log*.out