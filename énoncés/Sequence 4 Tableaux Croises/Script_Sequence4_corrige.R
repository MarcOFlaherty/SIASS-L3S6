# ==============================================================================
# Séquence 4 : L'enquête sur les Héritiers - Script R corrigé
# Thème : Tableaux croisés, test du Khi-deux et analyse des résidus
# ==============================================================================

# 1. Installation (si nécessaire) et chargement des packages
# ------------------------------------------------------------------------------
# Décommentez les lignes suivantes si les packages ne sont pas encore installés
# install.packages("tidyverse")
# install.packages("readxl")
# install.packages("questionr")

library(tidyverse)
library(readxl)
library(questionr)

# 2. Importation des données
# ------------------------------------------------------------------------------
# Assurez-vous que le chemin vers le fichier correspond à votre dossier de travail
# df <- read_excel("data/DonneesTD4.xlsx") # Chemin relatif classique
df <- read_excel("DonneesTD4.xlsx") # Si le fichier R est dans le même dossier

# Exploration rapide pour vérifier l'importation
head(df)
dim(df)

# 3. Création du Tableau Croisé (V0153 : Rang de naissance / V0008 : Difficultés)
# ------------------------------------------------------------------------------
tab <- table(df$V0153, df$V0008)

# Labellisation pour la clarté (les libellés doivent correspondre au dictionnaire)
rownames(tab) <- c("Aînés", "Cadets", "Uniques")
colnames(tab) <- c("Difficultés", "Réussite", "Moyen")

print("--- Tableau des effectifs observés ---")
print(tab)

# 4. Calcul des pourcentages (Profils-Lignes)
# ------------------------------------------------------------------------------
# Le pourcentage en ligne permet de comparer le comportement des groupes
# indépendamment de leur taille.
print("--- Pourcentages en ligne (Profils) ---")
lprop(tab)

# 5. Test d'indépendance du Khi-deux
# ------------------------------------------------------------------------------
# Le test répond par "oui" ou "non" à la question : y a-t-il un lien global ?
test_khi2 <- chisq.test(tab)

print("--- Résultat du test du Khi-deux ---")
print(test_khi2)

# Interprétation de la p-value :
# Si p-value > 0.05, on ne peut pas rejeter l'hypothèse d'indépendance.
# Les variables ne sont pas significativement liées.

# Intensité du lien (V de Cramer)
print("--- V de Cramer (Intensité) ---")
cramer.v(tab)

# 6. Analyse des écarts : Les Résidus Standardisés
# ------------------------------------------------------------------------------
# Même si le test global n'est pas significatif, on peut observer les écarts
# locaux (résidus) entre la théorie (indépendance) et la réalité (observé).

print("--- Tableau des résidus standardisés ---")
print(test_khi2$residuals)

# Règle d'or du +/- 2 :
# Un résidu compris entre -2 et +2 n'est qu'une fluctuation due au hasard (bruit).
# Un résidu > 2 ou < -2 indique une anomalie significative à analyser sociologiquement.

# 7. Visualisation Graphique des Résidus avec ggplot2
# ------------------------------------------------------------------------------
# On transforme la matrice des résidus en dataframe pour ggplot
res <- as.data.frame(test_khi2$residuals)

# Création du graphique
graph_residus <- ggplot(res, aes(x = Var1, y = Freq, fill = Freq > 0)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Var2) +
  scale_fill_manual(values = c("firebrick", "dodgerblue4"), 
                    labels = c("Sous-représenté", "Sur-représenté")) +
  theme_minimal() +
  labs(title = "Écarts à l'indépendance (Résidus)",
       subtitle = "Attention : Les résidus n'atteignent pas le seuil critique de +/- 2.\nLes écarts visibles ne sont que du bruit statistique (p-value = 0.147).",
       x = "Rang de naissance", 
       y = "Intensité de l'écart (Résidu standardisé)", 
       fill = "Sens de l'écart") +
  theme(plot.subtitle = element_text(color = "firebrick", face = "italic"))

# Afficher le graphique
print(graph_residus)
