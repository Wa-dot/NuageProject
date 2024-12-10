# NuageProject

## Description
Ce projet vise à créer une API de gestion de boutiques avec des produits et des utilisateurs, et déployée sur Azure via Terraform.

## Structure du projet
- `/.github/` : Pour les workflows
- `/infrastructure/` : Code pour déployer l'infrastructure sur Azure avec Terraform

## Prérequis
- Terraform
- Docker
- Azure
- Python

## Installation (back)
### Python installation

Installation de l'environnement python pour le fonctionnement du back.
```bash
python -m venv venv
source venv/bin/activate  # Sur Windows, utilisez venv\Scripts\activate
```

Installation des librairies python.
```python
pip install -r requirements.txt
```

Lancement du back pour le tester : 
```bash
python app.py
```