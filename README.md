```sh
docker-compose up --force-recreate --detach jd1
```
```sh
docker exec -t jd1 bash -c 'set -o allexport; source /all; source /env; cd /scripts; ls jd_*.js | xargs -i node {}'
```
```sh
docker-compose logs -f jd1
```
