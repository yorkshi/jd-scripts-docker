#!/bin/bash
trap 'cp /jd-scripts-docker/sync.sh /sync' Exit
git clone --depth=1 https://github.com/chinnkarahoi/jd-scripts-docker.git /jd-scripts-docker_tmp
[ -d /jd-scripts-docker_tmp ] && {
  rm -rf /jd-scripts-docker
  mv /jd-scripts-docker_tmp /jd-scripts-docker
}
git clone --depth=1 https://github.com/lxk0301/jd_scripts.git /scripts_tmp
[ -d /scripts_tmp ] && {
  rm -rf /scripts
  mv /scripts_tmp /scripts
}
cd /scripts || exit 1

npm install || npm install --registry=https://registry.npm.taobao.org || exit 1
cp /crontab.list /crontab.list.old
cp /jd-scripts-docker/crontab.list /crontab.list
crontab -r
crontab /crontab.list || {
  cp /crontab.list.old /crontab.list
  crontab /crontab.list
}
crontab -l
