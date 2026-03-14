install.packages("GDAtools")
install.packages("descr")
library(GDAtools)
library(readxl)
jm <- read_excel("/home/renaud/travail/Enseignements/L1-2-3/Enseignements/L3SIASS/Semestre6/Sequence2/DonneesTD2.xlsx")
View(jm)
library(descr)
help(crosstab)
library(questionr)
#On isole l'échantillon français
jmfr <- jm[which(jm$country=="2"),]         
variable.names(jmfr)
#Il faudra vérifier si cette syntaxe est vraiment la bonne...
tabs(jmfr,"gender","CarOr",type="counts",weight="w_equal")
g_o <- round(tabs(jmfr,"gender","CarOr",type="counts",
weight="w_equal",exclude=("CarOr"="9")))
library(knitr)
kable(g_o)
g_o <- g_o[,2:4]
#Calcul des % en ligne 
lprop(g_o) 
#Test du Khi² 
chisq.test(g_o) 
#Résultat non significatif

#Calcul du PEM 
pem(g_o) 

#Étiquetage des variables
m_g <- c("0","1")
e_g <- c("homme","femme")
m_o <- c("1","2","3")
e_o <- c("carriériste","équilibriste","familialiste")
#Pour redéfinir la variable gender comme un facteur
jmfr$gender <- as.factor(jmfr$gender)
jmfr$gender <- set_labels(
  efc$gender,
  labels = c(
    `0` = "homme",
    `1` = "femme"
 ))
#cette piste nécessite le module sjmisc ou magrittr
library(labelled)
lg <- labelled(c(0,1), c("homme" = 0, "femme" = 1))
#Pour afficher mon jeu d'étiquette du genre 
to_factor(lg,"p") 
jmfr$gender <- as.character(jmfr$gender)
e_g <- c("homme" = "0", "femme" = "1")
#On va maintenant étiqueter le vecteur des hommes et des femmes
jmfr$gender <- labelled(jmfr$gender,e_g)  
jmfr$CarOr <- as.character(jmfr$CarOr)
e_o <- c("carriériste" = "1","équilibriste" = "2","familialiste" = "3","NR"="9")
jmfr$CarOr <- labelled(jmfr$CarOr,e_o)
#Recréons le tableau croisé
tabs(jmfr,"gender","CarOr",type="counts",weight="w_equal")
crosstab(jmfr$CarOr,jmfr$gender,weight=jmfr$w_equal)