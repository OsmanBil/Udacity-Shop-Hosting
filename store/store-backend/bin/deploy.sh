# #!/bin/bash

# # Navigiere ins Backend-Verzeichnis
# cd store/store-backend

# # Installiere Abhängigkeiten und baue das Backend
# npm install
# npm run build

# # Setze den Namen deiner Elastic Beanstalk-Umgebung
# EB_ENV_NAME=Testumgebung-env

# # Deploy zum Elastic Beanstalk
# eb deploy $EB_ENV_NAME

# Initialisieren Sie die Elastic Beanstalk-Umgebung (nur beim ersten Mal notwendig oder wenn Sie die Umgebung ändern)
eb init "Testumgebung-env" -p "Node.js 14"

# Erstellen Sie ein neues Anwendungs-Release und bereitstellen Sie es
eb deploy "Testumgebung-env"

# Alternativ: Wenn Sie ein ZIP-Archiv für die Bereitstellung erstellen möchten
# zip -r ../my-app.zip *
# eb deploy --staged
