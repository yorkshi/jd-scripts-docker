#!/bin/bash
cd /
[ -d /scripts ] || {
  git clone https://github.com/lxk0301/scripts.git
}
[ -d /jd-scripts-docker ] || {
  git clone https://github.com/chinnkarahoi/jd-scripts-docker
}
cd /scripts && git checkout . && git pull
npm install || npm install || npm install --registry=https://registry.npm.taobao.org || exit 1
cd /jd-scripts-docker && git checkout . && git pull
cp /crontab.list /crontab.list.old
echo '55 */1 * * * bash /jd-scripts-docker/sync.sh >&/proc/1/fd/2' > /crontab.list
count=0
for file in $(find /scripts/.github/workflows -type f);do
  cat $file | grep -q 'cron:' && {
    cat $file | grep -q 'node jd_.*\.js' && {
      (( count=(count + 3) % 60 ))
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
