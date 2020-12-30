f(){
  a=${!1}
  a=${a/@/}
  echo $1=$a
}
for srv in jd1 jd2 jd3;do
  line="$(docker logs $srv | grep 京东账号 | grep 互助码 | sort -u)"
  FRUITSHARECODES+=@$(echo "$line" | grep jd_fruit.js | grep -Eo '[^】 ]*$')
  PETSHARECODES+=@$(echo "$line" | grep jd_pet.js | grep -Eo '[^】 ]*$')
  PLANT_BEAN_SHARECODES+=@$(echo "$line" | grep jd_plantBean.js | grep -Eo '[^】 ]*$')
  DDFACTORY_SHARECODES+=@$(echo "$line" | grep jd_jdfactory.js | grep -Eo '[^】 ]*$')
  DREAM_FACTORY_SHARE_CODES+=@$(echo "$line" | grep jd_dreamFactory.js | grep -Eo '[^】 ]*$')
  JDZZ_SHARECODES+=@$(echo "$line" | grep jd_jdzz.js | grep -Eo '[^】 ]*$')
  JDJOY_SHARECODES+=@$(echo "$line" | grep jd_crazy_joy.js | grep -Eo '[^】 ]*$')
done
f FRUITSHARECODES
f PETSHARECODES
f PLANT_BEAN_SHARECODES
f DDFACTORY_SHARECODES
f DREAM_FACTORY_SHARE_CODES
f JDZZ_SHARECODES
f JDJOY_SHARECODES
