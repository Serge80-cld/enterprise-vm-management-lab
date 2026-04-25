# Backups – Snapshots & Rotation Automatisés

Ce module gère la création automatique de snapshots locaux avec rotation quotidienne, simulant un mécanisme de sauvegarde inspiré d’Azure Backup ou AWS Backup.

##  Objectif
- Garantir un point de restauration quotidien.
- Automatiser les sauvegardes de la VM.
- Centraliser les logs pour supervision et audit.
- Reproduire un workflow CloudOps réaliste.

##  Script principal
**backup-snapshot.ps1**

Fonctionnalités :
- Création d’un snapshot local.
- Rotation automatique des sauvegardes.
- Journalisation complète de chaque opération.
- Exécution silencieuse (aucune interaction requise).

##  Emplacement des logs
C:\Logs\backups\

Code

Chaque exécution génère un fichier :
backup-YYYYMMDD-HHMM.log

Code

##  Automatisation
Runbook associé : **schedule-backups.ps1**

- Fréquence : tous les jours à 02:00  
- Compte : SYSTEM  
- Définition via XML pour compatibilité totale  
- Remplacement automatique via `-Force`

##  Intégration Dashboard
Les logs générés sont utilisés par :
powershell/dashboard/generate-dashboard.ps1

Code

Le dashboard affiche :
- La date du dernier backup  
- L’état global des opérations  

---

##  Points forts
- Sauvegardes automatisées et fiables  
- Rotation intégrée  
- Logs exploitables et centralisés  
- Architecture CloudOps réaliste  
