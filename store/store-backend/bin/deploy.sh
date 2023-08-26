#!/bin/bash


# Initialisieren Sie die Elastic Beanstalk-Umgebung (nur beim ersten Mal notwendig oder wenn Sie die Umgebung ändern)
eb init "testumgebung" -p "Node.js 18" -r us-east-1

# Erstellen Sie ein neues Anwendungs-Release und bereitstellen Sie es

eb deploy "Testumgebung-env"

# Alternativ: Wenn Sie ein ZIP-Archiv für die Bereitstellung erstellen möchten
# zip -r ../my-app.zip *
# eb deploy --staged
