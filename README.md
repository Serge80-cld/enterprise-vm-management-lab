Enterprise VM Management Lab — CloudOps Automation (PowerShell)
Ce projet est un lab CloudOps complet, conçu pour reproduire les opérations d’une VM d’entreprise : monitoring, patching, backups, hardening, runbooks automatisés et dashboard HTML.
Il démontre des compétences clés en PowerShell, automatisation, gestion d’infrastructure, et pratiques Ops modernes inspirées d’Azure, AWS et Intune.
 Objectifs
Automatiser la gestion d’une VM comme en production

Mettre en place des runbooks PowerShell exécutés en SYSTEM

Centraliser les logs et opérations dans une structure claire

Générer un dashboard HTML pour la supervision

Fournir un dépôt GitHub professionnel, lisible et réutilisable

Structure du projet
Code
powershell/
│
├── maintenance/      # Vérifications système
├── monitoring/       # Collecte CPU/RAM/Disques
├── patching/         # Windows Update automatisé
├── backups/          # Snapshots + rotation
├── hardening/        # Durcissement Windows
├── runbooks/         # Tâches planifiées (XML)
└── dashboard/        # Génération du dashboard HTML

dashboard.html        # Portail Ops généré automatiquement
⚙️ Automatisation (Runbooks)
Chaque runbook crée une Scheduled Task SYSTEM via XML pour une compatibilité totale.

Runbook	Fréquence	Description
Monitoring	Toutes les 5 min	Collecte CPU, RAM, disques → logs
Patching	Hebdo (dimanche 03:00)	Installation des mises à jour
Backups	Quotidien (02:00)	Snapshot + rotation
Hardening	Mensuel (1er à 04:00)	Durcissement Windows


Les logs sont stockés dans :

Code
C:\Logs\monitoring
C:\Logs\backups
C:\Logs\hardening
Dashboard HTML
Le fichier dashboard.html affiche :

Dernier monitoring

Dernier backup

Dernier hardening

État des tâches planifiées VM-*

Vue synthétique de la santé de la VM

Ce dashboard peut être ouvert dans n’importe quel navigateur et sert de mini portail Ops.

🧩 Technologies & Concepts
PowerShell 5+

Scheduled Tasks SYSTEM

XML Task Definitions

Logging structuré

HTML/CSS

Architecture CloudOps inspirée d’Azure Automation, AWS Systems Manager, Intune Remediation

Auteur
Serge — Cloud / Modern Workplace Engineer  
Lab conçu pour démontrer des compétences CloudOps, automatisation et gestion d’infrastructure.
