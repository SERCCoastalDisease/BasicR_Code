#Add taxonomic names upstream so that all taxonomic levels are present in COI taxonomy table for analysis

install.packages("worms")
library(worms)
#Created a list that removed duplicate names and lists full taxa names.
SBCOItaxa = read.csv("SBCOI_Taxalist.csv")
#Searching for all the genera and finding the upstream names to "order" from the worms database
SBCOItaxa_names = wormsbynames(SBCOItaxa$Genus, ids = FALSE, match = FALSE, verbose = TRUE, marine_only = FALSE)

# REQUESTING 122 ITEMS BY NAME from World Register of Marine Species (www.marinespecies.org), 03/11/2021 09:01:55 (CC-BY)
# chunk 1/3 
# Coelotanypus                                         no match                                 
# Dicrotendipes                                        no match                                 
# Xenochironomus                                       no match                                 
# unknown                                              no match                                 
# chunk 2/3 
# Rheotanytarsus                                       no match                                 
# Paratanytarsus                                       no match                                 
# chunk 3/3 
# Rickettsia                                           no match                                 
# Chaoborus                                            no match                                 
# Nanocladius                                          no match                                 
# Megaira                                              no match                                 
# by names ........................................... DONE

head(SBCOItaxa_names)
write.csv(SBCOItaxa_names, "UpstreamTaxonomySBCOI_fromworms.csv")
#Had to delete columns I didn't want, then substitute "unknown" for NA where taxonomy was unknown
#Now will merge this with other file

taxa1 = read.csv("UpstreamTaxonomySBCOI_fromworms_fix.csv", header = TRUE)
taxa2 = read.csv("allseqs_SBCOItaxa_FINAL2.csv", header = TRUE)
#Merging the two above by the column names and telling it to keep all the columns in y that do not match anything in x
#these are the ones I will need to fix manually
alltaxa = merge(taxa1, taxa2, by.x = "Genus", by.y= "Genus", all.y = TRUE)
head(alltaxa)
#reorder the columns so in the correct order
alltaxa2 = alltaxa[,c(6,2,3,4,5,1,7,8)]
head(alltaxa2)

write.csv(alltaxa2, "SBCOI_taxononyupstream.csv")
