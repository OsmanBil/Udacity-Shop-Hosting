#!/bin/bash

# Navigiere ins Backend-Verzeichnis
cd store/store-backend

# Installiere Abhängigkeiten und baue das Backend
npm install
npm run build

# Setze den Namen deiner Elastic Beanstalk-Umgebung
EB_ENV_NAME=Testumgebung-env

# Deploy zum Elastic Beanstalk
eb deploy $EB_ENV_NAME
