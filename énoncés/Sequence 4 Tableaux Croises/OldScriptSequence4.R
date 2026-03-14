
#supprimer un objet de l'environnement 
rm(eni)

#installation des nouveaux packages

#pour run une ligne de code, le raccourci est ctrl+entree

install.packages('questionr')
install.packages('readr')
install.packages('readxl')
install.packages('devtools')
install.packages('lattice')
install.packages('gmodels')
install.packages('questionr')
install.packages('ade4')
install.packages('effects')
install.packages('broom')
install.packages('JLutils')
install.packages('explor')
install.packages('RColorBrewer')

install_github("larmarange/JLutils")

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
d <- read_excel("/home/renaud/Documents/Enseignements/L1-2-3/Enseignements/L3SIASS/Enonces+DonneesTD/Sequence1/DonneesTD1.xlsx")

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

#pour charger la documentation sur une CrossTable
?CrossTable

#tableau croise que les % en lignes
CrossTable(d$V0001,d$V0002,prop.r=TRUE, prop.c=FALSE,
prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE)

#affichage des % en colonnes
CrossTable(d$V0001,d$V0002,prop.r=FALSE, prop.c=TRUE,
           prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE)

#afficher les eff theoriques a cote des eff observes

CrossTable(d$V0001,d$V0002,prop.r=FALSE, prop.c=FALSE,
           prop.t=FALSE, prop.chisq=FALSE, chisq = FALSE, expected=TRUE)


#redoublement
table(d$V0007)

#resultats faibles
table(d$V0065)

#croisement des deux var
table(d$V0007,d$V0065)

CrossTable(d$V0007,d$V0065,expected=TRUE)

##je le mets en reserve dans un objet tab
tab <- table(d$V0007,d$V0065)



#test du khi 2
chisq.test(tab)


#autre methode pour avoir les frequences en ligne
lprop(tab)
rprop(tab)
#et en colonnes
cprop(tab)


#representation graphique du tableau

mosaicplot(tab)


#ajouter des titres aux axes du graph

mosaicplot(tab,xlab='passé scolaire',ylab='résultats actuels faibles',
           main='Influence du passé sur le présent')
?mosaicplot

mosaicplot(tab, las = 3, shade = TRUE,
           xlab="passé scolaire", ylab="résultats actuels faibles")

#afficher le v de cramer
cramer.v(tab)



#calcul d'une moyenne pour une variable quanti

mean(d$V0081,na.rm=TRUE)


mean(d$V0082,na.rm=TRUE)

#quelques indicateurs de position et dispersion
summary(d$V0081)

#ecart-type
sd(d$V0081,na.rm=TRUE)

#afficher les quartiles
quantile(d$V0081,probs = seq(0, 1, 0.25), na.rm = TRUE)

#afficher les deciles
quantile(d$V0081,probs = seq(0, 1, 0.1), na.rm = TRUE)

#afficher seulement le Q3
quantile(d$V0081,probs=seq(0.75,0.75,0.25),na.rm=TRUE)

#diviser en quintiles (=cinq parties egales)
quantile(d$V0081, probs = seq(0, 1, 0.20), na.rm = T)


#regression lineaire
lm(d$V0081 ~ d$V0082)

#nuage de points
plot(d$V0081,d$V0082
     , xlab='moyenne éduc artistique',
     ylab="moyenne en biologie")


#rajouter la droite de régression linéaire

reg <- lm(d$V0081 ~d$V0082)

summary(reg)

plot(d$V0081,d$V0082, xlab='moyenne éduc artistique',
     ylab="moyenne en biologie",
     abline(reg,col='red'))

#copier un resultat R pour le coller dans excel
copie(table(d$V0001))

copie(CrossTable(d$V0001,d$V0002))


#graphique en barre
barplot(table(d$V0001))

#graphique en baton
dotchart(table(d$V0001), 
         ylab='effectifs',
         xlab="Aisance à l'école",
         main="MESHERITIERS 2002")

#graphique en barre colore
barplot(table(d$V0001),col='darkblue',
        main="Distribution selon l'aisance avec les camarades",
        xlab='source : enquête Meshéritiers')

#boite a moustache
boxplot(d$V0254~d$V0882,
        ylab='Effectifs',
        main="Totalité du temps de travail par semaine (en minutes)",
        xlab='Mère diplômée du supérieur')

#histogramme
hist(d$V0254, main='Tps de travail hebdo', xlab='minutes')

summary(d$V0254)


#histogramme avec seulement 4 
#classes de valeurs
hist(d$V0254,breaks=3, main='Tps de travail hebdo',xlab='minutes')


#histogramme avec frequence au lieu d'effectifs 
#(! en anglais effectifs=frequency)
hist(d$V0254, main='Tps de travail hebdo (min)',
     xlim=c(0,1500),
     xlab='minutes',
     freq=F)

#histogramme avec couleur
hist(d$V0254, main='Tps de travail hebdo (min)',
     xlim=c(0,1500),
     freq=F,
     col='#FF9966') 

#plus d'infos sur R et la couleur
# http://www.sthda.com/french/wiki/couleurs-dans-r


########## MANIPULER LES DONNEES ########

#afficher le type de données, afficher la table, puis la valeur situee 
#a l'intersection de la 2eme ligne et de la 3eme colonne
class(d)
View(d)
d[2,3]

#afficher tous les eleves tres a l'aise avec leurs profs
View(d[which(d$V0002=="à l'aise"),])

#isoler tous les eleves tres a l'aise avec leurs profs dans une autre base
da <-d[which(d$V0002=="à l'aise"),]


#creer une nouvelle variable a partir d'une ancienne variable
freq(d$V0003)
d$hrx[d$V0003=='oui']<-'tt le tps heureux'
d$hrx[d$V0003!='oui']<-'pas tt le tps heureux'
freq(d$hrx)

