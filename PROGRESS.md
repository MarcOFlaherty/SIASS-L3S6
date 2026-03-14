# Suivi du cours SIASS - L3 Sciences Sociales

## État d'avancement du projet
*Dernière mise à jour : 14 mars 2026*

### Séquences terminées
- **Séquence 1 :** Indicateurs de position et de dispersion (EIQ, CV, etc.).
- **Séquence 2 :** Analyse bivariée et spatiale (Élection 2022 vs Revenu Médian, Paris).
  - Statut : **Terminée**.
  - Points forts : Intégration de Plotly pour les graphiques de régression interactifs (tooltips avec formatage conditionnel) et audit complet des questions de TD.
- **Séquence 3 :** Cartographie choroplèthe (sf, ggplot2).

### Séquence en cours
- **Séquence 4 :** Tableaux Croisés & Indépendance (Analyse G. Henri-Panabière).
  - Statut : En cours de création (Fichier `slides_seq4.qmd` initialisé).
  - Focus actuel : Calculs des pourcentages en ligne/colonne, test du Khi-deux et Mosaic plot.

---

## Notes Pédagogiques & Verbatim
### Analyse de la dispersion relative (Le miroir Zemmour / Mélenchon)
> Le miroir Zemmour / Mélenchon : Zemmour a un tout petit EIQ brut (4 points) contre 16 pour Mélenchon. Pourtant, leurs indicateurs relatifs sont quasi identiques : CV à 42% et EIQ Relatif autour de 60%. Cela prouve sociologiquement que ces deux votes fonctionnent exactement de la même manière : ce sont des votes de "niche" très concentrés. Passer des arrondissements qui leur sont défavorables (Q1) à ceux qui leur sont très favorables (Q3) fait bondir leur score moyen de plus de 70% (Rapport Inter-Q > 170%). Et la dynamique est encore plus violente aux extrêmes : d'un bout à l'autre de Paris, le score de Zemmour triple (de 5% à 17%) et celui de Mélenchon quintuple (de 9% à 47%) !

---

## Configuration Technique
- **Stack :** R, Quarto, dplyr, ggplot2, sf, **plotly**.
- **Déploiement :** GitHub Actions -> gh-pages.
- **Spécificité :** Cache R activé.
