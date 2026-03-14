
#installation des nouveaux packages

#pour run une ligne de code, le raccourci est ctrl+entree
install.packages('questionr')
install.packages('gmodels')
#installer les packages suivants au cas ou on les utilise par la suite

library(questionr)
library(readr)
library(readxl)
library(devtools)
library(lattice)
library(gmodels)
library(questionr)
library(ade4)
library(effects)
library(broom)
library(JLutils)
library(explor)
library(RColorBrewer)


#etape de chargement des donnees
d <- read_excel("D:/IDUP cours/L3/2020-2021/TD S2/Sequence1/DonneesTD1.xlsx")

#pour afficher les donnees
View(d)

#tri a plat
table(d$V0001)

#pourcentage
freq(d$V0001)

#tableau croise variable quali juste les effectifs
table(d$V0001,d$V0002)

#tableau croise var quali avec % en lignes et en colonnes
CrossTable(d$V0001,d$V0002)


#tableau croise que les % en lignes
CrossTable(d$V0001,d$V0002,prop.r=TRUE, prop.c=FALSE,
prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE)

#affichage des % en colonnes
CrossTable(d$V0001,d$V0002,prop.r=FALSE, prop.c=TRUE,
           prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE)

#afficher les eff theoriques a cote des eff observes

CrossTable(d$V0001,d$V0002,prop.r=FALSE, prop.c=TRUE,
           prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE, expected=TRUE)
