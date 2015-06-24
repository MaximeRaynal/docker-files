# PostGre SQL
#### Serveur de base de données.


## Build
Lors du build du dock, un utilisateur par défaut est créé `admin:admin` ainsi qu'une base de donnée `default` . Ils ont vocation à être remplacé par des données via le partage de dock et/ou avec le système hôte.
```bash
docker build -t debian:postgresql .
```
## Run
```bash
# A partir du dossier contenant le Dockerfile
CURRENT_FOLDER=$(dirname $(readlink -f $0));
docker run -d -p 5432:5432 -v /var/lib/postgresql/:$CURRENT_FOLDER/lib \
                           -v /var/log/postgresql/:$CURRENT_FOLDER/log \
                           -v /etc/postgresql/:$CURRENT_FOLDER/etc     \
           --name db_dock debian:postgresql
```

## Config
Les dossiers `lib`, `etc` et `log` sont la pour accueillir respectivement les dossiers :
```bash
/var/lib/postgresql/
/etc/postgresql/
/var/log/postgresql/
```
Pour les remplir après la première exécution et les managé à partir du système hôte :
```bash
# A partir du dossier contenant le Dockerfile
docker cp db_dock:/var/lib/postgresql/9.3 lib
docker cp db_dock:/etc/postgresql/9.3 etc
```
