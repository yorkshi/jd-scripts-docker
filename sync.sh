#!/bin/bash
trap 'cp /jd-scripts-docker/sync.sh /sync' Exit
(
  exec 2<>/dev/null
  set -e
  cd /jd-scripts-docker
  git checkout .
  git pull
) || {
  git clone https://github.com/chinnkarahoi/jd-scripts-docker.git /jd-scripts-docker_tmp
  [ -d /jd-scripts-docker_tmp ] && {
    rm -rf /jd-scripts-docker
    mv /jd-scripts-docker_tmp /jd-scripts-docker
  }
}
(
  exec 2<>/dev/null
  set -e
  cd /scripts
  git checkout .
  git pull
) || {
  git clone --branch=master https://github.com/chinnkarahoi/jd_scripts.git /scripts_tmp
  [ -d /scripts_tmp ] && {
    rm -rf /scripts
    mv /scripts_tmp /scripts
  }
}
(
  exec 2<>/dev/null
  set -e
  cd /loon
  git checkout .
  git pull
) || {
  git clone --branch=main https://github.com/chinnkarahoi/Loon.git /loon_tmp
  [ -d /loon_tmp ] && {
    rm -rf /loon
    mv /loon_tmp /loon
  }
}
cd /scripts || exit 1
npm install || npm install --registry=https://registry.npm.taobao.org || exit 1
[ -f /crontab.list ] && {
  cp /crontab.list /crontab.list.old
}
cat /etc/os-release | grep -q ubuntu && {
  cp /jd-scripts-docker/crontab.list /crontab.list
  crontab -r
} || {
  cat /scripts/docker/crontab_list.sh | grep 'node' | sed 's/>>.*$//' | awk '
  BEGIN{
    print("55 */3 * * *  bash /jd-scripts-docker/cron_wrapper bash /sync")
    print("33 */5 * * * bash /jd-scripts-docker/cron_wrapper node /scripts/jd_newYearMoney.js")
  }
  {
    for(i=1;i<=5;i++)printf("%s ",$i);
    printf("bash /jd-scripts-docker/cron_wrapper \"");
    for(i=6;i<=NF;i++)printf(" %s", $i);
    print "\"";
  }
  ' > /crontab.list
  cat /loon/docker/crontab_list.sh | grep 'node' | sed 's/>>.*$//' | awk '
  {
    for(i=1;i<=5;i++)printf("%s ",$i);
    printf("bash /jd-scripts-docker/cron_wrapper \"");
    for(i=6;i<=NF;i++)printf(" %s", $i);
    print "\"";
  }
  ' >> /crontab.list
  cat /custom.list >> /crontab.list
}

crontab /crontab.list || {
  cp /crontab.list.old /crontab.list
  crontab /crontab.list
}
crontab -l


