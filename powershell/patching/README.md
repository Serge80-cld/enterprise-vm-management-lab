# Patching – Windows Update Automatisé

Ce module gère l’installation automatique des mises à jour Windows, de manière fiable et silencieuse, comme dans un environnement d’entreprise.

##  Objectif
- Automatiser le patching hebdomadaire.
- Garantir la conformité et la sécurité de la VM.
- Reproduire un fonctionnement proche d’Azure Update Manager ou AWS Systems Manager.

##  Script principal
**patch-windows.ps1**

Fonctionnalités :
- Recherche des mises à jour disponibles.
- Installation automatique.
- Journalisation complète de chaque opération.
- Exécution silencieuse (aucune interaction requise).

##  Emplacement des logs
C:\Logs\patching\

Code

Chaque exécution génère un fichier :
patching-YYYYMMDD-HHMM.log

Code

##  Automatisation
Runbook associé : **schedule-patching.ps1**

- Fréquence : chaque dimanche à 03:00  
- Compte : SYSTEM  
- Définition via XML pour compatibilité totale  
- Remplacement automatique via `-Force`

##  Intégration Dashboard
Les logs générés sont utilisés par :
powershell/dashboard/generate-dashboard.ps1

Code

Le dashboard affiche :
- La date du dernier patching  
- L’état global des opérations  

---

##  Points forts
- Automatisation complète du cycle de patching  
- Logs exploitables et centralisés  
- Exécution SYSTEM fiable  
- Architecture CloudOps réaliste  
