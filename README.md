# Terraform – Infrastructure as Code (IaC)

Ce dossier contient la configuration Terraform permettant de déployer une infrastructure Cloud de manière automatisée, reproductible et versionnée.  
L’objectif est de démontrer une approche professionnelle de l’IaC, inspirée des bonnes pratiques AWS, Azure et DevOps.

---

##  Objectifs

- Déployer une infrastructure Cloud de manière déclarative  
- Séparer proprement les fichiers (providers, variables, outputs, modules)  
- Utiliser un backend distant (S3 + DynamoDB) pour le state  
- Structurer le projet comme en entreprise  
- Permettre un `terraform plan` et `terraform apply` propres et reproductibles  

---

##  Structure du projet
terraform/
│
├── main.tf          # Déclaration des ressources principales
├── providers.tf     # Configuration des providers (AWS / Azure)
├── variables.tf     # Variables d'entrée
├── outputs.tf       # Valeurs exportées
├── backend.tf       # Backend S3 + DynamoDB (optionnel)
└── modules/         # Modules réutilisables (VPC, EC2, etc.)

---

##  Contenu des fichiers

### **main.tf**
- Appel des modules  
- Déclaration des ressources principales  
- Architecture Cloud (ex : VPC, EC2, NSG, Storage, etc.)

### **providers.tf**
- Configuration du provider AWS ou Azure  
- Région  
- Version du provider  
- Authentification (profil AWS CLI ou Azure CLI)

### **variables.tf**
- Définition des variables d’entrée  
- Types, descriptions, valeurs par défaut

### **outputs.tf**
- Export des valeurs utiles (IP publique, ID de la VM, VPC ID…)

### **backend.tf** *(optionnel mais recommandé)*
Backend S3 + DynamoDB :

- Stockage du state dans un bucket S3  
- Verrouillage du state via DynamoDB  
- Sécurisation du workflow Terraform  

---

##  Workflow Terraform (pro)

### 1️ Initialisation
terraform init



### 2️ Formatage du code
terraform fmt



### 3️ Validation syntaxique
terraform validate



### 4️ Prévisualisation des changements
terraform plan

C

### 5️ Déploiement
terraform apply

Code

### 6️ Suppression (si besoin)
terraform destroy

---

##  Bonnes pratiques intégrées

- Code formaté (`terraform fmt`)  
- Validation systématique (`terraform validate`)  
- Backend distant pour éviter les conflits de state  
- Modules pour séparer les responsabilités  
- Variables typées et documentées  
- Outputs propres pour intégration avec d’autres outils  

---

##  Points forts

- Structure professionnelle, prête pour un environnement CloudOps  
- Compatible AWS et Azure  
- Approche modulaire et maintenable  
- Workflow IaC complet et reproductible  
- Idéal pour démontrer des compétences Terraform en entretien  

