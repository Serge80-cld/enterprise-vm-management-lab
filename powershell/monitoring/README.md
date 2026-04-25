# Monitoring – VM Health Check (CPU / RAM / Disques)

Ce module assure la surveillance continue de la machine virtuelle en collectant les métriques essentielles toutes les 5 minutes via une tâche planifiée SYSTEM.

##  Objectif
- Surveiller l’état de la VM en continu.
- Générer des logs structurés pour le dashboard HTML.
- Reproduire un monitoring type Azure Monitor / AWS CloudWatch.

##  Script principal
**monitor-vm.ps1**

Ce script collecte :
- Utilisation CPU (%)
- Mémoire disponible (MB)
- Utilisation des disques (%)
- Timestamp de l’exécution

Les données sont enregistrées dans un fichier journal daté.

##  Emplacement des logs
C:\Logs\monitoring\



Chaque exécution génère un fichier :
monitoring-YYYYMMDD-HHMM.log



##  Automatisation
Runbook associé : **schedule-monitoring.ps1**

- Fréquence : toutes les 5 minutes  
- Compte : SYSTEM  
- Définition via XML pour compatibilité totale  
- Exécution silencieuse (aucune fenêtre PowerShell)

##  Intégration Dashboard
Les logs générés sont utilisés par :
powershell/dashboard/generate-dashboard.ps1

Code

Ce qui permet d’afficher :
- Le dernier état de santé de la VM  
- Les métriques CPU/RAM/Disques  
- La date de la dernière collecte  

---

##  Points forts
- Monitoring automatique sans agent  
- Logs structurés et exploitables  
- Compatible Windows 10/11 / Server  
- Architecture CloudOps réaliste  
