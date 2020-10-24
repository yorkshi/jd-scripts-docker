#!/bin/bash
trap 'cp /jd-scripts-docker/sync.sh /sync' Exit
git clone --depth=1 https://github.com/chinnkarahoi/jd-scripts-docker.git /jd-scripts-docker_tmp
[ -d /jd-scripts-docker_tmp ] && {
  rm -rf /jd-scripts-docker
  mv /jd-scripts-docker_tmp /jd-scripts-docker
}
git clone --depth=1 https://github.com/lxk0301/scripts.git /scripts_tmp
[ -d /scripts_tmp ] && {
  rm -rf /scripts
  mv /scripts_tmp /scripts
}
cd /scripts || exit 1
npm install || npm install --registry=https://registry.npm.taobao.org || exit 1
cp /crontab.list /crontab.list.old
echo '55 */1 * * * bash /sync >&/proc/1/fd/2' > /crontab.list
for file in $(find /scripts/.github/workflows -type f);do
  cat $file | grep -q 'cron:' && {
    cat $file | grep -q 'node jd_.*\.js' && {
      a=$(cat $file | sed -En "s/^.*cron: '(.*)'.*$/\1/p")
      b=$(cat $file | sed -En 's|^.*node (jd_.*\.js)$|node /scripts/\1|p')
      name=$(cat $file | sed -En "s|^.*name: .运行(.*)|\1|p" | sed "s/'//g")
      echo $file
      script="\"
        exec 1<>/proc/1/fd/1;
        exec 2<>/proc/1/fd/2;
        set -o allexport;
        source /all;
        source /env;
        source /jd-scripts-docker/resolve.sh;
        cd /scripts;
        $b | sed 's/^/$name/';
      \""
      script="$(echo ${script})"
      echo "$a" bash -c "$script" >> /crontab.list
    }
  }
done
crontab -r
crontab /crontab.list || {
  cp /crontab.list.old /crontab.list
  crontab /crontab.list
}
crontab -l
