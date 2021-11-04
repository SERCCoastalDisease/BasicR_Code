#To merge multiple taxonomic ID files after BLAST

setwd("~/Dropbox (Smithsonian)/StripedBass/SBCOI_CPCNJ_&_ACHY7_Analyses/")

allseqs = read.csv("SBCOI_UniqueSeqs.csv", row.names = 1, header = TRUE)
head(allseqs)

CBBIr = read.csv("CBBI_4merge.csv", header = TRUE, row.names=1)
NRr = read.csv("NRBlast_4merge.csv", header = TRUE, row.names=1)
head(CBBIr)
head(NRr)
str(CBBIr)
str(NRr)
str(allseqs)
row.names(allseqs)
row.names(CBBIr)
row.names(NRr)

CBBI_NR = merge(CBBIr, NRr, by = 0, all.y = TRUE)
str(CBBI_NR)
head(CBBI_NR)
write.csv(CBBI_NR, "CBBI_NR_merge.csv")

fix = read.csv("CBBI_NR_merge_fix.csv", header = TRUE, row.names = 1)
head(fix)
str(fix)
row.names(fix)

allseqs_taxa = merge(allseqs, fix, by = 0, all.x = TRUE)
head(allseqs_taxa)
write.csv(allseqs_taxa, "allseqs_taxa_CBBI&NR_BLAST_merged.csv")
