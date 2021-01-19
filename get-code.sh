f(){
  a=${!1}
  a=${a/@/}
  echo $1="\${$1:-$a}"
}
for srv in $(docker-compose config --services);do
  line="$(docker exec $srv bash -c 'set -o allexport; source /all; source /env; source /jd-scripts-docker/resolve.sh; cd /scripts; node jd_get_share_code.js')"
  FRUITSHARECODES+=@$(echo "$line" | grep 东农场 | grep -Eo '[^】 ]*$')
  PETSHARECODES+=@$(echo "$line" | grep 东萌宠 | grep -Eo '[^】 ]*$')
  PLANT_BEAN_SHARECODES+=@$(echo "$line" | grep 种豆得豆 | grep -Eo '[^】 ]*$')
  DDFACTORY_SHARECODES+=@$(echo "$line" | grep 东工厂 | grep -Eo '[^】 ]*$')
  DREAM_FACTORY_SHARE_CODES+=@$(echo "$line" | grep 喜工厂 | grep -Eo '[^】 ]*$')
  JDZZ_SHARECODES+=@$(echo "$line" | grep 赚赚 | grep -Eo '[^】 ]*$')
  JXNC_SHARECODES+=@$(echo "$line" | grep 喜农场助力码 | grep -Eo '[^】 ]*$')
  JDJOY_SHARECODES+=@$(echo "$line" | grep -i joy | grep -Eo '[^】 ]*$')
done
f FRUITSHARECODES
f PETSHARECODES
f PLANT_BEAN_SHARECODES
f DDFACTORY_SHARECODES
f DREAM_FACTORY_SHARE_CODES
f JDZZ_SHARECODES
f JXNC_SHARECODES
f JDJOY_SHARECODES
f JDNIAN_SHARECODES
