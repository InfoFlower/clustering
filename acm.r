#Projet R
install.packages('factoextra')



#Code de preparations des données
library(explor)
library(FactoMineR)
library(FactoInvestigate)
library(ggplot2)
library(factoextra)
#library(Factoshiny)
#Question1: Obtenir un nombre aléatoire entre 2007 et 2019
set.seed(1)
str(data_cli)
###############################################################################################
#                                               Partie2
###############################################################################################

#data
data_a=data_cli=read.csv('C:/Users/lenovo/Desktop/Cours/clustering/data_clean_regroup.csv')
data_cli=read.csv('C:/Users/lenovo/Desktop/Cours/clustering/data_clean_regroup_cli.csv',sep=';')

# Convertir toutes les colonnes en facteurs
data_cli <- data.frame(lapply(data_cli, as.factor))


#Dataframe des variables réseaux et mobiles
data_cli=data_cli[,-1]

vars_sup=c('logmt','sitfam','tr_age','revfym')
#ACM ZER
mca = MCA(data_cli)
explor(mca)
#Classification hiérarchique 
HCPC=HCPC(mca,nb.clust = 3, graph = FALSE)
names(HCPC)
dim(data_cli)

#dendogramme individus cluster couleurs
fviz_dend(HCPC, show_labels = FALSE, k_colors = c("#619cff", "#0dbb40", "#f8766d"))
#cluster ACM
fviz_cluster(HCPC, geom = "point", main = "Clusters des individus")



#Statistiques descriptives
datadesc = subset(data95prenom, select = c("FACEMEET", "FACENEWS", "FACEPHO", "FACEPROF", "FACEFUN",
                                           "MOBAPPLI", "MOBEMAIL", "MOBHANGS1", "MOBHANGS2", "MOBINTER", "MOBMAPS",
                                           "AGE6FUZ", "AGGLO5", "DIPL5", "NBPERS5", "PCS8EGO", "REVTOT6", "SEXE", "TYPOSQT"))
datadesc = datadesc[datadesc$MOBAPPLI != 99,]
datadesc = datadesc[datadesc$FACEMEET != 99,]


nsp = apply(datadesc[1:11], 1, function(row) any(row ==1))
dataacm = subset(dataacm[1:11], !nsp)

hist(datadesc$DIPL5)
hist(datadesc$AGE6FUZ)
hist(datadesc$PCS8EGO)
cor(datadesc$DIPL5,datadesc$AGE6FUZ)

explor(mca)