###FIRST CONVERSION

import ipyrad.analysis as ipa
import pandas as pd

converter = ipa.vcf_to_hdf5(
        name="sofilt",
        data="filtered_mincov.recode.vcf",
        ld_block_size=50000,
)

converter.run()

###PCA

import toyplot

imap = {
    "TWN": ["SRR22822833.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822835.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822837.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822842.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822849.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822852.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822860.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822862.out.RG.sorted.fix.mate.dedup.bam"],
    "POTCF": ["SRR25249025.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249026.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249028.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249030.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249034.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249036.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249037.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249038.out.RG.sorted.fix.mate.dedup.bam"],
    "CJPOT": ["SRR25249027.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249029.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249031.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249032.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249033.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249035.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249039.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249040.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249041.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249042.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249043.out.RG.sorted.fix.mate.dedup.bam"],
}

minmap = {i: 0.5 for i in imap}

data="./analysis-vcf2hdf5/sofilt.snps.hdf5"

###CHECKING IF UPLOAD WENT FINE

ipa.snps_extracter(data).names

##PCA

pca3 = ipa.pca(
    data=data,
    imap=imap,
    minmap=minmap,
    mincov=0.7,
    impute_method=3,
)

pca3.run(nreplicates=100, seed=123)
pca3.draw(0, 2);

pca3.draw(outfile="mypca_filtoutput.pdf")

##REMOVAL 2 INVDIVIDUALS

imap = {
    "TWN": ["SRR22822833.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822835.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822837.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822842.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822849.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822852.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822860.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822862.out.RG.sorted.fix.mate.dedup.bam"],
    "POTCF": ["SRR25249025.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249026.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249028.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249030.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249034.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249036.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249037.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249038.out.RG.sorted.fix.mate.dedup.bam"],
    "CJPOT": ["SRR25249027.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249031.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249032.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249033.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249035.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249040.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249041.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249042.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249043.out.RG.sorted.fix.mate.dedup.bam"],
}

pca31 = ipa.pca(
    data=data,
    imap=imap,
    minmap=minmap,
    mincov=0.7,
    impute_method=3,
)

pca31.run(nreplicates=100, seed=123)
pca31.draw(0, 2);

pca31.draw(outfile="mypca_no29AND39.pdf")

###CHECKING MISSING DATA

pca3.missing.sort_values(by="missing")

###REMOVE THREE INDIVIDUALS FOR MISSING DATA

imap = {
    "TWN": ["SRR22822833.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822835.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822837.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822842.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822849.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822852.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822860.out.RG.sorted.fix.mate.dedup.bam",
"SRR22822862.out.RG.sorted.fix.mate.dedup.bam"],
    "POTCF": ["SRR25249025.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249026.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249028.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249030.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249034.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249036.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249037.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249038.out.RG.sorted.fix.mate.dedup.bam"],
    "CJPOT": ["SRR25249027.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249029.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249031.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249033.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249040.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249041.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249042.out.RG.sorted.fix.mate.dedup.bam",
"SRR25249043.out.RG.sorted.fix.mate.dedup.bam"],
}

pca32 = ipa.pca(
    data=data,
    imap=imap,
    minmap=minmap,
    mincov=0.7,
    impute_method=3,
)

pca32.run(nreplicates=100, seed=123)
pca32.draw(0, 2);

pca32.draw(outfile="mypca_nomore25missing.pdf")
