# Dock de prod pour application python 3.4 / uwsgi
# Pour mettre à jours les sources il faut relancer le dock
FROM ubuntu:latest
MAINTAINER Maxime Rayanal <me@maxproject.fr>

ENV GIT_URL 'http://github.io/user/project.git'

# Il faut remplacer __application__ par le nom de l'application
ENV PROJECT_DIRECTORY '/var/www/__application__'

# Container pour les commandes APT
RUN apt-get -y update && \
    apt-get install -y --force-yes --fix-missing \
    python3.4-dev python3-pip

# Installation de l'application et des dépendance
RUN mkdir $PROJECT_DIRECTORY

WORKDIR ${PROJECT_DIRECTORY}

# Au lancement on déploie l'application,
# on installe les dépendances, on update la bd et on lance uwsgi
CMD git clone $GIT_URL $PROJECT_DIRECTORY && \
    python3.4 -m pip install -r $PROJECT_DIRECTORY/requirements.txt
    python3.4 $PROJECT_DIRECTORY/manage.py makemigrations && \
    python3.4 $PROJECT_DIRECTORY/manage.py migrate && \
    uwsgi --uid www-data --gid www-data --socket :9090 \
    --wsgi-file $PROJECT_DIRECTORY/__application__/wsgi.py
# Il faut penser à modifier le chemin vers wsgi.py /|\