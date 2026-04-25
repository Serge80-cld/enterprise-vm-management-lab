# Hardening – Durcissement Windows Automatisé

Ce module applique un ensemble de règles de sécurité essentielles pour renforcer la posture de la VM, en s’inspirant des bonnes pratiques SecOps et CIS Benchmarks.

##  Objectif
- Améliorer la sécurité de la VM.
- Appliquer un durcissement mensuel automatisé.
- Standardiser les paramètres critiques (services, firewall, audit).
- Reproduire un workflow SecOps réaliste.

##  Script principal
**hardening-windows.ps1**

Actions typiques :
- Configuration des services sensibles
- Renforcement du pare-feu Windows
- Activation de politiques d’audit
- Nettoyage et vérifications système
- Journalisation complète

##  Emplacement des logs
C:\Logs\hardening\

Code

Chaque exécution génère un fichier :
hardening-YYYYMMDD-HHMM.log

Code

##  Automatisation
Runbook associé : **schedule-hardening.ps1**

- Fréquence : 1er de chaque mois à 04:00  
- Compte : SYSTEM  
- Définition via XML pour compatibilité totale  
- Exécution silencieuse et fiable  

##  Intégration Dashboard
Les logs générés sont utilisés par :
powershell/dashboard/generate-dashboard.ps1

Code

Le dashboard affiche :
- La date du dernier hardening  
- L’état global des opérations  

---

##  Points forts
- Durcissement automatisé et reproductible  
- Logs centralisés et exploitables  
- Exécution SYSTEM robuste  
- Aligné avec les pratiques SecOps / CloudOps  
