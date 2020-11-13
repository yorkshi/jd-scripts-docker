code1=
code2=
code3=
code4=
for srv in $(docker-compose config --services);do
  CMD="docker logs $srv 2>/dev/null"
  line="$(eval $CMD | grep -A1 '互助码' | grep -v '^--$' | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" | sed 'N;s/\n/ /' | sort -u )"
  [ -z "$code1" ] || code1+=@
  [ -z "$code2" ] || code2+=@
  [ -z "$code3" ] || code3+=@
  [ -z "$code4" ] || code4+=@
  code1+=$(echo "$line" | grep "东东农场" | head -n 1 | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
  code2+=$(echo "$line" | grep "东东萌宠" | head -n 1 | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
  code3+=$(echo "$line" | grep "种豆得豆" | head -n 1 | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
  code4+=$(echo "$line" | grep "京小超" | head -n 1 | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
done
echo FRUITSHARECODES=$code1
echo PETSHARECODES=$code2
echo PLANT_BEAN_SHARECODES=$code3
echo SUPERMARKET_SHARECODES=$code4
