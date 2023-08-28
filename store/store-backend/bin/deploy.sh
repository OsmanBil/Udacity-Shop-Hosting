#!/bin/bash

# Initialisieren der Elastic Beanstalk-Umgebung (nur beim ersten Mal notwendig oder wenn Sie die Umgebung ändern)
eb init "testumgebung" -p "Node.js 18" -r us-east-1

eb setenv POSTGRES_DB=$POSTGRES_DB POSTGRES_HOST=$POSTGRES_HOST POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_USER=$POSTGRES_USER

# Erstellen Sie ein neues Anwendungs-Release und bereitstellen Sie es
eb deploy "Testumgebung-env"