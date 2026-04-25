# Runbooks – Automatisation via Scheduled Tasks SYSTEM

Ce dossier contient l’ensemble des runbooks responsables de l’automatisation complète de la VM : monitoring, patching, backups et hardening.  
Chaque runbook crée une tâche planifiée SYSTEM via XML, garantissant une exécution fiable, silencieuse et compatible avec les environnements d’entreprise.

##  Objectif
- Automatiser les opérations récurrentes de la VM.
- Standardiser la création de tâches planifiées.
- Reproduire un fonctionnement proche d’Azure Automation, AWS Systems Manager ou Intune Remediation.
- Centraliser la logique d’orchestration dans un dossier unique.

##  Runbooks disponibles

### **schedule-monitoring.ps1**
- Fréquence : toutes les 5 minutes  
- Action : exécute `monitor-vm.ps1`  
- Objectif : collecte CPU/RAM/Disques en continu  

### **schedule-patching.ps1**
- Fréquence : chaque dimanche à 03:00  
- Action : exécute `patch-windows.ps1`  
- Objectif : installation automatique des mises à jour  

### **schedule-backups.ps1**
- Fréquence : tous les jours à 02:00  
- Action : exécute `backup-snapshot.ps1`  
- Objectif : snapshot + rotation quotidienne  

### **schedule-hardening.ps1**
- Fréquence : 1er du mois à 04:00  
- Action : exécute `hardening-windows.ps1`  
- Objectif : durcissement Windows mensuel  

---

##  Fonctionnement technique

Chaque runbook :
- génère un fichier XML contenant la définition complète de la tâche planifiée  
- crée ou remplace la tâche via `Register-ScheduledTask -Force`  
- exécute sous le compte **SYSTEM (S-1-5-18)**  
- garantit une exécution silencieuse (aucune fenêtre PowerShell)  
- journalise les opérations dans le dossier du module concerné  

---

##  Exemple de structure XML générée

```xml
<Task version="1.4">
  <Triggers>
    <CalendarTrigger>
      <ScheduleByDay>
        <DaysInterval>1</DaysInterval>
      </ScheduleByDay>
    </CalendarTrigger>
  </Triggers>
  <Principals>
    <Principal id="Author" runLevel="HighestAvailable">
      <UserId>S-1-5-18</UserId>
    </Principal>
  </Principals>
</Task>
