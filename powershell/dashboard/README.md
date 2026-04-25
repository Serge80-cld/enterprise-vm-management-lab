# Dashboard – Portail Ops HTML

Ce module génère un tableau de bord HTML permettant de visualiser l’état global de la VM : monitoring, patching, backups et hardening.  
Il s’agit d’un mini portail Ops, simple, lisible et exploitable dans n’importe quel navigateur.

##  Objectif
- Centraliser les informations clés de la VM.
- Offrir une vue synthétique des opérations automatisées.
- Faciliter la supervision sans outils externes.
- Reproduire un fonctionnement proche d’un portail CloudOps.

##  Script principal
**generate-dashboard.ps1**

Fonctionnalités :
- Lecture des derniers logs (monitoring, patching, backups, hardening)
- Extraction des informations clés
- Génération d’un fichier HTML dynamique
- Mise en forme simple et lisible

##  Fichier généré
dashboard.html

Code

Ce fichier peut être ouvert directement dans :
- Microsoft Edge  
- Google Chrome  
- Firefox  
- ou tout autre navigateur

##  Sources utilisées
Le script lit les logs dans :
C:\Logs\monitoring\
C:\Logs\patching\
C:\Logs\backups\
C:\Logs\hardening\

Code

##  Contenu du dashboard
Le tableau de bord affiche :
- Dernier état CPU / RAM / Disques  
- Dernier patching  
- Dernier backup  
- Dernier hardening  
- État des tâches planifiées `VM-*`  
- Date et heure de la dernière mise à jour  

## ✔️ Points forts
- Vue centralisée et immédiate de la santé de la VM  
- Aucun outil externe requis  
- Compatible Windows 10/11 / Server  
- Idéal pour démontrer une approche CloudOps / Modern Workplace  
